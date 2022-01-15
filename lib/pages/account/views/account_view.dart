import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:klinik_app/controllers/home_controller.dart';
import 'package:klinik_app/routes/app_pages.dart';
import 'package:klinik_app/utils/ui.dart';
import '../../../controllers/tabs_controller_.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/account_link_widget.dart';

class AccountView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    // var _currentUser = Get.find<AuthService>().user;
    return Obx(
      () => Scaffold(
          body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img/auth_bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListView(
            primary: true,
            children: [
              (controller.userProfileLoading.value)
                  ? Center(child: CircularProgressIndicator())
                  : Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Container(
                          height: 150,
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: Get.theme.accentColor,
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                  color: Get.theme.focusColor.withOpacity(0.2),
                                  blurRadius: 10,
                                  offset: Offset(0, 5)),
                            ],
                          ),
                          margin: EdgeInsets.only(bottom: 50),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Text(
                                  '${controller.userProfileModel.value.name}',
                                  style: Get.textTheme.headline6.merge(
                                      TextStyle(color: Get.theme.primaryColor)),
                                ),
                                SizedBox(height: 5),
                                Text(
                                    '${controller.userProfileModel.value.email}',
                                    style: Get.textTheme.caption.merge(
                                        TextStyle(
                                            color: Get.theme.primaryColor))),
                                SizedBox(height: 5),
                                Text(
                                    '${controller.userProfileModel.value.mobile}',
                                    style: Get.textTheme.caption.merge(
                                        TextStyle(
                                            color: Get.theme.primaryColor))),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: Ui.getBoxDecoration(
                            radius: 18,
                            border: Border.all(
                              width: 2,
                              color: Get.theme.accentColor,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            child: (controller.userProfileModel.value.img ==
                                    null)
                                ? Image.asset(
                                    'assets/img/placeholder.png',
                                    width: Get.width * 0.2,
                                  )
                                : (controller.userProfileModel.value.img
                                        .endsWith('.svg'))
                                    ? SvgPicture.network(
                                        controller.userProfileModel.value.img,
                                        placeholderBuilder: (context) =>
                                            Image.asset(
                                          'assets/img/loading.gif',
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : CachedNetworkImage(
                                        imageUrl: controller
                                            .userProfileModel.value.img,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: 100,
                                        placeholder: (context, url) =>
                                            Image.asset(
                                          'assets/img/loading.gif',
                                          fit: BoxFit.cover,
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Image.asset(
                                                'assets/img/placeholder.png'),
                                      ),
                          ),
                        ),
                      ],
                    ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        AccountLinkWidget(
                          icon: Icon(Icons.person_outline,
                              color: Get.theme.accentColor),
                          text: Text(
                            "Profile".tr,
                            style: Get.textTheme.bodyText2.copyWith(
                              color: Get.theme.accentColor.withOpacity(0.6),
                            ),
                          ),
                          onTap: (e) {
                            Get.toNamed(Routes.PROFILE_FILLING);
                          },
                        ),
                        AccountLinkWidget(
                          icon: Icon(Icons.assignment_outlined,
                              color: Get.theme.accentColor),
                          text: Text(
                            "My Bookings".tr,
                            style: Get.textTheme.bodyText2.copyWith(
                              color: Get.theme.accentColor.withOpacity(0.6),
                            ),
                          ),
                          onTap: (e) {
                            Get.find<TabsController>().changePageInRoot(1);
                          },
                        ),
                        AccountLinkWidget(
                          icon: Icon(Icons.notifications_outlined,
                              color: Get.theme.accentColor),
                          text: Text(
                            "Notifications".tr,
                            style: Get.textTheme.bodyText2.copyWith(
                              color: Get.theme.accentColor.withOpacity(0.6),
                            ),
                          ),
                          onTap: (e) {
                            Get.toNamed(Routes.NOTIFICATIONS);
                          },
                        ),
                        AccountLinkWidget(
                          icon: Icon(Icons.chat_outlined,
                              color: Get.theme.accentColor),
                          text: Text(
                            "Posts".tr,
                            style: Get.textTheme.bodyText2.copyWith(
                              color: Get.theme.accentColor.withOpacity(0.6),
                            ),
                          ),
                          onTap: (e) {
                            Get.find<TabsController>().changePageInRoot(2);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        AccountLinkWidget(
                          icon: Icon(Icons.settings_outlined,
                              color: Get.theme.accentColor),
                          text: Text(
                            "Settings".tr,
                            style: Get.textTheme.bodyText2.copyWith(
                              color: Get.theme.accentColor.withOpacity(0.6),
                            ),
                          ),
                          onTap: (e) {
                            Get.toNamed(Routes.SETTINGS);
                          },
                        ),
                        AccountLinkWidget(
                          icon: Icon(Icons.translate_outlined,
                              color: Get.theme.accentColor),
                          text: Text(
                            "Languages".tr,
                            style: Get.textTheme.bodyText2.copyWith(
                              color: Get.theme.accentColor.withOpacity(0.6),
                            ),
                          ),
                          onTap: (e) {
                            Get.toNamed(Routes.SETTINGS_LANGUAGE);
                          },
                        ),
                        AccountLinkWidget(
                          icon: Icon(Icons.brightness_6_outlined,
                              color: Get.theme.accentColor),
                          text: Text(
                            "Theme Mode".tr,
                            style: Get.textTheme.bodyText2.copyWith(
                              color: Get.theme.accentColor.withOpacity(0.6),
                            ),
                          ),
                          onTap: (e) {
                            Get.toNamed(Routes.SETTINGS_THEME_MODE);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        AccountLinkWidget(
                          icon: Icon(Icons.support_outlined,
                              color: Get.theme.accentColor),
                          text: Text(
                            "Help & FAQ".tr,
                            style: Get.textTheme.bodyText2.copyWith(
                              color: Get.theme.accentColor.withOpacity(0.6),
                            ),
                          ),
                          onTap: (e) {
                            Get.toNamed(Routes.HELP);
                          },
                        ),
                        AccountLinkWidget(
                          icon:
                              Icon(Icons.logout, color: Get.theme.accentColor),
                          text: Text(
                            "Logout".tr,
                            style: Get.textTheme.bodyText2.copyWith(
                              color: Get.theme.accentColor.withOpacity(0.6),
                            ),
                          ),
                          onTap: (e) {
                            Get.offAllNamed(Routes.LOGIN);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
