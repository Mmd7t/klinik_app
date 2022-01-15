import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:klinik_app/utils/shared_prefs.dart';

class TranslationService extends GetxService {
  static const languages = ['ar', 'en'];
  List<Locale> supportedLocales() {
    return TranslationService.languages.map((_locale) {
      return Locale(_locale);
    }).toList();
  }

  getLocale() async {
    String _locale = await SharedPrefsHelper.getLanguage();
    if (_locale != null) {
      Get.updateLocale(Locale(_locale));
    }
  }

  void updateLocale(value) async {
    Get.updateLocale(Locale(value));
    print(value);
    await SharedPrefsHelper.storeLanguage(value);
    String _locale = await SharedPrefsHelper.getLanguage();
    print(_locale);
  }
}
