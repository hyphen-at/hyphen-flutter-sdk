
import 'package:flutter/material.dart';
import 'package:hyphen_flutter_sdk/src/core/common/twofactor/hyphen_2fa_status.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class HyphenUI {
  static Hyphen2FAStatus? pendingTwoFactorStatus;

  static void handleHyphenIntent(BuildContext context, Map<String, dynamic>? routeArguments) {
  final hyphenNotificationType = routeArguments?['hyphen:type'];
  final hyphenData = routeArguments?['hyphen:data'];

  if (hyphenNotificationType != null && hyphenData != null) {
    handle(context, hyphenNotificationType, hyphenData);
  }
}

  static void onFirebaseMessageReceived(BuildContext context, RemoteMessage message) {
    final data = message.data;

    final hyphenNotificationType = data["hyphen:type"];
    final hyphenData = data["hyphen:data"];

    handle(context, hyphenNotificationType ?? '', hyphenData ?? '');
  }

  static void handle(BuildContext context, String hyphenNotificationType, String hyphenData) {
    // if (hyphenNotificationType == "2fa-request") {
    //   final twoFactorRequest = HyphenResponseSignIn2FA.fromJson(hyphenData);
    //   pendingTwoFactorStatus = twoFactorRequest.twoFactorAuth;

    //   final intent = Intent(context, Hyphen2FAActivity::class.java);
    //   intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK;
    //   context.startActivity(intent);
    // } else if (hyphenNotificationType == "2fa-status-change") {
    //   final twoFactorRequest = HyphenResponseSignIn2FA.fromJson(hyphenData);
    //   HyphenEventBus.post(HyphenEventBusType.Show2FAWaitingProgressModal(show: false));

    //   if (twoFactorRequest.twoFactorAuth.status == Hyphen2FAStatusType.APPROVED) {
    //     Timer(Duration(seconds: 3), () {
    //       HyphenEventBus.post(
    //         HyphenEventBusType.TwoFactorAuthApproved(
    //           requestId: twoFactorRequest.twoFactorAuth.request.id,
    //         ),
    //       );
    //     });
    //   } else if (twoFactorRequest.twoFactorAuth.status == Hyphen2FAStatusType.DENIED) {
    //     HyphenEventBus.post(HyphenEventBusType.TwoFactorAuthDenied);
    //   }
    // }
  }
}
