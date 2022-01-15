import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klinik_app/utils/ui.dart';

class ProfileController extends GetxController {
  // var user = new User().obs;
  final hidePassword = true.obs;
  final checkedMale = false.obs;
  final checkedFeMale = false.obs;
  final selectedDate = DateTime.now().obs;

  @override
  void onInit() {
    // user.value = Get.find<AuthService>().user.value;
    super.onInit();
  }

  void saveProfileForm(GlobalKey<FormState> profileForm) {
    if (profileForm.currentState.validate()) {
      profileForm.currentState.save();
      // user.refresh();
      Get.showSnackbar(
          Ui.SuccessSnackBar(message: "Profile saved successfully".tr));
    } else {
      Get.showSnackbar(Ui.ErrorSnackBar(
          message: "There are errors in some fields please correct them!".tr));
    }
  }

  Future<Null> showMyDatePicker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value.add(Duration(days: 1)),
      firstDate: DateTime.now().add(Duration(days: 1)),
      lastDate: DateTime(2101),
      locale: Get.locale,
      builder: (BuildContext context, Widget child) {
        return child.paddingAll(10);
      },
    );
    if (picked != null) {
      selectedDate.update((val) {
        val = DateTime(
            picked.year, picked.month, picked.day, val.hour, val.minute);
      });
    }
  }

  void resetProfileForm(GlobalKey<FormState> profileForm) {
    profileForm.currentState.reset();
  }
}
