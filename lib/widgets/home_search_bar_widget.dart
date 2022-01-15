import '../routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'filter_bottom_sheet_widget.dart';

class HomeSearchBarWidget extends StatelessWidget implements PreferredSize {
  //final controller = Get.find<>();

  Widget buildSearchBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Hero(
            tag: "home_search",
            child: Container(
              height: 50,
              margin: EdgeInsets.only(bottom: 16,right: 6,left: 6),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                  color: Get.theme.primaryColor,
                  border: Border.all(
                    color: Get.theme.focusColor.withOpacity(0.2),
                  ),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.SEARCH, arguments: "home_search");
                },
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 12, left: 12),
                      child: Icon(Icons.search, color: Get.theme.accentColor),
                    ),
                    Expanded(
                      child: Text(
                        "Search for doctors...".tr,
                        maxLines: 1,
                        softWrap: false,
                        overflow: TextOverflow.fade,
                        style: Get.textTheme.caption,
                      ),
                    ),
                    SizedBox(width: 8),

                  ],
                ),
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
            margin: EdgeInsets.only(bottom: 16,right: 6,left: 6),
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
          )
        ),
      ],
    ).marginOnly(left: 14,right: 14);
  }

  @override
  Widget build(BuildContext context) {
    return buildSearchBar();
  }

  @override
  Widget get child => buildSearchBar();

  @override
  Size get preferredSize => new Size(Get.width, 80);
}
