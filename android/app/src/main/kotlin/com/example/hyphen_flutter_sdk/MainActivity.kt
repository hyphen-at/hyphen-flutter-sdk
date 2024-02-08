package com.example.hyphen_flutter_sdk

import android.os.Bundle
import androidx.lifecycle.lifecycleScope
import at.hyphen.android.sdk.core.crypto.HyphenCryptography
import at.hyphen.android.sdk.flow.HyphenFlow
import com.nftco.flow.sdk.FlowArgument
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import kotlinx.coroutines.launch

class MainActivity : FlutterActivity() {

    // Example 1
    private val CHANNEL_1 = "hyphen_flutter_sdk/crypto"

    // Example 2
    private val CHANNEL_2 = "hyphen_flutter_sdk/flow"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(FlutterEngine(this))

        // Set up channel 1
        flutterEngine?.dartExecutor?.binaryMessenger?.let {
            MethodChannel(it, CHANNEL_1)
                    .setMethodCallHandler { call, result ->
                        when (call.method) {
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

                            else -> {
                                result.notImplemented()
                            }
                        }
                    }
        }
        // Set up channel 2
        flutterEngine?.dartExecutor?.binaryMessenger?.let {
            MethodChannel(it, CHANNEL_2)
                    .setMethodCallHandler { call, result ->
                        when (call.method) {
                            "signAndSendTransaction" -> {
                                val cadenceScript = call.argument<String>("cadenceScript")
                                val arguments = call.argument<List<Map<String, Any>>>("arguments")
                                val withAuthorizer = call.argument<Boolean>("withAuthorizer")

                                if (cadenceScript != null && arguments != null && withAuthorizer != null) {
                                    lifecycleScope.launch { // Use lifecycleScope here
                                        try {
                                            val transactionId = HyphenFlow.signAndSendTransaction(
                                                    cadenceScript,
                                                    arguments as List<FlowArgument>,
                                                    withAuthorizer
                                            )

                                            result.success(transactionId)
                                        } catch (e: Exception) {
                                            result.error("TRANSACTION_ERROR", "Error processing transaction", null)
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
        }
    }
}
