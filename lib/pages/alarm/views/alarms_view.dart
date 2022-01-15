import '../../../routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlarmsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          // await controller.refreshAlarms(showMessage: true);
        },
        child: ListView(
          primary: true,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Your Alarms".tr, style: Get.textTheme.headline5)
                    .paddingSymmetric(horizontal: 22, vertical: 0),
                MaterialButton(
                        //padding: EdgeInsets.only(top: 10, bottom: 10, left: 0, right: 0),
                        elevation: 0,
                        onPressed: () {
                          Get.toNamed(Routes.ALARM);
                        },
                        shape: StadiumBorder(),
                        color: Get.theme.accentColor.withOpacity(0.2),
                        child: Text("add new alarm",
                            style: Get.textTheme.caption.merge(
                                TextStyle(color: Get.theme.accentColor))))
                    .paddingSymmetric(horizontal: 22, vertical: 0),
              ],
            ),

            Text(
                    "Swipe item left to delete it. | press on item to select it."
                        .tr,
                    style: Get.textTheme.caption)
                .paddingSymmetric(horizontal: 22, vertical: 10),
            //Text(".".tr, style: Get.textTheme.caption).paddingSymmetric(horizontal: 22, vertical: 5),
            // alarmsList(),
          ],
        ),
      ),
    );
  }
}
