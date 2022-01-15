import 'package:klinik_app/widgets/notification_button_widget.dart';
import '../../../controllers/tabs_controller_.dart';
import '../../../widgets/custom_bottom_navigation_bar.dart';
import '../../../widgets/main_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabsView extends GetView<TabsController> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final titles = [
      'Specialities'.tr,
      'Bookings'.tr,
      'Posts'.tr,
      'Alarms'.tr,
      'Account'.tr,
    ];
    print('Taaaaaaaaaaaabs Page');
    return Obx(
      () => Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text(
            titles[controller.currentIndex.value],
            style: (controller.currentIndex.value == 4)
                ? Get.textTheme.headline6
                    .merge(TextStyle(color: context.theme.primaryColor))
                : Get.textTheme.headline6,
          ),
          centerTitle: true,
          backgroundColor: (controller.currentIndex.value == 4)
              ? Get.theme.accentColor
              : Get.theme.primaryColor,
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.more_vert,
                color: (controller.currentIndex.value == 4)
                    ? Colors.white
                    : Get.theme.hintColor),
            onPressed: () => scaffoldKey.currentState.openDrawer(),
          ),
          actions: [
            NotificationsButtonWidget(
                iconColor:
                    (controller.currentIndex.value == 4) ? Colors.white : null,
                labelColor:
                    (controller.currentIndex.value == 4) ? Colors.black : null)
          ],
        ),
        drawer: Drawer(
          child: MainDrawerWidget(),
          elevation: 0,
        ),
        extendBody: true,
        body: controller.currentPage,
        bottomNavigationBar: CustomBottomNavigationBar(
          backgroundColor: context.theme.scaffoldBackgroundColor,
          itemColor: context.theme.accentColor,
          currentIndex: controller.currentIndex.value,
          onChange: (index) {
            controller.changePageInRoot(index);
          },
          children: [
            CustomBottomNavigationItem(
                icon: Icons.dashboard_outlined,
                label: "Specialities".tr,
                color: Get.theme.accentColor),
            CustomBottomNavigationItem(
                icon: Icons.assignment_outlined,
                label: "Bookings".tr,
                color: Get.theme.accentColor),
            CustomBottomNavigationItem(
                icon: Icons.note_alt_outlined,
                label: "Posts".tr,
                color: Get.theme.accentColor),
            CustomBottomNavigationItem(
                icon: Icons.alarm_on_outlined,
                label: "Alarms".tr,
                color: Get.theme.accentColor),
            CustomBottomNavigationItem(
                icon: Icons.person_outline,
                label: "Account".tr,
                color: Get.theme.accentColor),
          ],
        ),
      ),
    );
  }
}
