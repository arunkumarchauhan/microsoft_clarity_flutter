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
- On native iOS side  add following in AppDelegate.swift inside application method to nitialize  Clarity
```
       ClaritySDK.initialize(config: ClarityConfig(projectId: "<ProjectId>",logLevel: .verbose,applicationFramework: .native))
```
- No native setting required on android Side.

## Methods available are as follows:
-  ``` Future<bool> init({required ClarityConfig config}) 
```
-  ```  Future<bool> isPaused() 
```
- ``` Future<bool> maskView()
```
- ``` Future<bool> pause() 
```
- ```   Future<bool> resume() 
```
- ```   Future<bool> sendCustomEvent(String eventName)
```
- ```   Future<bool> setCurrentScreenName(String screenName)
```
- ```   Future<bool> setCustomSessionId(String sessionId) 
```
- ```   Future<bool> setCustomTag(String customTagKey, String customTagValue) 
```
- ```   Future<bool> unmaskView()
```
- ``` Future<bool> setCustomUserId(String userId)
```
