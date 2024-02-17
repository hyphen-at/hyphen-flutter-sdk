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

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: const Center(
          child: Text('Hyphen Flutter SDK'),
        ),
      ),
    );
  }
}
