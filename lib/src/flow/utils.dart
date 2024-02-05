import 'dart:async';

import 'package:flutter/services.dart';

class Utils {
  static const MethodChannel _channel = MethodChannel('hyphen_flutter_sdk/flow');

  static Future<FlowAccount> getAccount(FlowAddress address) async {
    final Map<String, dynamic> params = {'address': address.toString()};
    final Map<dynamic, dynamic> result =
        await _channel.invokeMethod('getAccount', params);
    return FlowAccount.fromJson(result);
  }

  static Future<FlowAccountKey> getAccountKey(
      FlowAddress address, int keyIndex) async {
    final Map<String, dynamic> params = {
      'address': address.toString(),
      'keyIndex': keyIndex
    };
    final Map<dynamic, dynamic> result =
        await _channel.invokeMethod('getAccountKey', params);
    return FlowAccountKey.fromJson(result);
  }

  static Future<void> waitForSeal(FlowId txID) async {
    final Map<String, dynamic> params = {'txID': txID.toString()};
    await _channel.invokeMethod('waitForSeal', params);
  }
}
