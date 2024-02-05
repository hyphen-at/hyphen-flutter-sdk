import 'package:flutter/services.dart';

class HyphenFlow {
  static const MethodChannel _channel = MethodChannel('hyphen_flutter_sdk/flow');

  static Future<String> signAndSendTransaction(
    String cadenceScript,
    List<Map<String, dynamic>> arguments,
    bool withAuthorizer,
  ) async {
    try {
      final result = await _channel.invokeMethod('signAndSendTransaction', {
        'cadenceScript': cadenceScript,
        'arguments': arguments,
        'withAuthorizer': withAuthorizer,
      });

      return result as String;
    } on PlatformException catch (e) {
      return 'Error: ${e.message}';
    }
  }
}
