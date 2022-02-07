import 'package:flutter/material.dart';
import 'dart:async';

import 'package:crisp_chat_sdk/crisp_chat_sdk.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              initPlatformState();
            },
            child: const Text('Open crisp chat'),
          ),
        ),
      ),
    );
  }

  Future<void> initPlatformState() async {
    final sdk = CrispChatSdk();
    await sdk.configure(websiteId: "Your WebsiteId");
    await sdk.setUserEmail(email: "mohammad.mohammady.73@gmail.com");
    await sdk.setSessionString(key: "f1KEY", value: "f1value");
    await sdk.setSessionString(key: "f2KEY", value: "f2value");
    await CrispChatSdk().openChat();
  }
}
