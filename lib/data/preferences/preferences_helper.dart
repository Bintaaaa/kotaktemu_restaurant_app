import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  final Future<SharedPreferences> sharedPreferences;
  PreferencesHelper({required this.sharedPreferences});

  static const DARK_THEME = 'DARK_THEME';
  static const DAILY_RESTAURANT = 'DAILY_RESTAURANT';

  Future<bool> get isDarkTheme async {
    final prefs = await sharedPreferences;
    return prefs.getBool(DARK_THEME) ?? false;
  }

  void setDarkTheme(bool value) async {
    final prefs = await sharedPreferences;
    prefs.setBool(DARK_THEME, value);
  }

  Future<bool> get isDailyRestaurantActive async {
    final prefs = await sharedPreferences;
    return prefs.getBool(DAILY_RESTAURANT) ?? false;
  }

  void setDailyRestaurant(bool value) async {
    final prefs = await sharedPreferences;
    prefs.setBool(DAILY_RESTAURANT, value);
  }
}
