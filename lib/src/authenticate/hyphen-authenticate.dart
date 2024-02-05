// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:hyphen_flutter_sdk/src/core/common/account/hyphen_account.dart';
// import 'package:hyphen_flutter_sdk/src/core/common/device/hyphen_device.dart';
// import 'package:hyphen_flutter_sdk/src/core/common/device/hyphen_device_type.dart';
// import 'package:hyphen_flutter_sdk/src/core/common/hyphen_os_name.dart';
// import 'package:hyphen_flutter_sdk/src/core/common/hyphen_user_type.dart';
// import 'package:hyphen_flutter_sdk/src/core/common/key/hyphen_user_key.dart';
// import 'package:hyphen_flutter_sdk/src/core/crypto/hyphen_cryptography.dart';
// import 'package:hyphen_flutter_sdk/src/core/error/hyphen_sdk_error.dart';
// import 'package:hyphen_flutter_sdk/src/core/eventbus/hyphen_event_bus.dart';
// import 'package:hyphen_flutter_sdk/src/core/eventbus/hyphen_event_bus_type.dart';
// import 'package:hyphen_flutter_sdk/src/core/hyphen.dart';
// import 'package:hyphen_flutter_sdk/src/networking/request/hyphen_request_2fa_finish.dart';
// import 'package:hyphen_flutter_sdk/src/networking/request/hyphen_request_edit_device.dart';
// import 'package:hyphen_flutter_sdk/src/networking/request/hyphen_request_sign_in_2fa.dart';
// import 'package:hyphen_flutter_sdk/src/networking/request/hyphen_request_sign_in_challenge.dart';
// import 'package:hyphen_flutter_sdk/src/networking/request/hyphen_request_sign_in_challenge_respond.dart';

// class HyphenAuthenticate {
//   static HyphenAccount? account;
//   static late Activity activity;
//   static ProgressDialog? loadingDialog;

//   static Future<HyphenAccount> getAccount(BuildContext context) async {
//     if (account != null) {
//       return account!;
//     }

//     final accountResult = await HyphenNetworking.Account.getAccount().getOrThrow();
//     await updateDeviceInformation(context);

//     account = accountResult;

//     return accountResult;
//   }

//   static Future<void> authenticate(Activity activity, String webClientId) async {
//     FirebaseAuth.instance.signOut();
//     GoogleSignIn(options: GoogleSignInOptions.standard())
//         .signOut()
//         .then((_) {});

//     final authCredential = await HyphenGoogleAuthenticate.authenticate(activity, webClientId);

//     HyphenAuthenticate.activity = activity;
//     HyphenAuthenticate.activity.runOnUiThread(() {
//       loadingDialog = ProgressDialog.show(
//         HyphenAuthenticate.activity!,
//         "",
//         "Hyphen authenticating...",
//       );
//     });

//     final authResult = await Firebase.auth.signInWithCredential(authCredential.credential!);

//     debugPrint("Add firebase user...");
//     debugPrint("Firebase authenticate successfully. User -> ${authResult.user?.displayName} (${authResult.user?.email})");

//     final idToken = await authResult.user?.getIdToken(false);
//     debugPrint("FIDToken -> $idToken");

//     if (!HyphenCryptography.isDeviceKeyExist()) {
//       debugPrint("Hyphen device key not found! Generate new device key...");

//       HyphenCryptography.generateKey();

//       await requestSignIn2FA(idToken!, getHyphenUserKey(activity));
//     } else {
//       debugPrint("Request authenticate challenge...");
//       final userKey = getHyphenUserKey(activity);

//       try {
//         final challengeRequest = await HyphenNetworking.Auth.signInChallenge(
//           payload: HyphenRequestSignInChallenge(
//             challengeType: "deviceKey",
//             request: Request(
//               method: "firebase",
//               token: idToken!,
//               chainName: Hyphen.network == NetworkType.TESTNET ? "flow-testnet" : "flow-mainnet",
//             ),
//             publicKey: userKey.publicKey!,
//           ),
//         ).getOrThrow();
//         final challengeData = challengeRequest.challengeData;

//         final challengeSignature = Crypto.normalizeSignature(
//           signature: HyphenCryptography.signData(challengeData.codeUnits)!,
//           ecCoupleComponentSize: 32,
//         );
//         final challengeRespondRequest = await HyphenNetworking.Auth.signInChallengeRespond(
//           payload: HyphenRequestSignInChallengeRespond(
//             challengeType: "deviceKey",
//             challengeData: challengeData,
//             deviceKey: HyphenRequestSignInChallengeRespond.DeviceKey(
//               signature: challengeSignature.toByteString().hex,
//             ),
//           ),
//         ).getOrThrow();

//         account = challengeRespondRequest.account;
//         Hyphen.saveCredential(challengeRespondRequest.credentials);

