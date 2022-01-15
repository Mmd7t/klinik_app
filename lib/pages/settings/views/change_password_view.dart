import 'package:klinik_app/utils/ui.dart';
import '../../doctor/widgets/doctor_til_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordView extends StatelessWidget {
  final bool hideAppBar;
  final GlobalKey<FormState> _profileForm = new GlobalKey<FormState>();

  ChangePasswordView({this.hideAppBar = false}) {
    // controller.profileForm = new GlobalKey<FormState>();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: hideAppBar
            ? null
            : AppBar(
                title: Text(
                  "Profile".tr,
                  style: context.textTheme.headline6,
                ),
                centerTitle: true,
                backgroundColor: Colors.transparent,
                automaticallyImplyLeading: false,
                leading: new IconButton(
                  icon: new Icon(Icons.arrow_back_ios,
                      color: Get.theme.hintColor),
                  onPressed: () => Get.back(),
                ),
                elevation: 0,
              ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: Get.theme.primaryColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                  color: Get.theme.focusColor.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(0, -5)),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    // controller.saveProfileForm(_profileForm);
                  },
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Get.theme.accentColor,
                  child: Text("Save".tr,
                      style: Get.textTheme.bodyText2
                          .merge(TextStyle(color: Get.theme.primaryColor))),
                ),
              ),
              SizedBox(width: 10),
              FlatButton(
                onPressed: () {
                  // controller.resetProfileForm(_profileForm);
                },
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Get.theme.hintColor.withOpacity(0.1),
                child: Text("Reset".tr, style: Get.textTheme.bodyText2),
              ),
            ],
          ).paddingSymmetric(vertical: 10, horizontal: 20),
        ),
        body: Form(
          key: _profileForm,
          child: ListView(
            primary: true,
            children: [
              Text("Change password".tr, style: Get.textTheme.headline5)
                  .paddingOnly(top: 25, bottom: 0, right: 22, left: 22),
              Text(
                      "Fill your old password and type new password and confirm it"
                          .tr,
                      style: Get.textTheme.caption)
                  .paddingSymmetric(horizontal: 22, vertical: 5),
              DoctorTilWidget(
                title: Text("Old Password".tr, style: Get.textTheme.subtitle2),
                content: TextFormField(
                  initialValue: "".tr,
                  style: Get.textTheme.caption,
                  decoration: Ui.getInputDecoration(
                    hintText: "••••••••••••".tr,
                    iconData: Icons.lock_outline,
                    suffixIcon: IconButton(
                      onPressed: () {
                        // controller.hidePassword.value =
                        //     !controller.hidePassword.value;
                      },
                      color: Theme.of(context).focusColor,
                      icon: Icon(Icons.visibility_outlined),
                    ),
                  ),
                ),
              ),
              DoctorTilWidget(
                title: Text("New Password".tr, style: Get.textTheme.subtitle2),
                content: TextFormField(
                  initialValue: "".tr,
                  style: Get.textTheme.caption,
                  decoration: Ui.getInputDecoration(
                    hintText: "••••••••••••".tr,
                    iconData: Icons.lock_outline,
                    suffixIcon: IconButton(
                      onPressed: () {
                        // controller.hidePassword.value =
                        //     !controller.hidePassword.value;
                      },
                      color: Theme.of(context).focusColor,
                      icon: Icon(Icons.visibility_outlined),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
