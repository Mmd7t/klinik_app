import 'package:klinik_app/utils/ui.dart';

import '../../doctor/widgets/doctor_til_widget.dart';
import '../../../widgets/gender_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';
import 'package:intl/intl.dart' show DateFormat;

class ProfileView extends GetView<ProfileController> {
  final bool hideAppBar;
  final GlobalKey<FormState> _profileForm = new GlobalKey<FormState>();

  ProfileView({this.hideAppBar = false}) {
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
                backgroundColor: Get.theme.scaffoldBackgroundColor,
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
                    controller.saveProfileForm(_profileForm);
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
                  controller.resetProfileForm(_profileForm);
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
              Text("Profile details".tr, style: Get.textTheme.headline5)
                  .paddingOnly(top: 25, bottom: 0, right: 22, left: 22),
              Text("Change the following details and save them".tr,
                      style: Get.textTheme.caption)
                  .paddingSymmetric(horizontal: 22, vertical: 5),
              DoctorTilWidget(
                title: Text("Full Name".tr, style: Get.textTheme.subtitle2),
                content: TextFormField(
                  // onSaved: (input) => controller.user.value.name = input,
                  validator: (input) => input.length < 3
                      ? "Should be more than 3 letters".tr
                      : null,
                  // initialValue: controller.user.value.name,
                  style: Get.textTheme.bodyText2,
                  decoration: Ui.getInputDecoration(
                    hintText: "John Doe".tr,
                    iconData: Icons.person_outline,
                  ),
                ),
              ),
              DoctorTilWidget(
                title: Text("Email".tr, style: Get.textTheme.subtitle2),
                content: TextFormField(
                  // onSaved: (input) => controller.user.value.email = input,
                  validator: (input) =>
                      !input.contains('@') ? "Should be a valid email" : null,
                  // initialValue: controller.user.value.email,
                  style: Get.textTheme.bodyText2,
                  decoration: Ui.getInputDecoration(
                    hintText: "johndoe@gmail.com".tr,
                    iconData: Icons.alternate_email,
                  ),
                ),
              ),
              DoctorTilWidget(
                title: Text("Phone Number".tr, style: Get.textTheme.subtitle2),
                content: TextFormField(
                  // initialValue: controller.user.value.phone,
                  style: Get.textTheme.bodyText2,
                  keyboardType: TextInputType.number,
                  decoration: Ui.getInputDecoration(
                    hintText: "+1 223 665 7896".tr,
                    iconData: Icons.phone_android_outlined,
                  ),
                ),
              ),
              DoctorTilWidget(
                title: Text("Address".tr, style: Get.textTheme.subtitle2),
                content: TextFormField(
                  // onSaved: (input) => controller.user.value.address = input,
                  validator: (input) => input.length < 3
                      ? "Should be more than 3 letters".tr
                      : null,
                  // initialValue: controller.user.value.address,
                  style: Get.textTheme.bodyText2,
                  decoration: Ui.getInputDecoration(
                    hintText: "123 Street, City 136, State, Country".tr,
                    iconData: Icons.map_outlined,
                  ),
                ),
              ),
              DoctorTilWidget(
                title: Text("Gender".tr, style: Get.textTheme.subtitle2),
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(() {
                      return GenderCardWidget(
                        avatar: Image.asset('assets/img/women.png'),
                        border: controller.checkedFeMale == true
                            ? Border.all(
                                width: 2,
                                color: Get.theme.accentColor.withOpacity(0.2))
                            : null,
                        onTap: () {
                          {
                            if (controller.checkedFeMale.value) {
                              controller.checkedFeMale.value = false;
                            } else {
                              controller.checkedFeMale.value = true;
                              controller.checkedMale.value = false;
                            }
                          }
                          ;
                        },
                      );
                    }),
                    Obx(() {
                      return GenderCardWidget(
                        border: controller.checkedMale == true
                            ? Border.all(
                                width: 2,
                                color: Get.theme.accentColor.withOpacity(0.2))
                            : null,
                        avatar: Image.asset('assets/img/man.png'),
                        onTap: () {
                          {
                            if (controller.checkedMale.value) {
                              controller.checkedMale.value = false;
                            } else {
                              controller.checkedMale.value = true;
                              controller.checkedFeMale.value = false;
                            }
                          }
                          ;
                        },
                      );
                    }),
                  ],
                ),
              ),
              DoctorTilWidget(
                title: Text("Date Of Birth".tr, style: Get.textTheme.subtitle2),
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(() {
                      return Expanded(
                        child: Container(
                            padding: EdgeInsets.only(top: 17, bottom: 17),
                            child: Text(
                                '${DateFormat.yMMMd().format(controller.selectedDate.value)}')),
                      );
                    }),
                    MaterialButton(
                        padding: EdgeInsets.only(
                            top: 10, bottom: 10, left: 20, right: 20),
                        elevation: 0,
                        onPressed: () {
                          controller.showMyDatePicker(context);
                        },
                        shape: StadiumBorder(),
                        color: Get.theme.accentColor.withOpacity(0.2),
                        child: Icon(
                          Icons.date_range_outlined,
                          color: Get.theme.primaryColor,
                        )).paddingOnly(top: 0, bottom: 0, right: 0, left: 0),
                  ],
                ),
              ),
              DoctorTilWidget(
                title: Text("Height".tr, style: Get.textTheme.subtitle2),
                content: TextFormField(
                  initialValue: "".tr,
                  style: Get.textTheme.caption,
                  keyboardType: TextInputType.number,
                  decoration: Ui.getInputDecoration(
                    hintText: "1.80 CM".tr,
                    suffixIcon: Icon(
                      Icons.height,
                    ),
                  ),
                ),
              ),
              DoctorTilWidget(
                title: Text("Weight".tr, style: Get.textTheme.subtitle2),
                content: TextFormField(
                  initialValue: "".tr,
                  style: Get.textTheme.caption,
                  keyboardType: TextInputType.number,
                  decoration: Ui.getInputDecoration(
                    hintText: "72 KG".tr,
                    suffixIcon: Icon(
                      Icons.new_releases_outlined,
                    ),
                  ),
                ),
              ),
              Text("Change password".tr, style: Get.textTheme.headline5)
                  .paddingOnly(top: 25, bottom: 0, right: 22, left: 22),
              Text(
                      "Fill your old password and type new password and confirm it"
                          .tr,
                      style: Get.textTheme.caption)
                  .paddingSymmetric(horizontal: 22, vertical: 5),
              Obx(() {
                return DoctorTilWidget(
                  title:
                      Text("Old Password".tr, style: Get.textTheme.subtitle2),
                  content: TextFormField(
                    initialValue: "".tr,
                    style: Get.textTheme.caption,
                    decoration: Ui.getInputDecoration(
                      hintText: "••••••••••••".tr,
                      iconData: Icons.lock_outline,
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.hidePassword.value =
                              !controller.hidePassword.value;
                        },
                        color: Theme.of(context).focusColor,
                        icon: Icon(controller.hidePassword.value
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined),
                      ),
                    ),
                  ),
                );
              }),
              Obx(() {
                return DoctorTilWidget(
                  title:
                      Text("New Password".tr, style: Get.textTheme.subtitle2),
                  content: TextFormField(
                    initialValue: "".tr,
                    style: Get.textTheme.caption,
                    decoration: Ui.getInputDecoration(
                      hintText: "••••••••••••".tr,
                      iconData: Icons.lock_outline,
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.hidePassword.value =
                              !controller.hidePassword.value;
                        },
                        color: Theme.of(context).focusColor,
                        icon: Icon(controller.hidePassword.value
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined),
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ));
  }
}
