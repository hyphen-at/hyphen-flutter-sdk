import Flutter
import UIKit

public class MethodChannel: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    // Channel 1
    let channel_1 = FlutterMethodChannel(name: "hyphen_flutter_sdk/crypto", binaryMessenger: registrar.messenger())
    let instance = TestPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)

    // Channel 2
    let channel_2 = FlutterMethodChannel(name: "hyphen_flutter_sdk/flow", binaryMessenger: registrar.messenger())
    let secondInstance = TestPlugin()
    registrar.addMethodCallDelegate(secondInstance, channel: secondChannel)

    // Channel 3
    let channel_3 = FlutterMethodChannel(name: "hyphen_flutter_sdk/authenticate", binaryMessenger: registrar.messenger())
    let secondInstance = TestPlugin()
    registrar.addMethodCallDelegate(secondInstance, channel: secondChannel)

    // Channel 4
    let channel_4 = FlutterMethodChannel(name: "hyphen_flutter_sdk/google-authenticate", binaryMessenger: registrar.messenger())
    let secondInstance = TestPlugin()
    registrar.addMethodCallDelegate(secondInstance, channel: secondChannel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
      // Channel 1
    case "isDeviceKeyExist":
      let isKeyExist = HyphenCryptography.isDeviceKeyExist()
      result(isKeyExist)
    case "getPublicKeyHex": 
        let publicKeyHex = HyphenCryptography.getPublicKeyHex()
        result(publicKeyHex)
    case "signData": 
        guard let data = call.arguments as? FlutterStandardTypedData,
              let signedData = HyphenCryptography.signData(data.data) else {
            result(FlutterError(code: "SIGNING_ERROR", message: "Signing failed", details: nil))
            return
        }
        result(FlutterStandardTypedData(bytes: signedData))
    case "encrypt": 
        guard let input = call.arguments as? String else {
            result(FlutterError(code: "INVALID_ARGUMENT", message: "Invalid input", details: nil))
            return
        }
        if let encryptedData = HyphenCryptography.encrypt(input: input) {
            result(encryptedData)
        } else {
            result(FlutterError(code: "ENCRYPTION_ERROR", message: "Encryption failed", details: nil))
        }
    case "decrypt": 
        guard let input = call.arguments as? String else {
            result(FlutterError(code: "INVALID_ARGUMENT", message: "Invalid input", details: nil))
            return
        }
        if let decryptedData = HyphenCryptography.decrypt(input: input) {
            result(decryptedData)
        } else {
            result(FlutterError(code: "DECRYPTION_ERROR", message: "Decryption failed", details: nil))
        }
    // Channel 2
    // Channel 3
    case "getAccount": 
        do {
            let account = try HyphenAuthenticate.getAccount()
            result(account)
        } catch {
            result(FlutterError(code: "ERROR_GET_ACCOUNT", message: "Error getting account", details: nil))
        }
    case "authenticate": 
        guard let method = call.arguments as? Int else {
            result(FlutterError(code: "INVALID_ARGUMENT", message: "Invalid method argument", details: nil))
            return
        }
        do {
            try self?.authenticate(method: method)
            result(nil)
        } catch {
            result(FlutterError(code: "ERROR_AUTHENTICATE", message: "Error authenticating", details: nil))
        }
    // Channel 4
    case: "googleAuthenticate": {
        do {
            let credential = try HyphenGoogleAuthenticate.shared.authenticate()
            result(credential)
        } catch {
            result(FlutterError(code: "google_auth_error", message: "Error authenticating with Google", details: nil))
        }
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
}
