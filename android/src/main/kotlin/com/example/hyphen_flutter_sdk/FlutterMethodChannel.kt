package com.example.hyphen_flutter_sdk

import androidx.lifecycle.lifecycleScope
import at.hyphen.android.sdk.authenticate.HyphenAuthenticate
import at.hyphen.android.sdk.authenticate.HyphenGoogleAuthenticate
import at.hyphen.android.sdk.core.crypto.HyphenCryptography
import at.hyphen.android.sdk.flow.HyphenFlow
import com.nftco.flow.sdk.FlowArgument
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.launch

class FlutterMethodChannel : FlutterPlugin, MethodChannel.MethodCallHandler {

    private lateinit var channel_1: MethodChannel
    private lateinit var channel_2: MethodChannel
    private lateinit var channel_3: MethodChannel
    private lateinit var channel_4: MethodChannel

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel_1 = MethodChannel(flutterPluginBinding.binaryMessenger, "hyphen_flutter_sdk/crypto")
        channel_1.setMethodCallHandler(this)

        channel_2 = MethodChannel(flutterPluginBinding.binaryMessenger, "hyphen_flutter_sdk/flow")
        channel_2.setMethodCallHandler(this)

        channel_3 = MethodChannel(flutterPluginBinding.binaryMessenger, "hyphen_flutter_sdk/authenticate")
        channel_3.setMethodCallHandler(this)

        channel_4 = MethodChannel(flutterPluginBinding.binaryMessenger, "hyphen_flutter_sdk/google-authenticate")
        channel_4.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            // Channel 1
            "isDeviceKeyExist" -> {
                try {
                    val deviceKeyExists = HyphenCryptography.isDeviceKeyExist();
                    result.success(deviceKeyExists);
                } catch (e: Exception) {
                    result.error("ERROR_CODE", "Error checking device key existence", null);
                }
            }

            "generateKey" -> {
                try {
                    HyphenCryptography.generateKey();
                    result.success(true);
                } catch (e: Exception) {
                    result.error("ERROR_CODE", "Error generating key", null);
                }
            }

            "getPublicKeyHex" -> {
                try {
                    val publicKeyHex = HyphenCryptography.getPublicKeyHex();
                    result.success(publicKeyHex);
                } catch (e: Exception) {
                    result.error("ERROR_CODE", "Error getting public key hex", null);
                }
            }

            "signData" -> {
                val data = call.argument<List<Int>>("data");
                if (data != null) {
                    lifecycleScope.launch {
                        try {
                            val byteArrayData = data.map { it -> it.toByte() }.toByteArray()
                            val resultData = HyphenCryptography.signData(byteArrayData)
                            result.success(resultData)
                        } catch (e: Exception) {
                            result.error("ERROR_CODE", "Error signing data", null)
                        }
                    }
                } else {
                    result.error("MISSING_ARGUMENTS", "Missing data argument", null)
                }

            }

            "encrypt" -> {
                try {
                    val data = call.argument<List<Int>>("data");
                    val byteArrayData = data?.map { it -> it.toByte() }?.toByteArray()
                    val resultData = byteArrayData?.let { it1 -> HyphenCryptography.encrypt(it1) }
                    result.success(resultData);
                } catch (e: Exception) {
                    result.error("ERROR_CODE", "Error encrypting data", null);
                }
            }

            "decrypt" -> {
                try {
                    val data = call.argument<List<Int>>("data");
                    val byteArrayData = data?.map { it -> it.toByte() }?.toByteArray()
                    val resultData = byteArrayData?.let { it1 -> HyphenCryptography.decrypt(it1) }
                    result.success(resultData);
                } catch (e: Exception) {
                    result.error("ERROR_CODE", "Error decrypting data", null);
                }
            }

            // Channel 2
            "signAndSendTransaction" -> {
                val cadenceScript = call.argument<String>("cadenceScript")
                val arguments = call.argument<List<Map<String, Any>>>("arguments")
                val withAuthorizer = call.argument<Boolean>("withAuthorizer")

                if (cadenceScript != null && arguments != null && withAuthorizer != null) {
                    lifecycleScope.launch {
                        try {
                            val transactionId = HyphenFlow.signAndSendTransaction(cadenceScript, arguments as List<FlowArgument>, withAuthorizer)

                            result.success(transactionId)
                        } catch (e: Exception) {
                            result.error("TRANSACTION_ERROR", "Error processing transaction", null)
                        }
                    }
                } else {
                    result.error("MISSING_ARGUMENTS", "Missing required arguments", null)
                }
            }

            "getAccount" -> {

                lifecycleScope.launch {
                    try {
                        val resultData = HyphenAuthenticate.getAccount(context)
                        result.success(resultData)
                    } catch (e: Exception) {
                        result.error("ERROR_CODE", "Failed to get account", null)
                    }
                }
            }

            "authenticate" -> {
                val webClientId = call.argument<String>("webClientId");
                if (webClientId != null) {
                    lifecycleScope.launch {
                        try {
                            val resultData = HyphenAuthenticate.authenticate(activity, webClientId)
                            result.success(resultData);

                        } catch (e: Exception) {
                            result.error("ERROR_CODE", "Error authenticating", null)
                        }
                    }
                } else {
                    result.error("MISSING_ARGUMENTS", "Missing required arguments", null)
                }
            }

            "googleAuthenticate" -> {
                val webClientId = call.argument<String>("webClientId");
                if (webClientId != null) {
                    lifecycleScope.launch {
                        try {
                            val resultData = HyphenGoogleAuthenticate.authenticate(activity, webClientId)
                            result.success(resultData);

                        } catch (e: Exception) {
                            result.error("ERROR_CODE", "Error authenticating via Google", null)
                        }
                    }
                } else {
                    result.error("MISSING_ARGUMENTS", "Missing required arguments", null)
                }
            }

            else -> {
                result.notImplemented()
            }
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel_1.setMethodCallHandler(null)
        channel_2.setMethodCallHandler(null)
        channel_3.setMethodCallHandler(null)
        channel_4.setMethodCallHandler(null)
    }

}
