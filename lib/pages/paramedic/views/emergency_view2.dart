import 'package:klinik_app/utils/ui.dart';

import '../../doctor/widgets/doctor_til_widget.dart';
import '../../doctor/widgets/doctor_title_bar_widget.dart';
import '../../../widgets/notification_button_widget.dart';
import '../../../widgets/block_button_widget.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class Emergency2View extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildBlockButtonWidget(),
      body: RefreshIndicator(
          onRefresh: () async {
            controller.refreshEmergency(showMessage: true);
          },
          child: CustomScrollView(
            primary: true,
            shrinkWrap: false,
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                expandedHeight: 310,
                elevation: 0,
                floating: true,
                iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
                centerTitle: true,
                automaticallyImplyLeading: false,
                leading: new IconButton(
                  icon: Container(
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, boxShadow: [
                      BoxShadow(
                        color: Get.theme.primaryColor.withOpacity(0.5),
                        blurRadius: 20,
                      ),
                    ]),
                    child: new Icon(Icons.arrow_back_ios,
                        color: Get.theme.hintColor),
                  ),
                  onPressed: () => {Get.back()},
                ),
                actions: [
                  NotificationsButtonWidget().marginSymmetric(horizontal: 10),
                ],
                bottom: buildDoctorTitleBarWidget(),
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  background: buildHeroSlider(),
                ).marginOnly(bottom: 50),
              ),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 10),
                    DoctorTilWidget(
                      title: Text("Your Address".tr,
                          style: Get.textTheme.subtitle2),
                      content: Text('address', style: Get.textTheme.caption),
                    ),
                    DoctorTilWidget(
                      title: Text("What is the case ?".tr,
                          style: Get.textTheme.subtitle2),
                      content: TextFormField(
                        initialValue: "Hint".tr,
                        style: Get.textTheme.caption,
                        decoration: Ui.getInputDecoration(
                          hintText: "A Hint for the Doctor".tr,
                          iconData: Icons.description_outlined,
                        ),
                      ),
                    ),
                    DoctorTilWidget(
                      title:
                          Text("Comments".tr, style: Get.textTheme.subtitle2),
                      content: TextFormField(
                        initialValue: "Voluptate eu laborum enim cillum".tr,
                        style: Get.textTheme.caption,
                        decoration: Ui.getInputDecoration(
                          hintText: "A Hint for the Doctor".tr,
                          iconData: Icons.description_outlined,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  Hero buildHeroSlider() {
    return Hero(
        tag: "emergency_tag",
        child: Image.asset(
          "assets/img/ambulance.png",
          fit: BoxFit.cover,
        ));
  }

  Widget buildBlockButtonWidget() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: Get.theme.primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
              color: Get.theme.focusColor.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, -5)),
        ],
      ),
      child: BlockButtonWidget(
        text: Text(
          "Call this Ambulance".tr,
          textAlign: TextAlign.center,
          style: Get.textTheme.headline6.merge(
            TextStyle(color: Get.theme.primaryColor),
          ),
        ),
        color: Colors.redAccent,
        onPressed: () {
          //Get.toNamed(Routes.BOOK_DOCTOR, arguments: {'doctor': _doctor,});
        },
        icon: null,
      ).paddingOnly(right: 20, left: 20),
    );
  }

  DoctorTitleBarWidget buildDoctorTitleBarWidget() {
    return DoctorTitleBarWidget(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Jane H. Moore',
                  style: Get.textTheme.headline5.merge(TextStyle(height: 1.1)),
                  maxLines: 2,
                  softWrap: true,
                  overflow: TextOverflow.fade,
                ),
              ),
              Container(
                child: Text("Available".tr,
                    maxLines: 1,
                    style: Get.textTheme.bodyText2.merge(
                      TextStyle(color: Colors.green, height: 1.4, fontSize: 10),
                    ),
                    softWrap: false,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.fade),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                margin: EdgeInsets.symmetric(vertical: 3),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 3, bottom: 10),
            child: Text(
              "+1 (734) 261-9818".tr,
              //style: Get.textTheme.caption.merge(TextStyle(fontSize: 16,)),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.start,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 12, bottom: 0),
            child: Text(
              "Jane H. Moore is available on 6 KM".tr,
              style: Get.textTheme.caption.merge(TextStyle(
                fontSize: 16,
              )),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
