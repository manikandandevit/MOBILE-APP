import 'package:get_storage/get_storage.dart';

class AppStorage {
  static final GetStorage _box = GetStorage();

  static const keyUser = 'user';
  static const keySchool = 'school';
  static const keyIsBearerToken = 'access_token';
  static const keyIsRefreshToken = 'refresh_token';
  static const String isFirstTimelogin = 'isFirstTimelogin';

  /// 🔹 Save normal data
  static Future<void> setData(String key, dynamic value) async {
    await _box.write(key, value);
  }

  /// 🔹 Get normal data
  static T? getData<T>(String key) {
    return _box.read<T>(key);
  }

  /// 🔹 Save JSON (Map)
  static Future<void> setJson(String key, Map<String, dynamic> value) async {
    await _box.write(key, value);
  }

  /// 🔹 Get JSON (Map)
  static Map<String, dynamic>? getJson(String key) {
    final data = _box.read(key);
    if (data == null) return null;
    return Map<String, dynamic>.from(data);
  }

  /// 🔹 First time check
  static bool isFirstTimeUser() {
    return _box.read(isFirstTimelogin) ?? true;
  }

  /// 🔹 After onboarding
  static void setNotFirstTime() {
    _box.write(isFirstTimelogin, false);
  }

  /// 🔹 Login status
  static bool isLoggedIn() {
    final token = _box.read(keyIsBearerToken);
    return token != null && token.toString().isNotEmpty;
  }

  static Future<void> logoutClear() async {
    await _box.remove(keyUser);
    await _box.remove(keySchool);
    await _box.remove(keyIsBearerToken);
    await _box.remove(keyIsRefreshToken);
  }

  /// 🔹 Remove one key
  static void remove(String key) {
    _box.remove(key);
  }

  /// 🔹 Clear all (logout)
  static Future<void> clear() async {
    await _box.erase();
  }
}