import 'package:klinik_app/utils/ui.dart';

import '../../../widgets/filter_bottom_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search".tr,
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
      body: ListView(
        children: [
          buildSearchBar(),
          // AllDoctorsListWidget(doctors: controller.doctors),
        ],
      ),
    );
  }

  Widget buildSearchBar() {
    return Row(
      children: [
        Expanded(
          child: Hero(
            tag: Get.arguments,
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 16),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
              decoration: BoxDecoration(
                  color: Get.theme.primaryColor,
                  border: Border.all(
                    color: Get.theme.focusColor.withOpacity(0.2),
                  ),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 12, left: 0),
                    child: Icon(Icons.search, color: Get.theme.accentColor),
                  ),
                  Expanded(
                    child: Material(
                      color: Get.theme.primaryColor,
                      child: TextField(
                        style: Get.textTheme.bodyText2,
                        onSubmitted: (value) {
                          // controller.searchDoctors(keywords: value);
                        },
                        autofocus: true,
                        cursorColor: Get.theme.focusColor,
                        decoration: Ui.getInputDecoration(
                            hintText: "Search for doctors...".tr),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                ],
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.bottomSheet(
              FilterBottomSheetWidget(),
              isScrollControlled: true,
            );
          },
          child: Container(
            height: 50,
            margin: EdgeInsets.only(right: 20, bottom: 16),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: Get.theme.accentColor.withOpacity(0.1),
            ),
            child: Center(
              child: Icon(
                Icons.filter_list_rounded,
                color: Get.theme.accentColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
