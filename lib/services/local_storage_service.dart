// lib/services/local_storage_service.dart

import 'package:shared_preferences/shared_preferences.dart';
import '../utils/app_constants.dart';

class LocalStorageService {
  static SharedPreferences? _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<void> setLoggedInStatus(bool isLoggedIn) async {
    await _preferences?.setBool(AppConstants.kIsLoggedInKey, isLoggedIn);
  }

  static bool getLoggedInStatus() {
    return _preferences?.getBool(AppConstants.kIsLoggedInKey) ?? false;
  }

  // Method untuk menyimpan daftar ID resep favorit
  static Future<void> saveFavoriteRecipeIds(List<String> ids) async {
    await _preferences?.setStringList(AppConstants.kFavoriteRecipeIds, ids);
  }

  // Method untuk mengambil daftar ID resep favorit
  static List<String> getFavoriteRecipeIds() {
    return _preferences?.getStringList(AppConstants.kFavoriteRecipeIds) ?? [];
  }
}
