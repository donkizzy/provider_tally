import 'package:shared_preferences/shared_preferences.dart';

class StorageManager {
  late final SharedPreferences _sharedPreferences;

  static const String _businessCacheKey = 'business_data_cache';

  String get businessCacheKey => _businessCacheKey;

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<bool> setString(String key, String? value) async {
    return await _sharedPreferences.setString(key, value ?? '');
  }

  String? getString(String key) {
    return _sharedPreferences.getString(key);
  }
  Future<bool> remove(String key) async {
    return await _sharedPreferences.remove(key);
  }

  Future<bool> clear() async {
    return await _sharedPreferences.clear();
  }
}