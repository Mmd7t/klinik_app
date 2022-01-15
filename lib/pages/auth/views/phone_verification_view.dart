import 'dart:ui';
import 'package:klinik_app/controllers/auth_controller.dart';
import 'package:pinput/pin_put/pin_put.dart';

import '../../../routes/app_pages.dart';
import '../../../widgets/block_button_widget.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class PhoneVerificationView extends GetView<AuthController> {
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      color: Colors.white.withOpacity(0.7),
      borderRadius: BorderRadius.circular(25.0),
    );
  }

  String phone = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Get.offAndToNamed(Routes.LOGIN);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: context.theme.accentColor,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img/auth_bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListView(
            primary: true,
            children: [
              Container(
                height: 80,
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset("assets/icon/icon.png"),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Center(
                  child: Text(
                    "Phone Verification".tr,
                    style: Get.textTheme.headline6.merge(TextStyle(
                        color: context.theme.accentColor, fontSize: 22)),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 50),
                child: Center(
                  child: Text(
                    'We sent The OTP code to your phone number, please check it and enter bellow.',
                    style: Get.textTheme.bodyText1.copyWith(height: 1.5),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.all(10),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Text('OTP Code'.tr,
                              style: Get.textTheme.subtitle2),
                        ),
                        Container(
                          width: Get.mediaQuery.size.width * 0.8,
                          child: Directionality(
                            textDirection: TextDirection.ltr,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25.0),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                                child: PinPut(
                                  fieldsCount: 6,
                                  pinAnimationType: PinAnimationType.scale,
                                  mainAxisSize: MainAxisSize.max,
                                  eachFieldMargin:
                                      const EdgeInsets.symmetric(horizontal: 2),
                                  onSaved: (newValue) {
                                    controller.code.value = int.parse(newValue);
                                  },
                                  onSubmit: (String pin) {
                                    controller.code.value = int.parse(pin);
                                  },
                                  focusNode: _pinPutFocusNode,
                                  controller: _pinPutController,
                                  autovalidateMode: AutovalidateMode.always,
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Get.theme.colorScheme.primary),
                                  submittedFieldDecoration: _pinPutDecoration,
                                  selectedFieldDecoration:
                                      _pinPutDecoration.copyWith(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Get.theme.colorScheme.primary
                                        .withOpacity(0.2),
                                  ),
                                  followingFieldDecoration:
                                      _pinPutDecoration.copyWith(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          width: Get.width,
                          child: BlockButtonWidget(
                            color: Get.theme.accentColor,
                            text: Text(
                              'Verify',
                              style: Get.textTheme.button
                                  .merge(TextStyle(color: Colors.white)),
                            ),
                            icon: null,
                            onPressed: () {
                              print(controller.phone.value);
                              controller.phone.value = phone;
                              controller.verify();
                            },
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.offAllNamed(Routes.REGISTER);
                          },
                          child: Text("You don't have an account?"),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.offAllNamed(Routes.LOGIN);
                          },
                          child: Text("You already have an account?"),
                        ).paddingOnly(bottom: 10),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
