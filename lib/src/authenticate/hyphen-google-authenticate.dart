// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:hyphen_flutter_sdk/src/authenticate/hyphen-authenticate_delegate.dart';
// import 'package:hyphen_flutter_sdk/src/core/error/hyphen_sdk_error.dart';


// class HyphenGoogleAuthenticate {
//   static Future<AuthResult> authenticate(
//     HyphenAuthenticateDelegate activity,
//     String webClientId,
//   ) async {
//     final options = GoogleSignInOptions(
//       scopes: ['email'],
//       clientId: webClientId,
//     );

//     final googleSignIn = GoogleSignIn(scopes: ['email']);
//     final googleSignInAccount = await googleSignIn.signIn();

//     try {
//       final googleSignInAuthentication = await googleSignInAccount.authentication;
//       final googleSignInCredential = GoogleAuthProvider.credential(
//         idToken: googleSignInAuthentication.idToken,
//         accessToken: googleSignInAuthentication.accessToken,
//       );

//       return await FirebaseAuth.instance.signInWithCredential(googleSignInCredential);
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-canceled') {
//         throw GoogleAuthError;
//       } else {
//         rethrow;
//       }
//     }
//   }
// }
