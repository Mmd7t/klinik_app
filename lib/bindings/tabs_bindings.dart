import 'package:klinik_app/controllers/home_controller.dart';

import '../widgets/tab_bar_widget.dart';
import '../controllers/tabs_controller_.dart';
import 'package:get/get.dart';

class TabsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabsController>(() => TabsController());
    // Get.lazyPut<HomeController>(() => HomeController());
    // Get.lazyPut<SearchController>(() => SearchController());

    // Get.lazyPut<NotificationsController>(() => NotificationsController());

    // Get.lazyPut<newsController>(
    //         () => newsController()
    // );
    // Get.lazyPut<AlarmsController>(() => AlarmsController());
    Get.lazyPut<TabBarController>(
      () => TabBarController(),
    );

    Get.lazyPut<HomeController>(() => HomeController());
    // Get.lazyPut<SpecialitiesController>(
    //   () => SpecialitiesController(),
    // );

    // Get.lazyPut<BookingsController>(
    //   () => BookingsController(),
    // );
  }
}
