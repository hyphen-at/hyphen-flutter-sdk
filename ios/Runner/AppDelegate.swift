import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let channel_1 = FlutterMethodChannel(name: "hyphen_flutter_sdk/crypto", binaryMessenger: controller.binaryMessenger)
    let channel_2 = FlutterMethodChannel(name: "hyphen_flutter_sdk/flow", binaryMessenger: controller.binaryMessenger)
    let channel_3 = FlutterMethodChannel(name: "hyphen_flutter_sdk/authenticate", binaryMessenger: controller.binaryMessenger)
    let channel_4 = FlutterMethodChannel(name: "hyphen_flutter_sdk/google-authenticate", binaryMessenger: controller.binaryMessenger)

    channel_1.setMethodCallHandler({
      [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
      // Handle method calls here
      if call.method == "myMethod" {
        // Implement native functionality here
        // For example:
        // self?.myMethod()
        result(nil) // Return a result to Flutter
      } else {
        result(FlutterMethodNotImplemented) // Handle unsupported methods
      }
    })

    channel_2.setMethodCallHandler({
      [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
      // Handle method calls here
      if call.method == "myMethod" {
        // Implement native functionality here
        // For example:
        // self?.myMethod()
        result(nil) // Return a result to Flutter
      } else {
        result(FlutterMethodNotImplemented) // Handle unsupported methods
      }
    })

    channel_3.setMethodCallHandler({
      [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
      // Handle method calls here
      if call.method == "myMethod" {
        // Implement native functionality here
        // For example:
        // self?.myMethod()
        result(nil) // Return a result to Flutter
      } else {
        result(FlutterMethodNotImplemented) // Handle unsupported methods
      }
    })

    channel_4.setMethodCallHandler({
      [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
      // Handle method calls here
      if call.method == "myMethod" {
        // Implement native functionality here
        // For example:
        // self?.myMethod()
        result(nil) // Return a result to Flutter
      } else {
        result(FlutterMethodNotImplemented) // Handle unsupported methods
      }
    })

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
