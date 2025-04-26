import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:microsoft_clarity_flutter/microsoft_clarity_flutter_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelMicrosoftClarityFlutter platform = MethodChannelMicrosoftClarityFlutter();
  const MethodChannel channel = MethodChannel('microsoft_clarity_flutter');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
