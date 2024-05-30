const _accessTokenKey = 'accessToken';
const _refreshTokenKey = 'refreshToken';

class Token {
  final String refreshToken;
  final String accessToken;

  Token({required this.refreshToken, required this.accessToken});

  factory Token.fromJson(Map<String, dynamic> tokenJson) {
    final accessToken = tokenJson[_accessTokenKey] as String? ?? '';
    final refreshToken = tokenJson[_refreshTokenKey] as String? ?? '';
    return Token(refreshToken: refreshToken, accessToken: accessToken);
  }

  Map<String, dynamic> toJson() {
    return {
      _accessTokenKey: accessToken,
      _refreshTokenKey: refreshToken,
    };
  }
}
