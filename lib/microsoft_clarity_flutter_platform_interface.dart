import 'package:microsoft_clarity_flutter/clarity_config.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'microsoft_clarity_flutter_method_channel.dart';

abstract class MicrosoftClarityFlutterPlatform extends PlatformInterface {
  /// Constructs a MicrosoftClarityFlutterPlatform.
  MicrosoftClarityFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static MicrosoftClarityFlutterPlatform _instance =
      MethodChannelMicrosoftClarityFlutter();

  /// The default instance of [MicrosoftClarityFlutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelMicrosoftClarityFlutter].
  static MicrosoftClarityFlutterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MicrosoftClarityFlutterPlatform] when
  /// they register themselves.
  static set instance(MicrosoftClarityFlutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool> init({required ClarityConfig config}) {
    throw UnimplementedError('init(ClarityConfig) has not been implemented.');
  }

  Future<bool> pause() {
    throw UnimplementedError('pause() has not been implemented.');
  }

  Future<bool> resume() {
    throw UnimplementedError('resume() has not been implemented.');
  }

  Future<bool> isPaused() {
    throw UnimplementedError('isPaused() has not been implemented.');
  }

  Future<String?> getCurrentSessionId() {
    throw UnimplementedError('getCurrentSessionId() has not been implemented.');
  }

  Future<String?> getCurrentSessionUrl() {
    throw UnimplementedError(
        'getCurrentSessionUrl() has not been implemented.');
  }

  Future<bool> sendCustomEvent(String eventName) {
    throw UnimplementedError(
        'sendCustomEvent(screenName) has not been implemented.');
  }

  Future<bool> setCurrentScreenName(String screenName) {
    throw UnimplementedError(
        'setCurrentScreenName(screenName) has not been implemented.');
  }

  Future<bool> setCustomSessionId(String sessionId) {
    throw UnimplementedError(
        'setCustomSessionId(sessionId) has not been implemented.');
  }

  Future<bool> setCustomTag(String customTagKey, String customTagValue) {
    throw UnimplementedError(
        'setCustomTag(customTagKey,customTagValue) has not been implemented.');
  }

  Future<bool> maskView() {
    throw UnimplementedError('maskView() has not been implemented.');
  }

  Future<bool> setCustomUserId(String userId) {
    throw UnimplementedError(
        'setCustomUserId(userId) has not been implemented.');
  }

  Future<bool> unmaskView() {
    throw UnimplementedError('unmaskView() has not been implemented.');
  }
}
