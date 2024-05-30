import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:my_flutter_template_application/data/entities/token.dart';

const _tokenKey = 'accessToken';

mixin ITokenStorage {
  Future<void> saveToken(Token token);
  Future<Token?> getToken();
  Future<void> deleteToken();
}

class TokenStorage implements ITokenStorage {
  final FlutterSecureStorage _tokenStorage;

  TokenStorage(this._tokenStorage);

  @override
  Future<void> saveToken(Token token) {
    return _tokenStorage.write(
      key: _tokenKey,
      value: jsonEncode(token.toJson()),
    );
  }

  @override
  Future<Token?> getToken() async {
    final tokenJsonString = await _tokenStorage.read(key: _tokenKey);
    if (tokenJsonString == null) return null;
    final tokenJson = jsonDecode(tokenJsonString);
    return Token.fromJson(tokenJson as Map<String, dynamic>);
  }

  @override
  Future<void> deleteToken() async {
    return _tokenStorage.delete(key: _tokenKey);
  }
}
