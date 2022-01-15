import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GenderCardWidget extends StatelessWidget {
  final Image avatar;
  final VoidCallback onTap;
  final Border border;

  const GenderCardWidget({Key key, this.avatar,this.onTap,this.border})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: this.onTap,
      child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                border: border,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    child: Center(
                      child: this.avatar,
                    ),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
