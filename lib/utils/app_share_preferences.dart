import 'package:shared_preferences/shared_preferences.dart';

class AppSharePreferences {
  final String userIdKey = "userId";
  final String firstInitKey = "firstInitKey";
  Future<String?> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userIdKey);
  }

  Future<void> setUserId(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(userIdKey, value);
  }

  Future<bool> getFirstInitKey() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(firstInitKey) ?? true;
  }

  Future<void> setFirstInitKey(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(firstInitKey, value);
  }
}
