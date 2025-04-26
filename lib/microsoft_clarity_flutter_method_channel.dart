import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:microsoft_clarity_flutter/clarity_config.dart';

import 'microsoft_clarity_flutter_platform_interface.dart';

/// An implementation of [MicrosoftClarityFlutterPlatform] that uses method channels.
class MethodChannelMicrosoftClarityFlutter
    implements MicrosoftClarityFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('microsoft_clarity_flutter');

  @override
  Future<String?> getCurrentSessionId() {
    return methodChannel.invokeMethod("getCurrentSessionId");
  }

  @override
  Future<String?> getCurrentSessionUrl() {
    return methodChannel.invokeMethod("getCurrentSessionUrl");
  }

  @override
  Future<bool> init({required ClarityConfig config}) async {
    final bool isInitialized =
        await methodChannel.invokeMethod("init", config.toMap());
    return isInitialized;
  }

  @override
  Future<bool> isPaused() async {
    final bool isPaused = await methodChannel.invokeMethod("isPaused");
    return isPaused;
  }

  @override
  Future<bool> maskView() async {
    final bool isMasked = await methodChannel.invokeMethod("maskView");
    return isMasked;
  }

  @override
  Future<bool> pause() async {
    bool isPaused = await methodChannel.invokeMethod("pause");
    return isPaused;
  }

  @override
  Future<bool> resume() async {
    bool isResume = await methodChannel.invokeMethod("resume");
    return isResume;
  }

  @override
  Future<bool> sendCustomEvent(String eventName) async {
    bool eventSent = await methodChannel
        .invokeMethod("sendCustomEvent", {"eventName": eventName});
    return eventSent;
  }

  @override
  Future<bool> setCurrentScreenName(String screenName) async {
    bool screenNameSet = await methodChannel
        .invokeMethod("setCurrentScreenName", {"screenName": screenName});
    return screenNameSet;
  }

  @override
  Future<bool> setCustomSessionId(String sessionId) async {
    bool isCustomSessionIdSet = await methodChannel
        .invokeMethod("setCustomSessionId", {"sessionId": sessionId});
    return isCustomSessionIdSet;
  }

  @override
  Future<bool> setCustomTag(String customTagKey, String customTagValue) async {
    bool isCustomTagSet = await methodChannel.invokeMethod("setCustomTag",
        {"customTagKey": customTagKey, "customTagValue": customTagValue});
    return isCustomTagSet;
  }

  @override
  Future<bool> unmaskView() async {
    bool isUnMasked = await methodChannel.invokeMethod("unmaskView");

    return isUnMasked;
  }

  @override
  Future<bool> setCustomUserId(String userId) async {
    bool isCustomerIdSet =
        await methodChannel.invokeMethod("setCustomUserId", {"userId": userId});
    return isCustomerIdSet;
  }
}
