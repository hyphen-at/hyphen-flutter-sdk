import 'package:flutter/material.dart';
import 'package:hyphen_flutter_sdk/core/hyphen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {

    // Initialize the Hyphen SDK
    Hyphen.initialize(context);
    Hyphen.appSecret = "<YOUR-APP-SECRET>";
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
