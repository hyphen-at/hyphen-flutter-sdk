package com.example.hyphen_flutter_sdk

import android.app.Activity
import android.content.Context
import at.hyphen.android.sdk.authenticate.HyphenAuthenticate
import at.hyphen.android.sdk.authenticate.HyphenGoogleAuthenticate
import at.hyphen.android.sdk.core.common.account.HyphenAccount
import at.hyphen.android.sdk.core.crypto.HyphenCryptography
import at.hyphen.android.sdk.flow.HyphenFlow
import com.google.firebase.auth.AuthResult
import com.nftco.flow.sdk.FlowArgument
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.runBlocking


class FlutterMethodChannel : FlutterPlugin, MethodChannel.MethodCallHandler, ActivityAware {

    private lateinit var channel_1: MethodChannel
    private lateinit var channel_2: MethodChannel
    private lateinit var channel_3: MethodChannel
    private lateinit var channel_4: MethodChannel

    private lateinit var context: Context
    private lateinit var activity: Activity

    override fun onDetachedFromActivity() {
        TODO("Not yet implemented")
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        activity = binding.activity
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
    }

    override fun onDetachedFromActivityForConfigChanges() {
        TODO("Not yet implemented")
    }

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel_1 = MethodChannel(flutterPluginBinding.binaryMessenger, "hyphen_flutter_sdk/crypto")
        channel_1.setMethodCallHandler(this)

        channel_2 = MethodChannel(flutterPluginBinding.binaryMessenger, "hyphen_flutter_sdk/flow")
        channel_2.setMethodCallHandler(this)

        channel_3 = MethodChannel(flutterPluginBinding.binaryMessenger, "hyphen_flutter_sdk/authenticate")
        channel_3.setMethodCallHandler(this)

        channel_4 = MethodChannel(flutterPluginBinding.binaryMessenger, "hyphen_flutter_sdk/google-authenticate")
        channel_4.setMethodCallHandler(this)

        context = flutterPluginBinding.applicationContext
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            // Channel 1
            "isDeviceKeyExist" -> {
                try {
                    val deviceKeyExists = HyphenCryptography.isDeviceKeyExist()
                    result.success(deviceKeyExists)
                } catch (e: Exception) {
                    result.error("ERROR_CODE", "Error checking device key existence", null)
                }
            }

            "getPublicKeyHex" -> {
                try {
                    val publicKeyHex = HyphenCryptography.getPublicKeyHex()
                    result.success(publicKeyHex)
                } catch (e: Exception) {
                    result.error("ERROR_CODE", "Error getting public key hex", null)
                }
            }

            "signData" -> {
                val data = call.argument<List<Int>>("data")
                if (data != null) {
                    signData(data) { signedData ->
                        if (signedData != null) {
                            result.success(signedData)
                        } else {
                            result.error("ERROR_CODE", "Error signing data", null)
                        }
                    }
                } else {
                    result.error("MISSING_ARGUMENTS", "Missing data argument", null)
                }

            }

            "encrypt" -> {
                try {
                    val data = call.argument<List<Int>>("data")
                    val byteArrayData = data?.map { it.toByte() }?.toByteArray()
                    val resultData = byteArrayData?.let { it1 -> HyphenCryptography.encrypt(it1) }
                    result.success(resultData)
                } catch (e: Exception) {
                    result.error("ERROR_CODE", "Error encrypting data", null)
                }
            }

            "decrypt" -> {
                try {
                    val data = call.argument<List<Int>>("data")
                    val byteArrayData = data?.map { it.toByte() }?.toByteArray()
                    val resultData = byteArrayData?.let { it1 -> HyphenCryptography.decrypt(it1) }
                    result.success(resultData)
                } catch (e: Exception) {
                    result.error("ERROR_CODE", "Error decrypting data", null)
                }
            }

            // Channel 2
            "signAndSendTransaction" -> {
                val cadenceScript = call.argument<String>("cadenceScript")
                val arguments = call.argument<List<Map<String, Any>>>("arguments")
                val withAuthorizer = call.argument<Boolean>("withAuthorizer")

                if (cadenceScript != null && arguments != null && withAuthorizer != null) {
                    signAndSendTransaction(cadenceScript, arguments, withAuthorizer) { transactionId ->
                        if (transactionId != null) {
                            result.success(transactionId)
                        } else {
                            result.error("TRANSACTION_ERROR", "Error processing transaction", null)
                        }
                    }
                } else {
                    result.error("MISSING_ARGUMENTS", "Missing required arguments", null)
                }
            }

            "getAccount" -> {
                getAccount(context) { resultData ->
                    if (resultData != null) {
                        result.success(resultData)
                    } else {
                        result.error("ERROR_CODE", "Failed to get account", null)
                    }
                }

            }

            // Channel 3
            "authenticate" -> {
                val webClientId = call.argument<String>("webClientId")
                if (webClientId != null) {
                    authenticate(activity, webClientId) { resultData ->
                        if (resultData != null) {
                            result.success(resultData)
                        } else {
                            result.error("ERROR_CODE", "Error authenticating", null)
                        }
                    }
                } else {
                    result.error("MISSING_ARGUMENTS", "Missing required arguments", null)
                }
            }

            // Channel 4
            "googleAuthenticate" -> {
                val webClientId = call.argument<String>("webClientId")
                if (webClientId != null) {
                    googleAuthenticate(activity, webClientId) { resultData ->
                        if (resultData != null) {
                            result.success(resultData)
                        } else {
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

    private fun signData(data: List<Int>, callback: (ByteArray?) -> Unit) {
        try {
            val byteArrayData = data.map { it.toByte() }.toByteArray()
            val resultData = runBlocking {
                HyphenCryptography.signData(byteArrayData)
            }
            callback(resultData)
        } catch (e: Exception) {
            callback(null)
        }
    }

    private fun signAndSendTransaction(
            cadenceScript: String,
            arguments: List<Map<String, Any>>,
            withAuthorizer: Boolean,
            callback: (String?) -> Unit
    ) {
        try {
            val transactionId = runBlocking {
                HyphenFlow.signAndSendTransaction(
                        cadenceScript,
                        arguments as List<FlowArgument>,
                        withAuthorizer
                )
            }
            callback(transactionId)
        } catch (e: Exception) {
            callback(null)
        }
    }

    private fun getAccount(context: Context, callback: (HyphenAccount?) -> Unit) {
        try {
            val resultData = runBlocking { HyphenAuthenticate.getAccount(context) }
            callback(resultData)
        } catch (e: Exception) {
            callback(null)
        }
    }

    private fun authenticate(activity: Activity, webClientId: String, callback: (Unit?) -> Unit) {
        try {
            val resultData = runBlocking { HyphenAuthenticate.authenticate(activity, webClientId) }
            callback(resultData)
        } catch (e: Exception) {
            callback(null)
        }
    }

    private fun googleAuthenticate(activity: Activity, webClientId: String, callback: (AuthResult?) -> Unit) {
        try {
            val resultData = runBlocking { HyphenGoogleAuthenticate.authenticate(activity, webClientId) }
            callback(resultData)

        } catch (e: Exception) {
            callback(null)
        }
    }


}
