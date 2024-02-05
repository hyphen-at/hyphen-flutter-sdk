import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String networkState = "Testnet";
  String authText = "";
  String txText = "";
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hyphen SDK Demo'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Hyphen SDK Demo",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32.0,
                  ),
                ),
                const Text(
                  "This is the sample code for the Hyphen Android SDK. Please refer to the app and implement it in the app.\n\nThe Hyphen SDK already includes 2FA verification feature. After installing demo app on another device, you can test it by logging in using the same account.",
                  style: TextStyle(fontSize: 16.0),
                  textAlign: TextAlign.justify,
                ),
                ElevatedButton(
                  onPressed: () {
                    changeNetwork();
                  },
                  child: Text(networkState),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  "Login with Google",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    loginWithGoogle();
                  },
                  child: const Text("Login with Google"),
                ),
                Text(authText, style: const TextStyle(fontSize: 16.0)),
                const Text(
                  "Sign & Send Transaction ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    signAndSendTransaction();
                  },
                  child: const Text("Signing & Send Transaction"),
                ),
                Text(txText, style: const TextStyle(fontSize: 16.0)),
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

  void changeNetwork() {
    setState(() {
      if (networkState == "Testnet") {
        networkState = "Mainnet";
      } else {
        networkState = "Testnet";
      }
    });
  }

  void loginWithGoogle() {
    // TODO: Implement login with Google
  }

  void signAndSendTransaction() {
    setState(() {
      isLoading = true;
    });

    // TODO: Implement sign and send transaction logic

    // Example of opening a URL in the browser
    // launch("https://${networkState == "Testnet" ? "testnet." : ""}flowdiver.io/tx/$txText?tab=overview");

    setState(() {
      isLoading = false;
    });
  }
}
