# microsoft_clarity_flutter

Flutter Microsoft Clarity Analytics interaction plugin

## Getting Started

- Initialize the plugin as 
```
  final _microsoftClarityFlutterPlugin = MicrosoftClarityFlutter();
      await _microsoftClarityFlutterPlugin.init(
        config: ClarityConfig(
            logLevel: LogLevel.Verbose,
            projectId: "<projectId?",
            userId: "<UserId>"),
```
- On native iOS side  add following in AppDelegate.swift  to initialize  Clarity
```
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

```
- No native setting required on android Side.

## Methods available are as follows:
<br/>
-  ```  Future<bool> init({required ClarityConfig config}) ```
<br/>
-  ```  Future<bool> isPaused() ```
<br/>
- ``` Future<bool> maskView()```
<br/>
- ``` Future<bool> pause() ```
<br/>
- ```   Future<bool> resume() ```
<br/>
- ```   Future<bool> sendCustomEvent(String eventName)```
<br/>
- ```   Future<bool> setCurrentScreenName(String screenName)```
<br/>
- ```   Future<bool> setCustomSessionId(String sessionId) ```
<br/>
- ```   Future<bool> setCustomTag(String customTagKey, String customTagValue)```
<br/>
- ```   Future<bool> unmaskView()```
<br/>
- ``` Future<bool> setCustomUserId(String userId)```
