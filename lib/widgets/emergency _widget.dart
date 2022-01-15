import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EmergencyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Get.bottomSheet(
        //   // AddressBottomSheetWidget(),
        //   isScrollControlled: true,
        // );
      },
      child: Container(
        width: Get.width,
        height: 80,
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Get.theme.primaryColor,
            boxShadow: [
              BoxShadow(
                  color: Get.theme.focusColor.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(0, 5)),
            ],
            border: Border.all(color: Get.theme.focusColor.withOpacity(0.05))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    width: 60,
                    child: SvgPicture.asset(
                      "assets/img/ambulance.svg",
                      color: Colors.redAccent,
                    )),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Emergency",
                      ),
                      Text(
                        "Emergency call ?",
                        style: Get.textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Icon(
              Icons.keyboard_arrow_right,
            ),
          ],
        ),
      ),
    );
  }
}
