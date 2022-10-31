import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/store_key.dart';
import '../model/user_model/user_model.dart';
import '../util/platform_type.dart';

abstract class TokenRepositoryProtocol {
  Future<void> remove();

  Future<void> saveToken(String token);

  Future<String?> fetchToken();

  Future<void> saveUser(UserModel userInfo);

  Future<UserModel?> fetchUser();
}

final tokenRepositoryProvider = Provider<TokenRepository>((ref) {
  return TokenRepository(ref);
});

class TokenRepository implements TokenRepositoryProtocol {
  TokenRepository(this._reader);

  late final PlatformType _platform = _reader.read(platformTypeProvider);
  final Ref _reader;
  String? _token;
  String? _userInfo;

  @override
  Future<void> remove() async {
    _token = null;
    final prefs = await SharedPreferences.getInstance();

    if (_platform == PlatformType.iOS ||
        _platform == PlatformType.android ||
        _platform == PlatformType.linux) {
      const storage = FlutterSecureStorage();
      try {
        await storage.delete(key: StoreKey.token.toString());
        await storage.delete(key: StoreKey.user.toString());
      } on Exception {
        // TODO(exception): Handle exception here
      }
    } else {
      await prefs.remove(StoreKey.token.toString());
      await prefs.remove(StoreKey.user.toString());
    }
  }

  @override
  Future<void> saveToken(String token) async {
    _token = token;
    if (_platform == PlatformType.iOS ||
        _platform == PlatformType.android ||
        _platform == PlatformType.linux) {
      const storage = FlutterSecureStorage();

      try {
        await storage.write(
          key: StoreKey.token.toString(),
          value: _token,
        );
      } on Exception {
        // TODO(exception): Handle exception here
      }
    } else {
      final prefs = await SharedPreferences.getInstance();

      await prefs.setString(
        StoreKey.token.toString(),
        _token ?? '',
      );
    }
  }

  @override
  Future<String?> fetchToken() async {
    String? tokenValue;

    if (_platform == PlatformType.iOS ||
        _platform == PlatformType.android ||
        _platform == PlatformType.linux) {
      const storage = FlutterSecureStorage();
      tokenValue = await storage.read(key: StoreKey.token.toString());
    } else {
      final prefs = await SharedPreferences.getInstance();
      tokenValue = prefs.getString(StoreKey.token.toString());
    }
    try {
      if (tokenValue != '') {
        _token = tokenValue;
      }
    } on Exception {
      return null;
    }

    return _token;
  }

  @override
  Future<void> saveUser(UserModel userInfo) async {
    _userInfo = userModelToString(userInfo);
    if (_platform == PlatformType.iOS ||
        _platform == PlatformType.android ||
        _platform == PlatformType.linux) {
      const storage = FlutterSecureStorage();

      try {
        await storage.write(
          key: StoreKey.user.toString(),
          value: _userInfo.toString(),
        );
      } on Exception {
        // TODO(exception): Handle exception here
      }
    } else {
      final prefs = await SharedPreferences.getInstance();

      await prefs.setString(
        StoreKey.user.toString(),
        _userInfo.toString() ?? '',
      );
    }
  }

  @override
  Future<UserModel?> fetchUser() async {
    UserModel? userInfoValue;

    if (_platform == PlatformType.iOS ||
        _platform == PlatformType.android ||
        _platform == PlatformType.linux) {
      const storage = FlutterSecureStorage();
      final userInfoStringValue =
          await storage.read(key: StoreKey.user.toString());
      userInfoValue = userInfoStringValue != null
          ? userModelFromJson(userInfoStringValue)
          : null;
    } else {
      final prefs = await SharedPreferences.getInstance();
      final userInfoStringValue = prefs.getString(StoreKey.user.toString());
      userInfoValue = userInfoStringValue != null
          ? userModelFromJson(userInfoStringValue)
          : null;
    }

    try {
      if (userInfoValue != null) {
        return userInfoValue;
      }
    } on Exception {
      return null;
    }

    return null;
  }
}
