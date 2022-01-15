import 'package:get/get.dart';
import 'package:klinik_app/pages/profile/controllers/profile_controller.dart';

import '../../../widgets/tab_bar_widget.dart' show TabBarController;
import '../controllers/settings_controller.dart';

class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabBarController>(
      () => TabBarController(),
    );
    Get.lazyPut<SettingsController>(
      () => SettingsController(),
    );
    // Get.lazyPut<ThemeModeController>(
    //   () => ThemeModeController(),
    // );
    // Get.lazyPut<LanguageController>(
    //   () => LanguageController(),
    // );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
  }
}
