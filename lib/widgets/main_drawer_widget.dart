import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:klinik_app/controllers/home_controller.dart';
import 'package:klinik_app/controllers/tabs_controller_.dart';
import 'package:klinik_app/services/app_services.dart';

import '../routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'drawer_link_widget.dart';

class MainDrawerWidget extends StatelessWidget {
  final homeController = Get.find<HomeController>();
  final appServices = Get.find<AppServices>();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Obx(
            () => (homeController.userProfileLoading.value)
                ? Center(child: CircularProgressIndicator())
                : UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/img/auth_bg.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    currentAccountPicture: (homeController
                                .userProfileModel.value.img ==
                            null)
                        ? Container(
                            padding: const EdgeInsets.all(8),
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2, color: Colors.grey.shade600),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Image.asset('assets/img/placeholder.png'),
                          )
                        : (homeController.userProfileModel.value.img
                                .endsWith('.svg'))
                            ? SvgPicture.network(
                                homeController.userProfileModel.value.img,
                                placeholderBuilder: (context) => Image.asset(
                                  'assets/img/loading.gif',
                                  fit: BoxFit.cover,
                                ),
                              )
                            : CachedNetworkImage(
                                imageUrl:
                                    homeController.userProfileModel.value.img,
                                placeholder: (context, url) => Image.asset(
                                  'assets/img/loading.gif',
                                  fit: BoxFit.cover,
                                ),
                                errorWidget: (context, url, error) =>
                                    Image.asset('assets/img/placeholder.png'),
                              ),
                    accountName:
                        Text('${homeController.userProfileModel.value.name}'),
                    accountEmail:
                        Text('${homeController.userProfileModel.value.email}'),
                  ),
          ),
          ListTile(
            dense: true,
            title: Text(
              "Application preferences".tr,
              style: Get.textTheme.caption,
            ),
            trailing: Icon(
              Icons.remove,
              color: Get.theme.focusColor.withOpacity(0.3),
            ),
          ),
          DrawerLinkWidget(
            icon: Icons.person_outline,
            text: "Account",
            onTap: (e) {
              Get.back();
              Get.find<TabsController>().changePage(4);
            },
          ),
          DrawerLinkWidget(
            icon: Icons.settings_outlined,
            text: "Settings",
            onTap: (e) {
              Get.offAndToNamed(Routes.SETTINGS);
            },
          ),
          DrawerLinkWidget(
            icon: Icons.translate_outlined,
            text: "Languages",
            onTap: (e) {
              Get.offAndToNamed(Routes.SETTINGS_LANGUAGE);
            },
          ),
          DrawerLinkWidget(
            icon: Icons.brightness_6_outlined,
            text: appServices.isDark.value ? "Light Theme" : "Dark Theme",
            onTap: (e) {
              Get.offAndToNamed(Routes.SETTINGS_THEME_MODE);
            },
          ),
          ListTile(
            dense: true,
            title: Text(
              "Help & Privacy",
              style: Get.textTheme.caption,
            ),
            trailing: Icon(
              Icons.remove,
              color: Get.theme.focusColor.withOpacity(0.3),
            ),
          ),
          DrawerLinkWidget(
            icon: Icons.help_outline,
            text: "Help & FAQ",
            onTap: (e) {
              Get.offAndToNamed(Routes.HELP);
            },
          ),
          DrawerLinkWidget(
            icon: Icons.privacy_tip_outlined,
            text: "Privacy Policy",
            onTap: (e) {
              Get.offAndToNamed(Routes.PRIVACY);
            },
          ),
          DrawerLinkWidget(
            icon: Icons.logout,
            text: "Logout",
            onTap: (e) {
              Get.offAllNamed(Routes.LOGIN);
            },
          ),
          // if (Get.find<SettingsService>().setting.value.enableVersion)
          //   ListTile(
          //     dense: true,
          //     title: Text(
          //       "Version".tr + " " + Get.find<SettingsService>().setting.value.appVersion,
          //       style: Get.textTheme.caption,
          //     ),
          //     trailing: Icon(
          //       Icons.remove,
          //       color: Get.theme.focusColor.withOpacity(0.3),
          //     ),
          //   )
        ],
      ),
    );
  }
}
