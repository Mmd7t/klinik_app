import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:klinik_app/utils/ui.dart';

class TextFieldWidget extends StatelessWidget {
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final TextInputType keyboardType;
  final String initialValue;
  final String hintText;
  final TextAlign textAlign;
  final String labelText;
  final TextStyle style;
  final IconData iconData;
  final bool obscureText;
  final bool isFirst;
  final bool isLast;
  final Widget suffixIcon;

  const TextFieldWidget({
    Key key,
    this.onSaved,
    this.validator,
    this.keyboardType,
    this.initialValue,
    this.hintText,
    this.iconData,
    this.labelText,
    this.obscureText,
    this.suffixIcon,
    this.isFirst,
    this.isLast,
    this.style,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 3, left: 20, right: 20),
      margin: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
      decoration: BoxDecoration(
          color: Get.theme.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                color: Get.theme.focusColor.withOpacity(0.1),
                blurRadius: 10,
                offset: Offset(0, 5)),
          ],
          border: Border.all(color: Get.theme.focusColor.withOpacity(0.05))),
      child: TextFormField(
        keyboardType: keyboardType ?? TextInputType.text,
        onSaved: onSaved,
        validator: validator,
        initialValue: initialValue ?? '',
        style: style ?? Get.textTheme.bodyText2,
        obscureText: obscureText ?? false,
        textAlign: textAlign ?? TextAlign.start,
        decoration: Ui.getInputDecoration(
          hintText: hintText ?? '',
          iconData: iconData,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}

class TextField2Widget extends StatelessWidget {
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final TextInputType keyboardType;
  final String initialValue;
  final String hintText;
  final TextAlign textAlign;
  final String labelText;
  final TextStyle style;
  final IconData iconData;
  final bool obscureText;
  final bool isFirst;
  final bool isLast;
  final Widget suffixIcon;
  final bool elevation;

  const TextField2Widget(
      {Key key,
      this.onSaved,
      this.validator,
      this.keyboardType,
      this.initialValue,
      this.hintText,
      this.iconData,
      this.labelText,
      this.obscureText,
      this.suffixIcon,
      this.isFirst,
      this.isLast,
      this.style,
      this.textAlign,
      this.elevation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 3, left: 20, right: 20),
      decoration: BoxDecoration(
          color: Get.theme.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                color: Get.theme.focusColor.withOpacity(0.1),
                blurRadius: 10,
                offset: Offset(0, 5)),
          ],
          border: Border.all(color: Get.theme.focusColor.withOpacity(0.05))),
      child: TextFormField(
        keyboardType: keyboardType ?? TextInputType.text,
        onSaved: onSaved,
        validator: validator,
        initialValue: initialValue ?? '',
        style: style ?? Get.textTheme.bodyText2,
        obscureText: obscureText ?? false,
        textAlign: textAlign ?? TextAlign.start,
        decoration: Ui.getInputDecoration(
          hintText: hintText ?? '',
          iconData: iconData,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
