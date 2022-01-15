import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

class SharedPrefsHelper {
  static SharedPreferences prefs;

/*----------------------------------------------------------------------------*/
/*----------------------------  Initialize Prefs  ----------------------------*/
/*----------------------------------------------------------------------------*/
  static initPrefs() async {
    if (prefs == null) {
      prefs = await SharedPreferences.getInstance();
    }
  }

/*----------------------------------------------------------------------------*/
/*------------------------------  Access Token  ------------------------------*/
/*----------------------------------------------------------------------------*/
  static void saveApiKeyToPrefs(accessToken) async {
    await initPrefs();
    prefs.setString(Constants.accessTokenKey, accessToken);
  }

  static Future<String> getApiTokenFromPrefs() async {
    await initPrefs();
    String accessTokenSaved = prefs.getString(Constants.accessTokenKey);
    return accessTokenSaved;
  }

  static Future removeToken() async {
    await initPrefs();
    prefs.remove(Constants.accessTokenKey);
  }

/*----------------------------------------------------------------------------*/
/*---------------------------------  User Id  --------------------------------*/
/*----------------------------------------------------------------------------*/
  static void saveUserIdToPrefs(userid) async {
    await initPrefs();
    prefs.setInt(Constants.userIdKey, userid);
  }

  static Future<int> getUserIdFromPrefs() async {
    await initPrefs();
    int userIdSaved = prefs.getInt(Constants.userIdKey);
    return userIdSaved;
  }

  static Future removeUserId() async {
    await initPrefs();
    prefs.remove(Constants.userIdKey);
  }

/*----------------------------------------------------------------------------*/
/*--------------------------------  Language  --------------------------------*/
/*----------------------------------------------------------------------------*/
  static storeLanguage(String language) async {
    await initPrefs();
    await prefs.setString("lang", language);
  }

  static Future<String> getLanguage() async {
    await initPrefs();
    return prefs.getString("lang");
  }

  static removeLanguage() async {
    await initPrefs();
    prefs.remove("lang");
  }

/*----------------------------------------------------------------------------*/
/*--------------------------------  booking  --------------------------------*/
/*----------------------------------------------------------------------------*/
  static storeBooking(bool booking) async {
    await initPrefs();
    await prefs.setBool("booking", booking);
  }

  static Future<bool> getBooking() async {
    await initPrefs();
    return prefs.getBool("booking");
  }

  static removeBooking() async {
    await initPrefs();
    prefs.remove("booking");
  }

/*----------------------------------------------------------------------------*/
/*--------------------------------  App Theme  -------------------------------*/
/*----------------------------------------------------------------------------*/
  static Future<bool> checkTheme() async {
    final _shared = await SharedPreferences.getInstance();
    return _shared.containsKey("theme");
  }

  static Future saveTheme(bool themeId) async {
    await initPrefs();
    prefs.setBool('theme', themeId);
  }

  static Future<bool> getTheme() async {
    await initPrefs();
    bool themeIdSaved = prefs.getBool('theme');
    return themeIdSaved;
  }
}
