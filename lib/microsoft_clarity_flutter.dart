import 'package:microsoft_clarity_flutter/clarity_config.dart';

import 'microsoft_clarity_flutter_platform_interface.dart';
export 'clarity_config.dart';

class MicrosoftClarityFlutter {
  Future<bool> init({required ClarityConfig config}) {
    return MicrosoftClarityFlutterPlatform.instance.init(config: config);
  }

  Future<bool> pause() {
    return MicrosoftClarityFlutterPlatform.instance.pause();
  }

  Future<bool> resume() {
    return MicrosoftClarityFlutterPlatform.instance.resume();
  }

  Future<bool> isPaused() {
    return MicrosoftClarityFlutterPlatform.instance.isPaused();
  }

  Future<String?> getCurrentSessionId() {
    return MicrosoftClarityFlutterPlatform.instance.getCurrentSessionId();
  }

  Future<String?> getCurrentSessionUrl() {
    return MicrosoftClarityFlutterPlatform.instance.getCurrentSessionUrl();
  }

  Future<bool> sendCustomEvent(String eventName) {
    return MicrosoftClarityFlutterPlatform.instance.sendCustomEvent(eventName);
  }

  Future<bool> setCurrentScreenName(String screenName) {
    return MicrosoftClarityFlutterPlatform.instance
        .setCurrentScreenName(screenName);
  }

  Future<bool> setCustomSessionId(String sessionId) {
    return MicrosoftClarityFlutterPlatform.instance
        .setCustomSessionId(sessionId);
  }

  Future<bool> setCustomTag(String customTagKey, String customTagValue) {
    return MicrosoftClarityFlutterPlatform.instance
        .setCustomTag(customTagKey, customTagValue);
  }

  Future<bool> maskView() {
    return MicrosoftClarityFlutterPlatform.instance.maskView();
  }

  Future<bool> unmaskView() {
    return MicrosoftClarityFlutterPlatform.instance.unmaskView();
  }

  Future<bool> setCustomUserId(String userId) {
    return MicrosoftClarityFlutterPlatform.instance.setCustomUserId(userId);
  }
}
