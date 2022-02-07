# crisp_chat_sdk

Impelemented native Crisp chat sdk on android and ios

### Preview


Android implementation:

1-Add: implementation 'androidx.multidex:multidex:2.0.1' to dependencies build.gradle like below:

```html
dependencies {
    …
    implementation 'androidx.multidex:multidex:2.0.1'
}
```


2-Enable multiDexEnabled true  in build.gradle like this:

```html
defaultConfig {
    …
    multiDexEnabled true
}
```



3-Set min sdk on 19 in build.gradle like below:

```html
defaultConfig {
    …
    multiDexEnabled true

	minSdkVersion 19
}
```

IOS implementation:

1-Run below commands in terminal in root of project:

```html
cd ios
pod install
```

| Property | Description |
| --- | --- |
| `configure` | configure the Website ID(Go to your <a href="https://app.crisp.chat/">Crisp Dashboard</a>, and copy your Website ID:) ** this method must be called and call before other methods |
| `setTokenID` | Assigns the next session with a tokenID |
| `resetChatSession` | Reset the session |
| `setUserAvatar` | Sets the user avatar |
| `setUserCompany` | Sets the user company  |
| `setUserEmail` | Sets the user email (note: if email is invalid, this method will return false and the value will not be set)  |
| `setUserNickname` | Sets the user name  |
| `setUserPhone` | Sets the user phone (note: if phone is invalid, this method will return false and the value will not be set)  |
| `setSessionBool` | Sets a session data bool  |
| `setSessionInt` | Sets a session data int  |
| `setSessionString` | Sets a session data string  |
| `setSessionSegment` | Sets a session segment  |
| `openChat` | Open chat view (this method open chat page)  |



Usage
-----

```dart
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

```