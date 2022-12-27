import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:skripsi_wap/common/enum/enum.dart';

class StorageService {
  StorageService._();

  static get _androidOptions => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  static get _iosOptions => const IOSOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device);

  static FlutterSecureStorage get _storage =>
      FlutterSecureStorage(iOptions: _iosOptions, aOptions: _androidOptions);

  static Future<void> set<T>(StorageKeyEnum key, T value) async =>
      await _storage.write(key: key.name, value: jsonEncode(value));

  static Future<T?> get<T>(StorageKeyEnum key) async {
    try {
      return (jsonDecode(await _storage.read(key: key.name) ?? '') as T?);
    } catch (e) {
      return null;
    }
  }

  static Future<void> delete(StorageKeyEnum key) async =>
      await _storage.delete(key: key.name);

  static Future<bool> get isLogin async =>
      (await get<String>(StorageKeyEnum.accessToken))?.isNotEmpty ?? false;

  static Future<List<int>> get secretBox async {
    final secret = await get<String>(StorageKeyEnum.secretBox);

    if ((secret ?? '').isNotEmpty) {
      return base64Url.decode(secret!);
    } else {
      final key = Hive.generateSecureKey();
      final encode = base64UrlEncode(key);
      await set<String>(StorageKeyEnum.secretBox, encode);
      final getSecret = await get<String>(StorageKeyEnum.secretBox);
      final decode = base64Url.decode(getSecret!);

      return decode;
    }
  }
}
