import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrivacyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Privacy Policy".tr,
          style: Get.textTheme.headline6,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Get.theme.hintColor),
          onPressed: () => {Get.back()},
        ),
      ),
      body: Center(
        child: Text('webview'),
      ),
      // body: RefreshIndicator(
      //   onRefresh: () async {},
      //   child: WebView(
      //       initialUrl:
      //           "${Get.find<GlobalService>().baseUrl}privacy/index.html",
      //       // initialUrl: "http://handyman.smartersvision.com/mock/privacy/",
      //       javascriptMode: JavascriptMode.unrestricted),
      // ),
    );
  }
}
