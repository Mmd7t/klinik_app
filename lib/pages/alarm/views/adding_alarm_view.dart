import 'package:klinik_app/utils/ui.dart';

import '../../doctor/widgets/doctor_til_widget.dart';
import '../../../widgets/block_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class AddAlarmView extends StatelessWidget {
  final GlobalKey<FormState> _alarmForm = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "New alarm".tr,
          style: context.textTheme.headline6,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Get.theme.hintColor),
          onPressed: () => Get.back(),
        ),
        elevation: 0,
      ),
      body: Form(
        key: _alarmForm,
        child: ListView(
          primary: true,
          children: [
            Text("Alarm details".tr, style: Get.textTheme.headline5)
                .paddingOnly(top: 25, bottom: 0, right: 22, left: 22),
            Text("Change the following details and save them".tr,
                    style: Get.textTheme.caption)
                .paddingSymmetric(horizontal: 22, vertical: 5),
            DoctorTilWidget(
              title: Text("Select Drug".tr, style: Get.textTheme.subtitle2),
              content: TextFormField(
                initialValue: "Vitamin C".tr,
                style: Get.textTheme.caption,
                decoration: Ui.getInputDecoration(
                  hintText: "Vitamin C".tr,
                  iconData: Icons.medical_services_outlined,
                ),
              ),
            ),
            DoctorTilWidget(
              title: Text("frequencies".tr, style: Get.textTheme.subtitle2),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                        padding: EdgeInsets.only(top: 17, bottom: 17),
                        child: Text('')),
                  ),
                  MaterialButton(
                      padding: EdgeInsets.only(
                          top: 10, bottom: 10, left: 20, right: 20),
                      elevation: 0,
                      onPressed: () {},
                      shape: StadiumBorder(),
                      color: Get.theme.accentColor.withOpacity(0.2),
                      child: Icon(
                        Icons.access_time,
                        color: Get.theme.primaryColor,
                      )).paddingOnly(top: 0, bottom: 0, right: 0, left: 0),
                ],
              ),
            ),
            DoctorTilWidget(
              title: Text("Start from".tr, style: Get.textTheme.subtitle2),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                        padding: EdgeInsets.only(top: 17, bottom: 17),
                        child: Text('')),
                  ),
                  MaterialButton(
                      padding: EdgeInsets.only(
                          top: 10, bottom: 10, left: 20, right: 20),
                      elevation: 0,
                      onPressed: () {},
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
              title: Text("End at".tr, style: Get.textTheme.subtitle2),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                        padding: EdgeInsets.only(top: 17, bottom: 17),
                        child: Text('')),
                  ),
                  MaterialButton(
                      padding: EdgeInsets.only(
                          top: 10, bottom: 10, left: 20, right: 20),
                      elevation: 0,
                      onPressed: () {
                        // controller.showMyDatePicker(context,controller.alarm.value.end_at,1);
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
          ],
        ),
      ),
      bottomNavigationBar: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            width: Get.width,
            color: Get.theme.primaryColor,
            child: BlockButtonWidget(
                color: Get.theme.accentColor,
                text: Text(
                  'Add to list'.tr,
                  style: Get.textTheme.button
                      .merge(TextStyle(color: Colors.white)),
                ),
                icon: null,
                onPressed: () {
                  //Get.toNamed(Routes.ALARM);
                }),
          )
        ],
      ).marginOnly(bottom: 20),
    );
  }
}
