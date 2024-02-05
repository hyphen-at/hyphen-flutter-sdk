package com.example.hyphen_flutter_sdk

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {

    // Example 1
    private val CHANNEL_1 = "hyphen_flutter_sdk/crypto"

    // Example 2
    private val CHANNEL_2 = "hyphen_flutter_sdk/flow"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(FlutterEngine(this))

        // Set up channel 1
        MethodChannel(flutterEngine?.dartExecutor?.binaryMessenger, CHANNEL_1)
                .setMethodCallHandler { call, result ->
                    when (call.method) {
                        "isDeviceKeyExist" -> {
                            try {
                                final bool deviceKeyExists = await HyphenCryptography.isDeviceKeyExist();
                                result.success(deviceKeyExists);
                              } catch (e) {
                                result.error("ERROR_CODE", "Error checking device key existence", null);
                              }
                              break;
                        }
                        "generateKey" -> {
                            try {
                                HyphenCryptography.generateKey();
                                result.success(true);
                              } catch (e) {
                                result.error("ERROR_CODE", "Error generating key", null);
                              }
                              break;
                        }
                        "getPublicKeyHex" -> {
                            try {
                                String publicKeyHex = await HyphenCryptography.getPublicKeyHex();
                                result.success(publicKeyHex);
                              } catch (e) {
                                result.error("ERROR_CODE", "Error getting public key hex", null);
                              }
                              break;
                        }
                        "signData" -> {
                            try {
                                List<int> data = call.arguments["data"];
                                Uint8List resultData = await HyphenCryptography.signData(data);
                                result.success(resultData);
                              } catch (e) {
                                result.error("ERROR_CODE", "Error signing data", null);
                              }
                              break;
                        }
                        "encrypt" -> {
                            try {
                                List<int> data = call.arguments["data"];
                                Uint8List resultData = await HyphenCryptography.encrypt(data);
                                result.success(resultData);
                              } catch (e) {
                                result.error("ERROR_CODE", "Error encrypting data", null);
                              }
                              break;
                        }
                        "decrypt" -> {
                            try {
                                List<int> data = call.arguments["data"];
                                Uint8List resultData = await HyphenCryptography.decrypt(data);
                                result.success(resultData);
                              } catch (e) {
                                result.error("ERROR_CODE", "Error decrypting data", null);
                              }
                              break;
                        }
                        else -> {
                            result.notImplemented()
                        }
                    }
                }
        // Set up channel 2
        MethodChannel(flutterEngine?.dartExecutor?.binaryMessenger, CHANNEL_2)
                .setMethodCallHandler { call, result ->
                  when (call.method) {
                    "getAccount" -> {
                      try {
                        val address = call.argument<String>("address")
                        val account = getAccount(FlowAddress(address))
                        val response = mapOf("accountName" to account.name)
                        result.success(response)
                      } catch (e: Exception) {
                          result.error("GET_ACCOUNT_ERROR", e.toString(), null)
                      }
                    }
                    "getAccountKey" -> {
                      try {
                        val address = call.argument<String>("address")
                        val keyIndex = call.argument<Int>("keyIndex")
                        val accountKey = getAccountKey(FlowAddress(address), keyIndex ?: 0)
                        val response = mapOf("keyName" to accountKey.name)
                        result.success(response)
                      } catch (e: Exception) {
                          result.error("GET_ACCOUNT_KEY_ERROR", e.toString(), null)
                      }
                    }
                    "waitForSeal" -> {
                      try {
                        val txID = call.argument<String>("txID")
                        val sealedResult = waitForSeal(FlowId(txID))
                        val response = mapOf("status" to sealedResult.status.toString())
                        result.success(response)
                      } catch (e: Exception) {
                          result.error("WAIT_FOR_SEAL_ERROR", e.toString(), null)
                      }
                    }
                    "signAndSendTransaction" -> {
                      val cadenceScript = call.argument<String>("cadenceScript")
                      val arguments = call.argument<List<Map<String, Any>>>("arguments")
                      val withAuthorizer = call.argument<Boolean>("withAuthorizer")

                      if (cadenceScript != null && arguments != null && withAuthorizer != null) {
                          // Implement your logic using the provided arguments

                          // For example, call the corresponding Kotlin function:
                          val transactionId = HyphenFlow.signAndSendTransaction(
                              cadenceScript,
                              arguments,
                              withAuthorizer
                          )

                          result.success(transactionId)
                      } else {
                          result.error("MISSING_ARGUMENTS", "Missing required arguments", null)
                      }
                    }
                    else -> {
                        result.notImplemented()
                    }
                  }
                }
    }
}
