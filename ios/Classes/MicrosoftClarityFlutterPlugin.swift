import Flutter
import UIKit
import Clarity
public class MicrosoftClarityFlutterPlugin: NSObject, FlutterPlugin {

    private let logLevels: [String: LogLevel] = [
    "Info": .info,
    "Debug": .debug,
    "Error": .error,
    "Verbose": .verbose,
    "Warning": .warning,
    "None": .none
]

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "microsoft_clarity_flutter", binaryMessenger: registrar.messenger())
    let instance = MicrosoftClarityFlutterPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

 public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    let view = UIApplication.shared.windows.first?.rootViewController?.view
        print("Method called \(call.method) =========")
    do {
        switch call.method {
        case "init":
            guard let args = call.arguments as? [String: Any] else {
                result(FlutterError(code: "INVALID_ARGUMENTS", message: "Invalid arguments passed", details: nil))
                return
            }
             print("Init reached")   
            let projectId = args["projectID"] as? String
            let userId = args["userID"] as? String
//            let logLevelString = args["logLevel"] as? String
            print("Args \(args)")
            if projectId != nil {
//                var config: ClarityConfig
//                let logLevel = logLevels[logLevelString ?? "Verbose"]
//
//                config = ClarityConfig(projectId: projectId,logLevel: logLevel != nil ? logLevel!: .verbose,applicationFramework: .native)
                
//                ClaritySDK.initialize(config: config)
//                ClaritySDK.initialize(config: config)
                if userId != nil{
                    result(ClaritySDK.setCustomUserId(userId!))
                }
                else{
                    result(false)
                }
               
               
            } else {
                result(FlutterError(code: "PROJECT_ID_NULL", message: "Specify the project Id for Microsoft Clarity", details: nil))
            }

        case "pause":
            result(ClaritySDK.pause())

        case "resume":
            result(ClaritySDK.resume())

        case "isPaused":
            result(ClaritySDK.isPaused())

        case "getCurrentSessionId":
            result(ClaritySDK.getCurrentSessionUrl()?.split(separator: "/").last)

        case "getCurrentSessionUrl":
            result(ClaritySDK.getCurrentSessionUrl())

        case "sendCustomEvent":
            let args = call.arguments as? [String: Any]
            let eventName = args?["eventName"] as? String
            result(eventName != nil ? ClaritySDK.sendCustomEvent(value:eventName!) : false)

        case "setCurrentScreenName":
            let args = call.arguments as? [String: Any]
            let screenName = args?["screenName"] as? String
            result(screenName != nil ? ClaritySDK.setCurrentScreenName(screenName!) : false)

        case "setCustomSessionId":
            let args = call.arguments as? [String: Any]
            let sessionId = args?["sessionId"] as? String
            result(sessionId != nil ? ClaritySDK.setCustomSessionId(sessionId!) : false)

        case "setCustomTag":
            let args = call.arguments as? [String: Any]
            let customTagKey = args?["customTagKey"] as? String
            let customTagValue = args?["customTagValue"] as? String
            if let key = customTagKey, let value = customTagValue {
                result(ClaritySDK.setCustomTag(key: key, value: value))
            } else {
                result(false)
            }

        case "maskView":
            if view != nil {
            result(ClaritySDK.maskView( view! ))

            }
            else{
                result(false)
            }
           

        case "unmaskView":
        if view != nil {
            result(ClaritySDK.unmaskView( view! ))

        }
         else{
                result(false)
            }

        case "setCustomUserId":
        let args = call.arguments as? [String: Any]
        let customerId: String? = args?["userId"] as? String
        if customerId != nil {
          result(ClaritySDK.setCustomUserId(customerId!))
        }
        else{
             result(false)
        }
      


        default:
            result(FlutterMethodNotImplemented)
        }

    } catch let error {
        print("MicrosoftClarityFlutterPlugin handle: Exception \(error)")
        result(FlutterError(code: "MICROSOFT_CLARITY_ERROR", message: error.localizedDescription, details: nil))
    }
}

}


