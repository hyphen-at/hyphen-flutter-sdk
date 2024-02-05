import 'dart:async';
import 'package:flutter/services.dart';

class HyphenCryptography {

  static const platform = MethodChannel('hyphen_flutter_sdk/crypto');
  static Future<bool> isDeviceKeyExist() async {
    try {
      final bool exists = await platform.invokeMethod('isDeviceKeyExist');
      return exists;
    } catch (e) {
      print("Failed to check device key existence: $e");
      return false;
    }
  }
  static Future<void> generateKey() async {
    try {
      await platform.invokeMethod('generateKey');
    } catch (e) {
      print("Failed to generate key: $e");
    }
  }
  static Future<String?> getPublicKeyHex() async {
    try {
      final String? publicKeyHex = await platform.invokeMethod('getPublicKeyHex');
      return publicKeyHex;
    } catch (e) {
      print("Failed to get public key hex: $e");
      return null;
    }
  }
  static Future<Uint8List?> signData(Uint8List data) async {
    try {
      final Uint8List? signedData = await platform.invokeMethod('signData', {'data': data});
      return signedData;
    } catch (e) {
      print("Failed to sign data: $e");
      return null;
    }
  }
  static Future<Uint8List?> encrypt(Uint8List data) async {
    try {
      final Uint8List? encryptedData = await platform.invokeMethod('encrypt', {'data': data});
      return encryptedData;
    } catch (e) {
      print("Failed to encrypt data: $e");
      return null;
    }
  }
  static Future<Uint8List?> decrypt(Uint8List data) async {
    try {
      final Uint8List? decryptedData = await platform.invokeMethod('decrypt', {'data': data});
      return decryptedData;
    } catch (e) {
      print("Failed to decrypt data: $e");
      return null;
    }
  }
}