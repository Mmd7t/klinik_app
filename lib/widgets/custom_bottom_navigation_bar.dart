import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klinik_app/services/app_services.dart';

const Color PRIMARY_COLOR = Colors.blueAccent;
const Color BACKGROUND_COLOR = Color(0xffE2E7F2);

class CustomBottomNavigationBar extends StatefulWidget {
  final Color backgroundColor;
  final Color itemColor;
  final List<CustomBottomNavigationItem> children;
  final Function(int) onChange;
  final int currentIndex;

  CustomBottomNavigationBar(
      {this.backgroundColor = BACKGROUND_COLOR,
      this.itemColor = PRIMARY_COLOR,
      this.currentIndex = 0,
      @required this.children,
      this.onChange});

  @override
  State<StatefulWidget> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  void _changeIndex(int index) {
    if (widget.onChange != null) {
      widget.onChange(index);
    }
  }

  final appServices = Get.find<AppServices>();
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          // color: widget.backgroundColor,
          decoration: BoxDecoration(
            color: (appServices.isDark.value)
                ? Colors.grey.shade900.withOpacity(0.3)
                : Colors.white.withOpacity(0.3),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: widget.children.map((item) {
              var color = item.color ?? widget.itemColor;
              var icon = item.icon;
              var label = item.label;
              int index = widget.children.indexOf(item);
              return InkWell(
                onTap: () {
                  _changeIndex(index);
                },
                child: AnimatedContainer(
                  duration: Duration(microseconds: 200),
                  padding: EdgeInsets.only(left: 10, right: 10),
                  //margin: EdgeInsets.only(top: 10, bottom: 10),
                  alignment: Alignment.center,
                  width: widget.currentIndex == index ? 65 : 60,
                  height: widget.currentIndex == index ? 65 : 60,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(icon,
                          size: 24,
                          color: widget.currentIndex == index
                              ? color
                              : Get.theme.hintColor.withOpacity(0.5)),
                      Text(
                        label ?? '',
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: widget.currentIndex == index
                              ? color
                              : Get.theme.hintColor.withOpacity(0.5),
                          fontSize: 8,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class CustomBottomNavigationItem {
  final IconData icon;
  final String label;
  final Color color;

  CustomBottomNavigationItem(
      {@required this.icon, @required this.label, this.color});
}
