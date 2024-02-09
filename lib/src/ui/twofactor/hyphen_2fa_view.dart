import 'package:flutter/material.dart';
import 'package:hyphen_flutter_sdk/src/core/common/twofactor/hyphen_2fa_status.dart';

class Hyphen2FAView extends StatefulWidget {
  final Hyphen2FAStatus status;
  final VoidCallback onApproveButtonClick;
  final VoidCallback onDenyButtonClick;

  const Hyphen2FAView({super.key, 
    required this.status,
    required this.onApproveButtonClick,
    required this.onDenyButtonClick,
  });

  @override
  _Hyphen2FAViewState createState() => _Hyphen2FAViewState();
}

class _Hyphen2FAViewState extends State<Hyphen2FAView> {
  var remainingTimeSeconds = 3 * 60;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() async {
    while (remainingTimeSeconds != 0) {
      await Future.delayed(const Duration(seconds: 1));
      setState(() {
        remainingTimeSeconds--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const Image(
                // Use your image source here
                image: AssetImage('assets/your_icon.png'),
                height: 48.0,
                width: 48.0,
              ),
              Text(
                "${widget.status.request.app.appName} requires to\nSign-In",
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.normal,
                  height: 32.0,
                ),
              ),
              Text(
                "${widget.status.request.srcDevice.deviceModel} is trying to sign-in into ${widget.status.request.app.appName} in the ${widget.status.request.userOpInfo.signIn.email} account.",
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 16.0,
                  height: 24.0,
                ),
              ),
            ],
          ),
          Column(
            children: [
              // Details Widgets
              Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 28.0),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                    width: 1.0,
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Device",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    Text(
                      widget.status.request.srcDevice.deviceModel,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 16.0,
                        //marginTop: 4.0,
                      ),
                    ),
                    Text(
                      "App Name",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    Text(
                      widget.status.request.app.appName,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 16.0,
                        //marginTop: 4.0,
                      ),
                    ),
                    Text(
                      "Near",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    Text(
                      widget.status.request.userOpInfo.signIn.location,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 16.0,
                        //marginTop: 4.0,
                      ),
                    ),
                    Text(
                      "Time",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const Text(
                      "Just now",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 16.0,
                        //marginTop: 4.0,
                      ),
                    ),

                    // Row and Buttons Widgets
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: widget.onDenyButtonClick,
                          child: const Text("Deny"),
                        ),
                        ElevatedButton(
                          onPressed: remainingTimeSeconds > 0
                              ? widget.onApproveButtonClick
                              : null,
                          child: Text(
                              "Approve ${remainingTimeSeconds > 0 ? remainingTimeSeconds ~/ 60 : ''}"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

