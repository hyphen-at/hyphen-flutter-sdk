import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hyphen_flutter_sdk/core/common/twofactor/hyphen_2fa_status.dart';
import 'package:hyphen_flutter_sdk/flow/hyphen_flow_cadence.dart';
import 'package:hyphen_flutter_sdk/flow/hyphen_flow.dart';
import 'package:hyphen_flutter_sdk/networking/hyphen_networking.dart';
import 'package:hyphen_flutter_sdk/networking/request/hyphen_request_2fa_approve.dart';
import 'package:hyphen_flutter_sdk/ui/hyphen_ui.dart';
import 'package:hyphen_flutter_sdk/ui/theme/theme.dart';
import 'package:hyphen_flutter_sdk/ui/twofactor/hyphen_2fa_view.dart';

class Hyphen2FAActivity extends StatefulWidget {
  @override
  _Hyphen2FAActivityState createState() => _Hyphen2FAActivityState();
}

class _Hyphen2FAActivityState extends State<Hyphen2FAActivity> {
  bool isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          final Hyphen2FAStatus? pendingTwoFactorStatus = HyphenUI.pendingTwoFactorStatus;
          if (pendingTwoFactorStatus != null) {
            return HyphenUITheme(
              darkTheme: false,
              child: Stack(
                children: [
                  Hyphen2FAView(
                    status: pendingTwoFactorStatus,
                    onApproveButtonClick: () async {
                      await approve2FA();
                    },
                    onDenyButtonClick: () async {
                      await reject2FA();
                    },
                  ),
                  if (isProcessing)
                    Container(
                      color: Theme.of(context).colorScheme.onBackground.withOpacity(0.2),
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                ],
              ),
            );
          } else {
            return const Center(
              child: Text("No pending two-factor authentication"),
            );
          }
        },
      ),
    );
  }

  Future<void> reject2FA() async {
    final Hyphen2FAStatus? twoFactorAuth = HyphenUI.pendingTwoFactorStatus;
    if (twoFactorAuth == null) {
      throw Exception("HyphenUI SDK internal error. UI state 'twoFactorAuth' is null.");
    }

    setState(() {
      isProcessing = true;
    });

    await Device.deny2FA(twoFactorAuth.id);
    HyphenUI.pendingTwoFactorStatus = null;
    Navigator.of(context).pop();
  }

  Future<void> approve2FA() async {
    setState(() {
      isProcessing = true;
    });

    print("Generate and signing 'source device add public key' transaction...");
    final Hyphen2FAStatus? twoFactorAuth = HyphenUI.pendingTwoFactorStatus;
    if (twoFactorAuth == null) {
      throw Exception("HyphenUI SDK internal error. UI state 'twoFactorAuth' is null.");
    }

    final HyphenFlowCadence cadenceScript = HyphenFlowCadence.fromJson(twoFactorAuth.request.message as Map<String, dynamic>);
    final String tx = await HyphenFlow.signAndSendTransaction(cadenceScript.cadence, [], false);

    await Device.approve2FA(
      twoFactorAuth.id,
      HyphenRequest2FAApprove(txId: tx),
    );

    HyphenUI.pendingTwoFactorStatus = null;
    if (kDebugMode) {
      print("Approve 2FA done!");
    }

    Navigator.of(context).pop();
  }
}