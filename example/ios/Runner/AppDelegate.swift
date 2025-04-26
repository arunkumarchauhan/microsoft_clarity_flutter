import Flutter
import UIKit
import Clarity

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
       ClaritySDK.initialize(config: ClarityConfig(projectId: "<ProjectId>",logLevel: .verbose,applicationFramework: .native))
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
