import 'dart:ui';
import 'package:klinik_app/controllers/auth_controller.dart';
import 'package:klinik_app/utils/ui.dart';

import '../../../routes/app_pages.dart';
import '../../../widgets/block_button_widget.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class RegisterView extends GetView<AuthController> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Center(
            child: SingleChildScrollView(
              child: Column(
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
                  const SizedBox(height: 10),
                  Container(
                    child: Center(
                      child: Text(
                        "Register".tr,
                        style: Get.textTheme.headline6.merge(TextStyle(
                            color: context.theme.accentColor, fontSize: 22)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
/*------------------------------------------  Box  ---------------------------------------*/
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
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.7),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 5),
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Please enter your name';
                                          } else {
                                            return null;
                                          }
                                        },
                                        onSaved: (newValue) {
                                          controller.name.value = newValue;
                                        },
                                        style: Get.textTheme.caption,
                                        keyboardType: TextInputType.name,
                                        textInputAction: TextInputAction.next,
                                        decoration: Ui.getInputDecoration(
                                          hintText: "Name".tr,
                                          iconData:
                                              Icons.person_outline_rounded,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.7),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 5),
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Please enter your Email';
                                          } else if (!value.isEmail) {
                                            return 'Please enter a valid email';
                                          } else {
                                            return null;
                                          }
                                        },
                                        onSaved: (newValue) {
                                          controller.email.value = newValue;
                                        },
                                        style: Get.textTheme.caption,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        textInputAction: TextInputAction.next,
                                        decoration: Ui.getInputDecoration(
                                          hintText: "Email".tr,
                                          iconData: Icons.email_outlined,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.7),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 5),
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Please enter your phone';
                                          } else {
                                            return null;
                                          }
                                        },
                                        onSaved: (newValue) {
                                          controller.phone.value = newValue;
                                        },
                                        style: Get.textTheme.caption,
                                        keyboardType: TextInputType.phone,
                                        textInputAction: TextInputAction.next,
                                        decoration: Ui.getInputDecoration(
                                          hintText: "Phone Number".tr,
                                          iconData:
                                              Icons.phone_android_outlined,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Obx(
                                () => ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: BackdropFilter(
                                    filter:
                                        ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.7),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 5),
                                        // title: Text("Password".tr, style: Get.textTheme.subtitle2),
                                        child: TextFormField(
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Please enter your password';
                                            } else {
                                              return null;
                                            }
                                          },
                                          onSaved: (newValue) {
                                            controller.password.value =
                                                newValue;
                                          },
                                          obscureText:
                                              controller.signupObsecure.value,
                                          style: Get.textTheme.caption,
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          textInputAction: TextInputAction.go,
                                          decoration: Ui.getInputDecoration(
                                            hintText: "Password".tr,
                                            iconData: Icons.lock_outline,
                                            suffixIcon: IconButton(
                                              onPressed: () {
                                                controller
                                                        .signupObsecure.value =
                                                    !controller
                                                        .signupObsecure.value;
                                              },
                                              color:
                                                  Theme.of(context).focusColor,
                                              icon: Icon(Icons
                                                  .visibility_off_outlined),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 10),
                                width: Get.width,
                                child: BlockButtonWidget(
                                  color: Get.theme.accentColor,
                                  text: Text(
                                    'Register',
                                    style: Get.textTheme.button
                                        .merge(TextStyle(color: Colors.white)),
                                  ),
                                  icon: null,
                                  onPressed: () {
                                    if (formKey.currentState.validate()) {
                                      formKey.currentState.save();
                                      controller.register();
                                    }
                                  },
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.offAllNamed(Routes.LOGIN);
                                },
                                child: Text("You already have an account?"),
                              ).paddingOnly(bottom: 5),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
