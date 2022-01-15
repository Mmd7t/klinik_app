import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klinik_app/routes/app_pages.dart';
import 'package:klinik_app/services/app_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final appServices = Get.find<AppServices>();
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      if (appServices.accessToken.value == '' ||
          appServices.accessToken.value == null) {
        Get.offNamed(Routes.LOGIN);
      } else {
        Get.offNamed(Routes.TABS);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
