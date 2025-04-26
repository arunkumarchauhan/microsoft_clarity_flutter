import 'package:flutter_test/flutter_test.dart';
import 'package:microsoft_clarity_flutter/microsoft_clarity_flutter.dart';
import 'package:microsoft_clarity_flutter/microsoft_clarity_flutter_platform_interface.dart';
import 'package:microsoft_clarity_flutter/microsoft_clarity_flutter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMicrosoftClarityFlutterPlatform
    with MockPlatformInterfaceMixin
    implements MicrosoftClarityFlutterPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final MicrosoftClarityFlutterPlatform initialPlatform = MicrosoftClarityFlutterPlatform.instance;

  test('$MethodChannelMicrosoftClarityFlutter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelMicrosoftClarityFlutter>());
  });

  test('getPlatformVersion', () async {
    MicrosoftClarityFlutter microsoftClarityFlutterPlugin = MicrosoftClarityFlutter();
    MockMicrosoftClarityFlutterPlatform fakePlatform = MockMicrosoftClarityFlutterPlatform();
    MicrosoftClarityFlutterPlatform.instance = fakePlatform;

    expect(await microsoftClarityFlutterPlugin.getPlatformVersion(), '42');
  });
}