//         HyphenAuthenticate.activity.runOnUiThread(() {
//           loadingDialog?.hide();
//           loadingDialog = null;
//         });
//       } catch (e) {
//         debugPrint("Request challenge failed. Attempting 2FA request for another device...");
//         await requestSignIn2FA(idToken!, userKey);
//       }
//     }
//   }

//   static Future<void> updateDeviceInformation(BuildContext context) async {
//     final userKey = getHyphenUserKey(context);

//     await HyphenNetworking.Device.editDevice(
//       publicKey: userKey.publicKey!,
//       payload: HyphenRequestEditDevice(
//         pushToken: userKey.device?.pushToken ?? "",
//       ),
//     );

//     debugPrint("Update device information successfully.");
//   }

//   static Future<void> requestSignIn2FA(String idToken, HyphenUserKey userKey) async {
//     debugPrint("Request Hyphen 2FA authenticate...");

//     await HyphenNetworking.Auth.signIn2FA(
//       payload: HyphenRequestSignIn2FA(
//         request: HyphenRequestSignIn2FA.Request(
//           method: "firebase",
//           token: idToken,
//           chainName: Hyphen.network == Hyphen.NetworkType.TESTNET ? "flow-testnet" : "flow-mainnet",
//         ),
//         userKey: userKey,
//       ),
//     ).suspendOnSuccess(
//       onSuccess: (result) async {
//         debugPrint("Request Hyphen 2FA authenticate successfully. Please check your another device.");

//         HyphenAuthenticate.activity.runOnUiThread(() {
//           loadingDialog?.setMessage("Request Hyphen 2FA authenticate successfully. Please check your another device.");
//         });

//         HyphenEventBus.post(HyphenEventBusType.show2FAWaitingProgressModal(show: true));

//         final requestId = await suspendCoroutine((continuation) {
//           HyphenEventBus.observe((event) {
//             if (event is HyphenEventBusType.twoFactorAuthDenied) {
//               debugPrint("2FA denied");

//               HyphenAuthenticate.activity.runOnUiThread(() {
//                 loadingDialog?.hide();
//                 loadingDialog = null;
//               });

//               continuation.resumeWithException(TwoFactorDenied);
//             } else if (event is HyphenEventBusType.TwoFactorAuthApproved) {
//               debugPrint("2FA approved");

//               continuation.resume(event.requestId);
//             }
//           });
//         });

//         final result = await HyphenNetworking.Auth.twoFactorFinish(
//           payload: HyphenRequest2FAFinish(
//             twoFactorAuthRequestId: requestId,
//           ),
//         ).getOrThrow();

//         account = result.account;
//         Hyphen.saveCredential(result.credentials);

//         HyphenAuthenticate.activity.runOnUiThread(() {
//           loadingDialog?.hide();
//           loadingDialog = null;
//         });
//       },
//     ).suspendOnError(
//       onError: (error) async {
//         if (error.errorBody?.string()?.contains("please sign up") == true) {
//           debugPrint("Request Hyphen 2FA authenticate... - Failed -> Sign up needed");
//           debugPrint("Request Hyphen Sign up...");

//           final result = await HyphenNetworking.Auth.signUp(
//             payload: HyphenRequestSignUp(
//               method: "firebase",
//               token: idToken,
//               chainName: Hyphen.network == Hyphen.NetworkType.TESTNET ? "flow-testnet" : "flow-mainnet",
//               userKey: userKey,
//             ),
//           ).getOrThrow();

//           account = result.account;
//           Hyphen.saveCredential(result.credentials);

//           HyphenAuthenticate.activity.runOnUiThread(() {
//             loadingDialog?.hide();
//             loadingDialog = null;
//           });
//         }
//       },
//     );
//   }

//   static Future<HyphenUserKey> getHyphenUserKey(BuildContext context) async {
//     final fcmToken = await FirebaseMessaging.instance.getToken();
//     final publicKey = HyphenCryptography.getPublicKeyHex();

//     final deviceInformation = await DeviceName().request();

//     return HyphenUserKey(
//       type: HyphenUserType.DEVICE,
//       device: HyphenDevice(
//         id: null,
//         publicKey: publicKey,
//         pushToken: fcmToken ?? "",
//         name: deviceInformation.model ?? "",
//         osName: HyphenOSName.ANDROID, //to-do: fix
//         deviceManufacturer: deviceInformation.manufacturer ?? "",
//         deviceModel: deviceInformation.marketName ?? "",
//         lang: Localizations.localeOf(context).toLanguageTag(),
//         osVersion: "Build.VERSION.RELEASE", //to-do: fix
//         type: HyphenDeviceType.MOBILE,
//       ),
//       publicKey: publicKey,
//       wallet: null,
//     );
//   }
// }
