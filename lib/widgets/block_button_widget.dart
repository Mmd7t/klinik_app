import 'package:flutter/material.dart';

class BlockButtonWidget extends StatelessWidget {
  const BlockButtonWidget(
      {@required this.color,
      @required this.text,
      @required this.icon,
      this.border,
      @required this.onPressed});

  final Color color;
  final Widget text;
  final Image icon;
  final VoidCallback onPressed;
  final BorderSide border;

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   // border: ,
      //   boxShadow: [
      //     BoxShadow(
      //         color: this.color.withOpacity(0.3),
      //         blurRadius: 40,
      //         offset: Offset(0, 3)),
      //     BoxShadow(
      //         color: this.color.withOpacity(0.2),
      //         blurRadius: 13,
      //         offset: Offset(0, 3)),
      //   ],
      // ),
      child: TextButton(
        onPressed: this.onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          primary: this.color,
          backgroundColor: this.color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: border ?? BorderSide.none,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            this.icon == null
                ? SizedBox()
                : Container(
                    margin: EdgeInsets.only(right: 14),
                    height: 25,
                    width: 25,
                    child: this.icon,
                  ),
            this.text,
          ],
        ),
      ),
    );
  }
}
