import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klinik_app/services/app_services.dart';
import 'package:klinik_app/utils/ui.dart';

class ThemeModeView extends StatefulWidget {
  final bool hideAppBar;

  ThemeModeView({this.hideAppBar = false});

  @override
  State<ThemeModeView> createState() => _ThemeModeViewState();
}

class _ThemeModeViewState extends State<ThemeModeView> {
  final appServices = Get.find<AppServices>();
  int selectedVal;
  List<int> values = [0, 1];
  bool changeThemeToDark;
  @override
  void initState() {
    super.initState();
    selectedVal = (appServices.isDark.value) ? 1 : 0;
    changeThemeToDark = appServices.isDark.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: widget.hideAppBar
            ? null
            : AppBar(
                title: Text(
                  "Theme Mode".tr,
                  style: context.textTheme.headline6,
                ),
                centerTitle: true,
                backgroundColor: Get.theme.scaffoldBackgroundColor,
                automaticallyImplyLeading: false,
                leading: new IconButton(
                  icon: new Icon(Icons.arrow_back_ios,
                      color: Get.theme.hintColor),
                  onPressed: () => Get.back(),
                ),
                elevation: 0,
              ),
        body: ListView(
          primary: true,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: Ui.getBoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  2,
                  (index) {
                    var titles = ["Light Theme".tr, "Dark Theme".tr];
                    return RadioListTile<int>(
                      controlAffinity: ListTileControlAffinity.trailing,
                      groupValue: selectedVal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      activeColor: Theme.of(context).accentColor,
                      title: Text(
                        titles[index],
                        style: Get.textTheme.bodyText1,
                      ),
                      value: values[index],
                      onChanged: (val) {
                        setState(() {
                          selectedVal = val;
                          changeThemeToDark = (val == 0) ? false : true;
                          appServices.changeTheme(changeThemeToDark);
                        });
                      },
                    );
                  },
                ),

                //  Column(
                //   children: [
                //     RadioListTile(
                //       value: ThemeMode.light,
                //       groupValue: controller.selectedThemeMode.value,
                //       onChanged: (value) {
                //         controller.changeThemeMode(value);
                //       },
                //       title: Text("Light Theme".tr,
                //           style: Get.textTheme.bodyText2),
                //     ),
                //     RadioListTile(
                //       value: ThemeMode.dark,
                //       groupValue: controller.selectedThemeMode.value,
                //       onChanged: (value) {
                //         controller.changeThemeMode(value);
                //       },
                //       title:
                //           Text("Dark Theme".tr, style: Get.textTheme.bodyText2),
                //     ),
                //     RadioListTile(
                //       value: ThemeMode.system,
                //       groupValue: controller.selectedThemeMode.value,
                //       onChanged: (value) {
                //         controller.changeThemeMode(value);
                //       },
                //       title: Text("System Theme".tr,
                //           style: Get.textTheme.bodyText2),
                //     ),
                //   ],
                // ),
              ),
            )
          ],
        ));
  }
}
