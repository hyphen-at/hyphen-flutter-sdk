import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hyphen_flutter_sdk/core/hyphen.dart';
import 'package:hyphen_flutter_sdk/authenticate/hyphen-authenticate.dart';
import 'package:hyphen_flutter_sdk/flow/hyphen_flow.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String networkState = "Testnet";
  String authText = "";
  String txText = "";
  bool isLoading = false;

  void changeNetwork() {
    setState(() {
      if (Hyphen.network == NetworkType.TESTNET) {
        Hyphen.network = NetworkType.MAINNET;
        networkState = "Mainnet";
      } else {
        Hyphen.network = NetworkType.TESTNET;
        networkState = "Testnet";
      }
    });
  }

  Future<void> loginWithGoogle() async {
    setState(() {
      isLoading = true;
    });

    try {
      await HyphenAuthenticate.authenticate(
          "201778913659-dn4bo82q6hce3kfp7vstp04b22nh5hbi.apps.googleusercontent.com");

      final hyphenAccount = await HyphenAuthenticate.getAccount();

      setState(() {
        authText = "Authenticate Result : $hyphenAccount";
      });
    } catch (e, stackTrace) {
      print("Error: $e\n$stackTrace");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> signAndSendTransaction() async {
    setState(() {
      isLoading = true;
    });

    try {
      final txId = await HyphenFlow.signAndSendTransaction(
        """
          transaction {
              execute {
                  log("Hello World!!!")
              }
          }
        """
            .trim(),
        [],
        false,
      );

      setState(() {
        txText = txId;
      });

      final url =
          "https://${Hyphen.network == NetworkType.TESTNET ? 'testnet.' : ''}flowdiver.io/tx/$txId?tab=overview";
      await launchUrl(Uri.parse(url));
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print("Error: $e\n$stackTrace");
      }
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Initialize the Hyphen SDK
    Hyphen.initialize(context);
    Hyphen.appSecret = "lH2rU/P0gdv5+zJfgQzITluGHBNtX2jG1JiBZNbKHPQ";
    Hyphen.network = NetworkType.TESTNET;

    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Hyphen SDK Demo',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'This is the sample code for the Hyphen Android SDK. '
                  'Please refer to the app and implement it in the app.\n\n'
                  'The Hyphen SDK already includes 2FA verification feature. '
                  'After installing demo app on another device, you can test it by logging in using the same account.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: changeNetwork,
                  child: Text(networkState),
                ),
                const SizedBox(height: 32),
                const Text(
                  'Login with Google',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: loginWithGoogle,
                  child: const Text('Login with Google'),
                ),
                const SizedBox(height: 12),
                Text(
                  authText,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 32),
                const Text(
                  'Sign & Send Transaction',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: signAndSendTransaction,
                  child: const Text('Signing & Send Transaction'),
                ),
                const SizedBox(height: 12),
                Text(
                  txText,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          if (isLoading)
            Container(
              color: Colors.black.withOpacity(0.2),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
