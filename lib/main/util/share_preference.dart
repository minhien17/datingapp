import 'package:shared_preferences/shared_preferences.dart';

class Key {
  static const String Key_Man_Name = "nameofman";
  static const String Key_Woman_Name = "nameofwoman";
  static const String Key_Love_Day = "loveday";
}

class SharedPreferenceUtil {
  static Future saveManName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(Key.Key_Man_Name, name);
  }

  static Future saveWomanName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(Key.Key_Woman_Name, name);
  }

  static Future saveLoveDay(int days) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(Key.Key_Love_Day, days);
  }

  static Future<String> getManName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(Key.Key_Man_Name) ?? "Hiển";
  }

  static Future<String> getWomanName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(Key.Key_Woman_Name) ?? "Thơ";
  }

  static Future<int> getDays() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(Key.Key_Love_Day) ?? 0;
  }
}
