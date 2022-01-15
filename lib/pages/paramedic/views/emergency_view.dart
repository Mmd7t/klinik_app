import 'dart:math' as math;
import '../../../routes/app_pages.dart';
import '../../../widgets/text_field_widget.dart';
import '../../../widgets/block_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class EmergencyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
          onRefresh: () async {
            // controller.refreshEmergency(showMessage: true);
          },
          child: Stack(
            children: [
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(
                    Directionality.of(context) == TextDirection.rtl
                        ? math.pi
                        : 0),
                child: Container(
                  width: double.infinity,
                  height: 300,
                  margin: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/img/ambulance.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                      decoration: BoxDecoration(
                    color: Get.theme.accentColor.withOpacity(0.3),
                  )),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 300),
                  child: ListView(
                    primary: true,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            top: 0, bottom: 20, left: 20, right: 20),
                        child: Text(
                          "Jane H. Moore is available on 6 KM".tr,
                          //style: Get.textTheme.caption.merge(TextStyle(fontSize: 16,)),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Text(
                          "It's not necessary to answer the questions below. You may call an ambulance right now "
                              .tr,
                          style: Get.textTheme.caption
                              .merge(TextStyle(fontSize: 16)),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Text(
                          'Your Address',
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Container(
                        width: Get.width,
                        child: TextFieldWidget(
                          labelText: "Your Address".tr,
                          initialValue:
                              "607 Victor Rshd, Libertytown, Maine".tr,
                          iconData: Icons.gps_fixed,
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Text(
                          'What is the case ?'.tr,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Container(
                        width: Get.width,
                        child: TextFieldWidget(
                          labelText: "case".tr,
                          initialValue: "Car accident".tr,
                          iconData: Icons.add_box_outlined,
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Text(
                          'Comments'.tr,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Container(
                        width: Get.width,
                        child: TextFieldWidget(
                          labelText: "comments".tr,
                          initialValue: "Voluptate eu laborum enim cillum.".tr,
                          iconData: Icons.comment_bank_outlined,
                        ),
                      ),
                    ],
                  )),
              Container(
                margin: EdgeInsets.only(top: 40, left: 20),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Get.theme.primaryColor,
                  ),
                  onPressed: () {
                    Get.toNamed(Routes.TABS);
                  },
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
              child: BlockButtonWidget(
                  color: Colors.redAccent,
                  text: Text(
                    'Call This Ambulance'.tr,
                    style: Get.textTheme.button
                        .merge(TextStyle(color: Colors.white)),
                  ),
                  icon: null,
                  onPressed: () {
                    //Get.offAndToNamed(Routes.TABS);
                  }),
            ).marginOnly(bottom: 20),
          ],
        ));
  }
}
