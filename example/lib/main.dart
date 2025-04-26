import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:microsoft_clarity_flutter/microsoft_clarity_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _microsoftClarityFlutterPlugin = MicrosoftClarityFlutter();
  int counter = 0;
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.

    try {
      bool initialized = //true;
          await _microsoftClarityFlutterPlugin.init(
        config: ClarityConfig(
            logLevel: LogLevel.Verbose,
            projectId: "<projectId?",
            userId: "<UserId>"),
      );
      debugPrint("Plugin initialized : $initialized");
      platformVersion =
          await _microsoftClarityFlutterPlugin.getCurrentSessionUrl() ??
              'Unknown url version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
    debugPrint("Session Url : $platformVersion");
    bool isAppLaunched =
        await _microsoftClarityFlutterPlugin.sendCustomEvent("AppLaunchIOS");
    bool isSetCurrentScreenName = await _microsoftClarityFlutterPlugin
        .setCurrentScreenName("HomePageIOs");

    bool isSetCustomTag = await _microsoftClarityFlutterPlugin.setCustomTag(
        "tagKeyIos", "tagValueIos");

    String? sessingId =
        await _microsoftClarityFlutterPlugin.getCurrentSessionId();
    debugPrint("Session Id $sessingId");
    print(isAppLaunched);
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Running on: $_platformVersion\n'),
            Text("Count : $counter")
          ],
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          initPlatformState();
          setState(() {
            counter++;
          });
        }),
      ),
    );
  }
}
