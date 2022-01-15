import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:klinik_app/utils/ui.dart';
import 'translation_service.dart';

class SettingsService extends GetxService {
  // Future<SettingsService> init() async {
  //   getLocale();
  //   return this;
  // }

  // Locale getLocale() {
  //   String _locale = GetStorage().read<String>('language');
  //   if (_locale == null || _locale.isEmpty) {
  //     _locale = 'en-US';
  //   }
  //   return Get.find<TranslationService>().fromStringToLocale(_locale);
  // }

  // ThemeMode getThemeMode() {
  //   String _themeMode = GetStorage().read<String>('theme_mode');
  //   switch (_themeMode) {
  //     case 'ThemeMode.light':
  //       // SystemChrome.setSystemUIOverlayStyle(
  //       //   SystemUiOverlayStyle.light.copyWith(
  //       //     systemNavigationBarColor: Colors.white,
  //       //     statusBarColor: Colors.white,
  //       //     statusBarIconBrightness: Brightness.dark,
  //       //   ),
  //       // );
  //       return ThemeMode.light;
  //     case 'ThemeMode.dark':
  //       // SystemChrome.setSystemUIOverlayStyle(
  //       //   SystemUiOverlayStyle.dark.copyWith(
  //       //     systemNavigationBarColor: Colors.black87,
  //       //     statusBarColor: Colors.black87,
  //       //     statusBarIconBrightness: Brightness.light,
  //       //   ),
  //       // );
  //       return ThemeMode.dark;
  //     case 'ThemeMode.system':
  //       return ThemeMode.system;
  //     default:
  //       // SystemChrome.setSystemUIOverlayStyle(
  //       //   SystemUiOverlayStyle.light.copyWith(
  //       //     systemNavigationBarColor: Colors.white,
  //       //     statusBarColor: Colors.white,
  //       //     statusBarIconBrightness: Brightness.dark,
  //       //   ),
  //       // );
  //       return ThemeMode.light;
  //   }
  // }

  ThemeData getLightTheme() {
    // TODO change font dynamically
    return ThemeData(
        primaryColor: Colors.white,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            elevation: 0, foregroundColor: Colors.white),
        brightness: Brightness.light,
        accentColor: const Color(0xFFff4000),
        dividerColor: Ui.parseColor('#8C9DA8', opacity: 0.1),
        focusColor: Ui.parseColor('#8C9DA8'),
        hintColor: Ui.parseColor('#102036'),
        scaffoldBackgroundColor: Colors.white,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(primary: const Color(0xFFff4000)),
        ),
        colorScheme: ColorScheme.light(
          primary: const Color(0xFFff4000),
          secondary: const Color(0xFFff4000),
        ),
        textTheme: GoogleFonts.getTextTheme(
          'Poppins',
          TextTheme(
            headline6: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w700,
                color: const Color(0xFFff4000),
                height: 1.3),
            headline5: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
                color: Ui.parseColor('#102036'),
                height: 1.3),
            headline4: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
                color: Ui.parseColor('#102036'),
                height: 1.3),
            headline3: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                color: Ui.parseColor('#102036'),
                height: 1.3),
            headline2: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w700,
                color: const Color(0xFFff4000),
                height: 1.4),
            headline1: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w300,
                color: Ui.parseColor('#102036'),
                height: 1.4),
            subtitle2: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
                color: Ui.parseColor('#102036'),
                height: 1.2),
            subtitle1: TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.w400,
                color: const Color(0xFFff4000),
                height: 1.2),
            bodyText2: TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.w600,
                color: Ui.parseColor('#102036'),
                height: 1.2),
            bodyText1: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: Ui.parseColor('#102036'),
                height: 1.2),
            caption: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w300,
                color: Ui.parseColor('#8C9DA8'),
                height: 1.2),
          ),
        ));
  }

  ThemeData getDarkTheme() {
    // TODO change font dynamically
    return ThemeData(
        primaryColor: Color(0xFF252525),
        floatingActionButtonTheme: FloatingActionButtonThemeData(elevation: 0),
        scaffoldBackgroundColor: Color(0xFF2C2C2C),
        brightness: Brightness.dark,
        accentColor: Ui.parseColor("#0070b3"),
        dividerColor: Ui.parseColor("#9999aa", opacity: 0.1),
        focusColor: Ui.parseColor("#9999aa"),
        hintColor: Ui.parseColor("#ccd7e6"),
        toggleableActiveColor: Ui.parseColor("#0070b3"),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(primary: const Color(0xFFff4000)),
        ),
        colorScheme: ColorScheme.dark(
          primary: Ui.parseColor("#0070b3"),
          secondary: Ui.parseColor("#0070b3"),
        ),
        textTheme: GoogleFonts.getTextTheme(
            'Poppins',
            TextTheme(
              headline6: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w700,
                  color: Ui.parseColor("#0070b3"),
                  height: 1.3),
              headline5: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                  color: Ui.parseColor("#ccd7e6"),
                  height: 1.3),
              headline4: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                  color: Ui.parseColor("#ccd7e6"),
                  height: 1.3),
              headline3: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  color: Ui.parseColor("#ccd7e6"),
                  height: 1.3),
              headline2: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w700,
                  color: Ui.parseColor("#0070b3"),
                  height: 1.4),
              headline1: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w300,
                  color: Ui.parseColor("#ccd7e6"),
                  height: 1.4),
              subtitle2: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  color: Ui.parseColor("#ccd7e6"),
                  height: 1.2),
              subtitle1: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.w400,
                  color: Ui.parseColor("#0070b3"),
                  height: 1.2),
              bodyText2: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.w600,
                  color: Ui.parseColor("#ccd7e6"),
                  height: 1.2),
              bodyText1: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  color: Ui.parseColor("#ccd7e6"),
                  height: 1.2),
              caption: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w300,
                  color: Ui.parseColor("#9999aa"),
                  height: 1.2),
            )));
  }
}
