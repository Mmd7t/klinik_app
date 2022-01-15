import 'package:dio/dio.dart';
import 'package:klinik_app/pages/news/views/news_view.dart';
import 'package:klinik_app/pages/speciality/views/specialities_view.dart';
import 'package:klinik_app/utils/retrofit.dart';
import '../constants.dart';
import '../pages/booking/views/bookings_view.dart';
import '../pages/alarm/views/alarms_view.dart';
import '../pages/account/views/account_view.dart';
import '../routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabsController extends GetxController {
  RestClient client = RestClient(Dio(BaseOptions(baseUrl: Constants.baseUrl)));
  final currentIndex = 2.obs;

  @override
  void onInit() {
    if (Get.arguments != null && Get.arguments is int) {
      changePageInRoot(Get.arguments as int);
    } else {
      changePageInRoot(2);
    }
    super.onInit();
  }

  List<Widget> pages = [
    SpecialitiesView(),
    BookingsView(),
    NewsView(),
    AlarmsView(),
    AccountView(),
  ];

  Widget get currentPage => pages[currentIndex.value];

  /// change page in route

  void changePageInRoot(int _index) {
    currentIndex.value = _index;
  }

  void changePageOutRoot(int _index) {
    currentIndex.value = _index;
    Get.offNamedUntil(Routes.TABS, (Route route) {
      if (route.settings.name == Routes.TABS) {
        return true;
      }
      return false;
    }, arguments: _index);
  }

  void changePage(int _index) {
    if (Get.currentRoute == Routes.TABS) {
      changePageInRoot(_index);
    } else {
      changePageOutRoot(_index);
    }
  }
}
