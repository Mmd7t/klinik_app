import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klinik_app/utils/ui.dart';
// import '../../../../common/ui.dart';

class FaqItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: Ui.getBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'ugujk ?',
            style: Get.textTheme.bodyText2,
          ),
          Divider(
            height: 30,
            thickness: 1,
          ),
          Text(
            'this.faq.answer',
            style: Get.textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
