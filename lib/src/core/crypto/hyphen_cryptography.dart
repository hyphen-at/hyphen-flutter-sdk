import 'dart:typed_data';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:pointycastle/pointycastle.dart';
import 'package:pointycastle/ecc/curves/secp256k1.dart';
import 'package:pointycastle/signers/ecdsa_signer.dart';
import 'package:pointycastle/macs/hmac.dart';
import 'package:pointycastle/digests/sha256.dart';
import 'package:local_auth/local_auth.dart';
import 'package:pointycastle/key_generators/ec_key_generator.dart';
import 'package:pointycastle/ecc/api.dart';

class HyphenCryptography {
  static final String ANDROID_KEYSTORE_NAME = 'AndroidKeyStore';
  static final String KEY_ALIAS = 'hyphen-device-key';

  static AsymmetricKeyPair<PublicKey, PrivateKey>? keyPair;

  static Future<void> initializeBiometricPrompt(ECSignature sig) async {
    final localAuth = LocalAuthentication();

    final isAuthenticated =
        await localAuth.authenticate(localizedReason: 'Hyphen Authenticate');

    if (isAuthenticated) {
      // Handle authentication success
    }
  }

  static bool isDeviceKeyExist() {
    return keyPair != null;
  }

  static Future<void> generateKey() async {
    final keyPair = await KeyHelper.computeECDHKeyPair(
      'secp256r1',
      KeyParameter(Uint8List.fromList('sample-seed'.codeUnits)),
    );

    HyphenCryptography.keyPair = keyPair;
  }

  static ECPublicKey getPublicKey() {
    return keyPair!.publicKey as ECPublicKey;
  }

  static String getPublicKeyHex() {
    final pubKey = getPublicKey();

    final x = pubKey.Q?.x?.toBigInteger()?.toRadixString(16);
    final y = pubKey.Q?.y?.toBigInteger()?.toRadixString(16);

    return '$x$y';
  }

  static Future<String?> signData(Uint8List data) async {
    final privKey = keyPair?.privateKey as ECPrivateKey?;
    if (privKey == null) {
      return null;
    }

    final sig = await KeyHelper.sign(privKey, data);

    await initializeBiometricPrompt(sig as ECSignature);

    return sig;
  }

  static Future<Uint8List?> encrypt(Uint8List data) async {
    if (keyPair == null) {
      return null;
    }

    final publicKey = keyPair!.publicKey as ECPublicKey;

    //Implement
  }

  static Future<Uint8List?> decrypt(Uint8List data) async {
    if (keyPair == null) {
      return null;
    }

    final privateKey = keyPair!.privateKey as ECPrivateKey;

    // Implement
  }
}

class KeyHelper {
  static final ECDomainParameters curve = ECCurve_secp256k1();

  static Future<AsymmetricKeyPair<PublicKey, PrivateKey>> computeECDHKeyPair(
    String curveId,
    CipherParameters params,
  ) async {
    final keyGen = ECKeyGenerator();
    final params = ECKeyGeneratorParameters(curve);
    keyGen.init(ParametersWithRandom(params, SecureRandom()));

    return keyGen.generateKeyPair();
  }

  static Future<String> sign(ECPrivateKey privateKey, Uint8List data) async {
    final signer = ECDSASigner(HMac(SHA256Digest(), 64) as Digest?);

    signer.init(
      true,
      PrivateKeyParameter<ECPrivateKey>(privateKey),
    );

    final sig = signer.generateSignature(data) as ECSignature;

    final encoded = ASN1Sequence(elements: [
      ASN1Integer(sig.r),
      ASN1Integer(sig.s),
    ]).encode();

    return base64UrlEncode(encoded);
  }
}
