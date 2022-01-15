import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klinik_app/pages/doctor/widgets/doctor_til_widget.dart';
import 'package:klinik_app/utils/ui.dart';
import 'package:klinik_app/widgets/text_field_widget.dart';
import '../../../widgets/block_button_widget.dart';

class BookDoctorView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Book an Appointment".tr,
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
        bottomNavigationBar: buildBlockButtonWidget(),
        body: ListView(
          children: [
            DoctorTilWidget(
              title: Text("Your Address".tr, style: Get.textTheme.subtitle2),
              content: Text(
                'controller.currentAddress.address.toString()',
                style: Get.textTheme.caption,
              ),
            ),
            //SizedBox(height: 20),
            DoctorTilWidget(
              title: Text("A Hint for the Doctor".tr,
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
            TextFieldWidget(
              hintText: "COUPON01".tr,
              labelText: "Coupon Code".tr,
              iconData: Icons.confirmation_number_outlined,
              style:
                  Get.textTheme.bodyText2.merge(TextStyle(color: Colors.green)),
              suffixIcon: MaterialButton(
                onPressed: () {
                  //controller.validateCoupon();
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                color: Get.theme.focusColor.withOpacity(0.1),
                child: Text("Validate".tr, style: Get.textTheme.bodyText1),
                elevation: 0,
              ).marginSymmetric(vertical: 4),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: Ui.getBoxDecoration(color: Colors.red),
              child: Theme(
                data: ThemeData(
                  toggleableActiveColor: Get.theme.primaryColor,
                ),
                child: RadioListTile(
                  value: false,
                  groupValue: 1,
                  onChanged: (value) {},
                  title: Text(
                    "As Soon as Possible".tr,
                  ).paddingSymmetric(vertical: 20),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: Ui.getBoxDecoration(color: Colors.red),
              child: Theme(
                data: ThemeData(
                  toggleableActiveColor: Get.theme.primaryColor,
                ),
                child: RadioListTile(
                  value: true,
                  groupValue: 0,
                  onChanged: (value) {
                    // controller.toggleScheduled(value);
                  },
                  title: Text("Schedule an Order".tr)
                      .paddingSymmetric(vertical: 20),
                ),
              ),
            ),
            AnimatedOpacity(
              opacity: 0,
              duration: Duration(milliseconds: 300),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                decoration: Ui.getBoxDecoration(),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                              "When would you like us to come to your address?",
                              style: Get.textTheme.bodyText1),
                        ),
                        SizedBox(width: 10),
                        FlatButton(
                          onPressed: () {
                            // controller.showMyDatePicker(context);
                          },
                          shape: StadiumBorder(),
                          color: Get.theme.accentColor.withOpacity(0.2),
                          child: Text("Select a Date".tr,
                              style: Get.textTheme.subtitle1),
                        ),
                      ],
                    ),
                    Divider(thickness: 1.3, height: 30),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                              "At What's time you are free in your address?",
                              style: Get.textTheme.bodyText1),
                        ),
                        SizedBox(width: 10),
                        FlatButton(
                          onPressed: () {
                            // controller.showMyTimePicker(context);
                          },
                          shape: StadiumBorder(),
                          color: Get.theme.accentColor.withOpacity(0.2),
                          child: Text("Select a time".tr,
                              style: Get.textTheme.subtitle1),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              transform: Matrix4.translationValues(0, -110, 0),
              child: Column(
                children: [
                  Text("Requested Service on".tr)
                      .paddingSymmetric(vertical: 20),
                  Text('', style: Get.textTheme.headline5),
                  Text('At', style: Get.textTheme.headline3),
                ],
              ),
            ),
          ],
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
          "Continue".tr,
          textAlign: TextAlign.center,
          style: Get.textTheme.headline6.merge(
            TextStyle(color: Get.theme.primaryColor),
          ),
        ),
        color: Get.theme.accentColor,
        onPressed: () {
          // Get.toNamed(Routes.CHECKOUT, arguments: _booking);
        },
        icon: null,
      ).paddingOnly(right: 20, left: 20),
    );
  }
}
