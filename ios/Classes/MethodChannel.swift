import Flutter
import HyphenAuthenticate
import HyphenCore
import HyphenFlow
import HyphenGoogleAuthenticate
import UIKit

public class MethodChannel: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    // Channel 1
    let channel_1 = FlutterMethodChannel(
      name: "hyphen_flutter_sdk/crypto", binaryMessenger: registrar.messenger())
    let instance = TestPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel_1)

    // Channel 2
    let channel_2 = FlutterMethodChannel(
      name: "hyphen_flutter_sdk/flow", binaryMessenger: registrar.messenger())
    let secondInstance = TestPlugin()
    registrar.addMethodCallDelegate(secondInstance, channel: channel_2)

    // Channel 3
    let channel_3 = FlutterMethodChannel(
      name: "hyphen_flutter_sdk/authenticate", binaryMessenger: registrar.messenger())
    let thirdInstance = TestPlugin()
    registrar.addMethodCallDelegate(thirdInstance, channel: channel_3)

    // Channel 4
    let channel_4 = FlutterMethodChannel(
      name: "hyphen_flutter_sdk/google-authenticate", binaryMessenger: registrar.messenger())
    let fourthInstance = TestPlugin()
    registrar.addMethodCallDelegate(fourthInstance, channel: channel_4)
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
        let signedData = HyphenCryptography.signData(data.data)
      else {
        result(FlutterError(code: "SIGNING_ERROR", message: "Signing failed", details: nil))
        return
      }
      result(FlutterStandardTypedData(bytes: signedData))
    case "encrypt":
      guard let input = call.arguments as? String else {
        result(FlutterError(code: "INVALID_ARGUMENT", message: "Invalid input", details: nil))
        return
      }
      if let encryptedData = HyphenCryptography.encrypt(input: input.data) {
        result(encryptedData)
      } else {
        result(FlutterError(code: "ENCRYPTION_ERROR", message: "Encryption failed", details: nil))
      }
    case "decrypt":
      guard let input = call.arguments as? String else {
        result(FlutterError(code: "INVALID_ARGUMENT", message: "Invalid input", details: nil))
        return
      }
      if let decryptedData = HyphenCryptography.decrypt(input: input.data) {
        result(decryptedData)
      } else {
        result(FlutterError(code: "DECRYPTION_ERROR", message: "Decryption failed", details: nil))
      }
    // Channel 2
    case signAndSendTransaction:
      if let arguments = call.arguments as? [String: Any],
        let cadenceScript = arguments["cadenceScript"] as? String,
        let argumentsList = arguments["arguments"] as? [[String: Any]],
        let withAuthorizer = arguments["withAuthorizer"] as? Bool
      {

        let transaction = try await HyphenFlow.shared.makeSignedTransactionPayloadWithArguments(
          hyphenFlowCadence: cadenceScript,
          args: [
            argumentsList
          ]
        )

        let txHash = try await HyphenFlow.shared.sendSignedTransaction(transaction)

        result(txHash)
      } else {
        result(FlutterError(code: "INVALID_ARGUMENTS", message: "Invalid arguments", details: nil))
      }
    // Channel 3
    case "getAccount":
      do {
        let account = try HyphenAuthenticate.shared.getAccount()
        result(account)
      } catch {
        result(
          FlutterError(code: "ERROR_GET_ACCOUNT", message: "Error getting account", details: nil))
      }
    case "authenticate":
      if let arguments = call.arguments as? [String: Any],
        let webClientId = arguments["webClientId"] as? String
      {

        do {
          let credential = try await HyphenGoogleAuthenticate.shared.authenticate()
          // iOS method does not use webClientId
          result(credential)
        } catch {
          result(
            FlutterError(
              code: "google_auth_error", message: "Error authenticating with Google", details: nil))
        }

        result(nil)
      } else {
        result(FlutterError(code: "INVALID_ARGUMENTS", message: "Invalid arguments", details: nil))
      }
    // Channel 4
    case "googleAuthenticate":
      if let arguments = call.arguments as? [String: Any],
        let webClientId = arguments["webClientId"] as? String
      {

        do {
          let credential = try await HyphenGoogleAuthenticate.shared.authenticate()
          // iOS method does not use webClientId
          result(credential)
        } catch {
          result(
            FlutterError(
              code: "google_auth_error", message: "Error authenticating with Google", details: nil))
        }

        result(nil)
      } else {
        result(FlutterError(code: "INVALID_ARGUMENTS", message: "Invalid arguments", details: nil))
      }

    default:
      result(FlutterMethodNotImplemented)
    }
  }
}