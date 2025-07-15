import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class TokenService extends GetxService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  final _key = 'auth_token';

  Future<TokenService> init() async {
    return this;
  }

  Future<void> saveToken(String token) async {
    await _storage.write(key: _key, value: token);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: _key);
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: _key);
  }
}
