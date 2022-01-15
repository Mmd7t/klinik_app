import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notifications".tr,
          style: Get.textTheme.headline6,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Get.theme.hintColor),
          onPressed: () => {Get.back()},
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // await controller.refreshNotifications(showMessage: true);
        },
        child: ListView(
          primary: true,
          children: <Widget>[
            Text("Incoming Notifications".tr, style: Get.textTheme.headline5)
                .paddingOnly(top: 25, bottom: 0, right: 22, left: 22),
            Text("Swipe item left to delete it.".tr,
                    style: Get.textTheme.caption)
                .paddingSymmetric(horizontal: 22, vertical: 5),
            notificationsList(),
          ],
        ),
      ),
    );
  }

  Widget notificationsList() {
    return ListView.separated(
        itemCount: 3,
        separatorBuilder: (context, index) {
          return SizedBox(height: 7);
        },
        shrinkWrap: true,
        primary: false,
        itemBuilder: (context, index) {
          return Container();
        });
  }
}
