import 'package:shared_preferences/shared_preferences.dart';

class LanguagePreferences {
  static Future<void> setSelectedLanguage(String language) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selected_language', language);
  }

  static Future<String> getSelectedLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('selected_language') ?? 'English';
  }
}
