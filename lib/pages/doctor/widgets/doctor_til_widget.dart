/*
 * Copyright (c) 2020 .
 */

import 'package:flutter/material.dart';
import 'package:klinik_app/utils/ui.dart';

// import '../../../../common/ui.dart';

class DoctorTilWidget extends StatelessWidget {
  final Widget title;
  final Widget content;
  final Widget actions;
  final double horizontalPadding;

  const DoctorTilWidget(
      {Key key, this.title, this.content, this.actions, this.horizontalPadding})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 20, vertical: 15),
      decoration: Ui.getBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: title),
              Spacer(),
              if (actions != null) actions,
            ],
          ),
          Divider(
            height: 26,
            thickness: 1.2,
          ),
          content,
        ],
      ),
    );
  }
}
