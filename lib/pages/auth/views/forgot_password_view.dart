import 'dart:ui';
import 'package:klinik_app/utils/ui.dart';

import '../../../routes/app_pages.dart';
import '../../../widgets/block_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordView extends GetView {
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
              const SizedBox(height: 20),
              Container(
                child: Center(
                  child: Text(
                    "Forgot Password".tr,
                    style: Get.textTheme.headline6.merge(
                      TextStyle(color: context.theme.accentColor, fontSize: 22),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Center(
                  child: Text(
                    'Enter your email to send you a reset password link.',
                    style: Get.textTheme.bodyText1,
                    textAlign: TextAlign.start,
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                child: TextFormField(
                                  // initialValue: "Email address".tr,
                                  style: Get.textTheme.caption,
                                  decoration: Ui.getInputDecoration(
                                    hintText: "Email address".tr,
                                    iconData: Icons.alternate_email,
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
                                'Send Reset Link',
                                style: Get.textTheme.button
                                    .merge(TextStyle(color: Colors.white)),
                              ),
                              icon: null,
                              onPressed: () {
                                Get.offAndToNamed(Routes.TABS);
                              }),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.offAllNamed(Routes.LOGIN);
                          },
                          child: Text("You remember your password?"),
                        ).paddingOnly(bottom: 5),
                      ],
                    ),
                  ),
                ),
              ),
              //SizedBox(height: 60,),
            ],
          ),
        ],
      ),
    );
  }
}
