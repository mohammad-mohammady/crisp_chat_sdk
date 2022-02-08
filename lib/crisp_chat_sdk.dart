import 'dart:async';

import 'package:crisp_chat_sdk/user_company.dart';
import 'package:flutter/services.dart';

class CrispChatSdk {
  final MethodChannel _channel = const MethodChannel('crisp_chat_sdk');

  /// Configures the next session with the websiteID
  Future<String?> configure({required String websiteId}) async {
    final String? status = await _channel.invokeMethod('configure', websiteId);
    return status;
  }

  /// Assigns the next session with a tokenID
  Future<String?> setTokenID({required String tokenID}) async {
    final String? status = await _channel.invokeMethod('setTokenID', tokenID);
    return status;
  }

  /// Reset the session
  Future<String?> resetChatSession() async {
    final String? status = await _channel.invokeMethod(
      'resetChatSession',
    );
    return status;
  }

  /// Sets the user avatar
  Future<String?> setUserAvatar({required String avatar}) async {
    final String? status = await _channel.invokeMethod('setUserAvatar', avatar);
    return status;
  }

  /// Sets the user company
  Future<String?> setUserCompany({required UserCompany company}) async {
    final String? status =
        await _channel.invokeMethod('setUserCompany', company.toJson());
    return status;
  }

  /// Sets the user email (note: if email is invalid, this method will return false and the value will not be set)
  Future<String?> setUserEmail({required String email}) async {
    final String? status = await _channel.invokeMethod('setUserEmail', email);
    return status;
  }

  /// Sets the user name
  Future<String?> setUserNickname({required String nickname}) async {
    final String? status =
        await _channel.invokeMethod('setUserNickname', nickname);
    return status;
  }

  /// Sets the user phone (note: if phone is invalid, this method will return false and the value will not be set)
  Future<String?> setUserPhone({required String phone}) async {
    final String? status = await _channel.invokeMethod('setUserPhone', phone);
    return status;
  }

  /// Sets a session data bool
  Future<String?> setSessionBool(
      {required String key, required bool value}) async {
    final String? status = await _channel
        .invokeMethod('setSessionBool', {"key": key, "value": value});
    return status;
  }

  /// Sets a session data int
  Future<String?> setSessionInt(
      {required String key, required int value}) async {
    final String? status = await _channel
        .invokeMethod('setSessionInt', {"key": key, "value": value});
    return status;
  }

  /// Sets a session data string
  Future<String?> setSessionString(
      {required String key, required String value}) async {
    final String? status = await _channel
        .invokeMethod('setSessionString', {"key": key, "value": value});
    return status;
  }

  /// Sets a session segment
  Future<String?> setSessionSegment({
    required String segment,
  }) async {
    final String? status =
        await _channel.invokeMethod('setSessionSegment', segment);
    return status;
  }

  /// Open chat view (this method open chat page)
  Future<String?> openChat() async {
    final String? status = await _channel.invokeMethod(
      'openCrisp',
    );
    return status;
  }
}
