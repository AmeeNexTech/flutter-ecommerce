import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../../data/model/auth/user_model.dart';
import '../../utils/app_logger.dart';

class TokenService extends GetxService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  final _tokenKey = 'auth_token';
  final _userKey = 'user_data';

  Future<TokenService> init() async {
    AppLogger.i('TokenService async init done');
    return this;
  }

  // حفظ التوكن
  Future<void> saveToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  // حفظ بيانات المستخدم
  Future<void> saveUser(Map<String, dynamic> userData) async {
    final jsonString = jsonEncode(userData);
    await _storage.write(key: _userKey, value: jsonString);
  }

  // استرجاع التوكن
  Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey);
  }

  // استرجاع بيانات المستخدم
  Future<UserModel?> getUser() async {
    final jsonString = await _storage.read(key: _userKey);
    if (jsonString == null) return null;

    try {
      final Map<String, dynamic> jsonData = jsonDecode(jsonString);
      return UserModel.fromJson(jsonData);
    } catch (e) {
      return null;
    }
  }

  // حذف التوكن (تسجيل خروج)
  Future<void> deleteToken() async {
    await _storage.delete(key: _tokenKey);
    await _storage.delete(key: _userKey);
  }

  // التحقق من وجود توكن
  Future<bool> hasToken() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }
}
