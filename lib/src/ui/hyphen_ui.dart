
import 'package:flutter/material.dart';
import 'package:hyphen_flutter_sdk/src/core/common/twofactor/hyphen_2fa_status.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:hyphen_flutter_sdk/src/core/common/twofactor/hyphen_2fa_status_type.dart';
import 'package:hyphen_flutter_sdk/src/core/eventbus/hyphen_event_bus.dart';
import 'package:hyphen_flutter_sdk/src/core/eventbus/hyphen_event_bus_type.dart';
import 'package:hyphen_flutter_sdk/src/networking/response/hyphen_response_sign_in_2fa.dart';

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
    if (hyphenNotificationType == "2fa-request") {
      final twoFactorRequest = HyphenResponseSignIn2FA.fromJson(hyphenData as Map<String, dynamic>);
      pendingTwoFactorStatus = twoFactorRequest.twoFactorAuth;

    //   Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => Hyphen2FAActivity,
    //   ),
    // );
    } else if (hyphenNotificationType == "2fa-status-change") {
      final twoFactorRequest = HyphenResponseSignIn2FA.fromJson(hyphenData as Map<String, dynamic>);
      HyphenEventBus.post(HyphenEventBusType.show2FAWaitingProgressModal(show: false));

      if (twoFactorRequest.twoFactorAuth.status == Hyphen2FAStatusType.APPROVED) {
        Timer(Duration(seconds: 3), () {
          HyphenEventBus.post(
            HyphenEventBusType.twoFactorAuthApproved(
              requestId: twoFactorRequest.twoFactorAuth.request.id,
            ),
          );
        });
      } else if (twoFactorRequest.twoFactorAuth.status == Hyphen2FAStatusType.DENIED) {
        HyphenEventBus.post(HyphenEventBusType.twoFactorAuthDenied);
      }
    }
  }
}
