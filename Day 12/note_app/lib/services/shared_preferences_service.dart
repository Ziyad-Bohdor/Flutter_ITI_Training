import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  Future<void> saveDarkMode(bool value) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool('darkMode', value);
  }

  Future<bool> getDarkMode() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getBool('darkMode') ?? false;
  }
}