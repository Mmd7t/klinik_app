/*----------------------------------------------------------------------------*/
/*------------------------------  Error Get Bar  -----------------------------*/
/*----------------------------------------------------------------------------*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

errorGetBar(String message) {
  Get.showSnackbar(GetBar(
    messageText: Text(
      message,
      style: Get.textTheme.subtitle2.copyWith(
        color: Colors.white,
        height: 1.3,
      ),
    ),
    icon: const Icon(Icons.error_outline_outlined, color: Colors.white),
    titleText: Text(
      'something wrong'.tr,
      style: Get.textTheme.subtitle1.copyWith(
        color: Colors.white,
      ),
    ),
    backgroundColor: Get.theme.colorScheme.secondary,
    barBlur: 5.0,
    borderRadius: 12.0,
    duration: const Duration(seconds: 3),
    isDismissible: true,
    margin: const EdgeInsets.all(8.0),
    snackPosition: SnackPosition.TOP,
  ));
}

/*----------------------------------------------------------------------------*/
/*------------------------------  Success Get Bar  ---------------------------*/
/*----------------------------------------------------------------------------*/
successGetBar(String message) {
  Get.showSnackbar(GetBar(
    messageText: Text(
      message,
      style: Get.textTheme.bodyText2.copyWith(
        color: Colors.white,
        height: 1.5,
      ),
    ),
    icon: const Icon(CupertinoIcons.checkmark_seal, color: Colors.white),
    backgroundColor: const Color(0xFF4DDA31),
    barBlur: 5.0,
    borderRadius: 12.0,
    duration: const Duration(seconds: 3),
    isDismissible: true,
    margin: const EdgeInsets.all(8.0),
    snackPosition: SnackPosition.TOP,
  ));
}

/*----------------------------------------------------------------------------*/
/*------------------------------  Message Get Bar  ---------------------------*/
/*----------------------------------------------------------------------------*/
messageGetBar(String message) {
  Get.showSnackbar(GetBar(
    messageText: Text(
      message,
      style: Get.textTheme.bodyText2.copyWith(
        color: Colors.white,
        height: 1.5,
      ),
    ),
    icon: const Icon(CupertinoIcons.arrow_left_circle, color: Colors.white),
    backgroundColor: Get.theme.colorScheme.primary,
    barBlur: 5.0,
    borderRadius: 12.0,
    duration: const Duration(seconds: 3),
    isDismissible: true,
    margin: const EdgeInsets.all(8.0),
    snackPosition: SnackPosition.TOP,
  ));
}

/*----------------------------------------------------------------------------*/
/*------------------------------  Loading Dialog  ----------------------------*/
/*----------------------------------------------------------------------------*/
loadingDialog() {
  Get.dialog(
    Dialog(
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'loading',
              style: Get.textTheme.bodyText1.copyWith(
                color: Get.theme.colorScheme.primary,
              ),
            ),
            const SizedBox(width: 5),
            // SpinKitCircle(),vx
            CircularProgressIndicator(color: Get.theme.colorScheme.secondary),
          ],
        ),
      ),
      insetAnimationCurve: Curves.bounceInOut,
      insetPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    barrierDismissible: false,
    transitionCurve: Curves.easeInOutBack,
  );
}
