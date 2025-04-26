// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter

import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:microsoft_clarity_flutter/clarity_config.dart';
import 'package:web/web.dart' as web;

import 'microsoft_clarity_flutter_platform_interface.dart';

/// A web implementation of the MicrosoftClarityFlutterPlatform of the MicrosoftClarityFlutter plugin.
class MicrosoftClarityFlutterWeb implements MicrosoftClarityFlutterPlatform {
  /// Constructs a MicrosoftClarityFlutterWeb
  MicrosoftClarityFlutterWeb();

  static void registerWith(Registrar registrar) {
    MicrosoftClarityFlutterPlatform.instance = MicrosoftClarityFlutterWeb();
  }

  @override
  Future<String?> getCurrentSessionId() {
    // TODO: implement getCurrentSessionId
    throw UnimplementedError();
  }

  @override
  Future<String?> getCurrentSessionUrl() {
    // TODO: implement getCurrentSessionUrl
    throw UnimplementedError();
  }

  @override
  Future<bool> init({required ClarityConfig config}) {
    // TODO: implement init
    throw UnimplementedError();
  }

  @override
  Future<bool> isPaused() {
    // TODO: implement isPaused
    throw UnimplementedError();
  }

  @override
  Future<bool> maskView() {
    // TODO: implement maskView
    throw UnimplementedError();
  }

  @override
  Future<bool> pause() {
    // TODO: implement pause
    throw UnimplementedError();
  }

  @override
  Future<bool> resume() {
    // TODO: implement resume
    throw UnimplementedError();
  }

  @override
  Future<bool> sendCustomEvent(String eventName) {
    // TODO: implement sendCustomEvent
    throw UnimplementedError();
  }

  @override
  Future<bool> setCurrentScreenName(String screenName) {
    // TODO: implement setCurrentScreenName
    throw UnimplementedError();
  }

  @override
  Future<bool> setCustomSessionId(String sessionId) {
    // TODO: implement setCustomSessionId
    throw UnimplementedError();
  }

  @override
  Future<bool> setCustomTag(String customTagKey, String customTagValue) {
    // TODO: implement setCustomTag
    throw UnimplementedError();
  }

  @override
  Future<bool> unmaskView() {
    // TODO: implement unmaskView
    throw UnimplementedError();
  }

  @override
  Future<bool> setCustomUserId(String userId) {
    throw UnimplementedError();
  }
}
