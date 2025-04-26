package dev.ak.microsoft_clarity_flutter.microsoft_clarity_flutter

import android.content.ContentValues.TAG
import android.util.Log
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import com.microsoft.clarity.Clarity
import com.microsoft.clarity.ClarityConfig
import com.microsoft.clarity.models.LogLevel
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding

/** MicrosoftClarityFlutterPlugin */
class MicrosoftClarityFlutterPlugin: FlutterPlugin, MethodCallHandler, ActivityAware  {
  private var currentActivity: android.app.Activity? = null

  private lateinit var channel : MethodChannel
  private var logLevels = mapOf( "Info" to LogLevel.Info,"Debug" to LogLevel.Debug,"Error" to LogLevel.Error,"Verbose" to LogLevel.Verbose,"Warning" to LogLevel.Warning,"None" to LogLevel.None)
  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "microsoft_clarity_flutter")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    try{
      if (call.method == "init") {
        val projectId: String? = call.argument<String?>("projectID")
        val userId: String? = call.argument<String?>("userID") // Adiciona o userId como argumento
        val logLevelString: String? = call.argument<String?>("logLevel")
        if (projectId != null) {
          val config = if (userId != null) {
            ClarityConfig(projectId, userId) // Passa o userId se não for nulo
          } else {
            ClarityConfig(projectId) // Não passa o userId se for nulo
          }
          val logLevel = logLevels[logLevelString ?: ""]
          if (logLevel != null) {
            config.logLevel = logLevel
          }


          result.success(Clarity.initialize(currentActivity, config))
        } else {
          result.error(
            "PRODUCT_ID_NULL",
            "Specify the project Id for microsoft clarity",
            null
          )
        }


      } else if (call.method == "pause") {

        result.success(Clarity.pause())
      } else if (call.method == "resume") {
        result.success(Clarity.resume())
      } else if (call.method == "isPaused") {
        result.success(Clarity.isPaused())
      } else if (call.method == "getCurrentSessionId") {
        result.success(Clarity.getCurrentSessionId())
      } else if (call.method == "getCurrentSessionUrl") {
        result.success(Clarity.getCurrentSessionUrl())
      } else if (call.method == "sendCustomEvent") {
        val eventName: String? = call.argument<String?>("eventName")
        if (eventName != null) {
          result.success(Clarity.sendCustomEvent(eventName))
        } else {
          result.success(false)
        }
      } else if (call.method == "setCurrentScreenName") {

        val screenName: String? = call.argument<String?>("screenName")
        if (screenName != null) {
          result.success(Clarity.setCurrentScreenName(screenName))
        } else {
          result.success(false)
        }
      } else if (call.method == "setCustomSessionId") {
        val sessionId: String? = call.argument<String?>("sessionId")
        if (sessionId != null) {
          result.success(Clarity.setCustomSessionId(sessionId))
        } else {
          result.success(false)
        }
      } else if (call.method == "setCustomTag") {
        val customTagKey: String? = call.argument<String?>("customTagKey")
        val customTagValue: String? = call.argument<String?>("customTagValue")
        if (customTagValue != null && customTagKey != null) {
          result.success(Clarity.setCustomTag(customTagKey, customTagValue))
        } else {
          result.success(false)
        }
      } else if (call.method == "maskView") {
        result.success(Clarity.maskView(currentActivity?.currentFocus))
      } else if (call.method == "unmaskView") {
        result.success(Clarity.unmaskView(currentActivity?.currentFocus))
      }
      else if(call.method=="setCustomUserId"){
        val customerId: String? = call.argument<String?>("userId")
        if(customerId !=null){
          result.success(Clarity.setCustomUserId(customerId))
        }
        else{
          result.success(false)
        }
      }

      else {
        result.notImplemented()
      }
    }catch (e:Exception){
      Log.e(TAG, "MicrosoftClarityFlutterPlugin onMethodCall: Exception $e")
      result.error("MicrosoftClarityFlutterPlugin error ",e.toString(),"")
    }

  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    currentActivity = binding.activity
  }

  override fun onDetachedFromActivityForConfigChanges() {
    currentActivity = null
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    currentActivity = binding.activity
  }

  override fun onDetachedFromActivity() {
    currentActivity = null
  }
}
