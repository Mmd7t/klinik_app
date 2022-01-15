import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Checkout".tr,
          style: context.textTheme.headline6,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Get.theme.hintColor),
          onPressed: () => Get.back(),
        ),
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 10),
        children: [
          // if (controller.paymentsList.length > 0)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListTile(
              dense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 0),
              leading: Icon(
                Icons.payment,
                color: Get.theme.hintColor,
              ),
              title: Text(
                "Payment Option".tr,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Get.textTheme.headline5,
              ),
              subtitle: Text("Select your preferred payment mode".tr,
                  style: Get.textTheme.caption),
            ),
          ),
          // ListView.separated(
          //   scrollDirection: Axis.vertical,
          //   shrinkWrap: true,
          //   primary: false,
          //   itemCount: controller.paymentsList.length,
          //   separatorBuilder: (context, index) {
          //     return SizedBox(height: 10);
          //   },
          //   itemBuilder: (context, index) {
          //     var _paymentMethod = controller.paymentsList.elementAt(index);
          //     return PaymentMethodItemWidget(paymentMethod: _paymentMethod);
          //   },
          // ),
          // if (controller.cashList.length > 0)
          //   Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 20),
          //     child: ListTile(
          //       dense: true,
          //       contentPadding: EdgeInsets.symmetric(vertical: 0),
          //       leading: Icon(
          //         Icons.monetization_on_outlined,
          //         color: Get.theme.hintColor,
          //       ),
          //       title: Text(
          //         "Cash Method".tr,
          //         maxLines: 1,
          //         overflow: TextOverflow.ellipsis,
          //         style: Get.textTheme.headline5,
          //       ),
          //       subtitle: Text("Select your preferred cash".tr, style: Get.textTheme.caption),
          //     ),
          //   ),
          // ListView.separated(
          //   scrollDirection: Axis.vertical,
          //   shrinkWrap: true,
          //   primary: false,
          //   itemCount: controller.cashList.length,
          //   separatorBuilder: (context, index) {
          //     return SizedBox(height: 10);
          //   },
          //   itemBuilder: (context, index) {
          //     var _paymentMethod = controller.cashList.elementAt(index);
          //     return PaymentMethodItemWidget(paymentMethod: _paymentMethod);
          //   },
          // ),
          // if (controller.walletList.length > 0)
          //   Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 20),
          //     child: ListTile(
          //       dense: true,
          //       contentPadding: EdgeInsets.symmetric(vertical: 0),
          //       leading: Icon(
          //         Icons.account_balance_wallet_outlined,
          //         color: Get.theme.hintColor,
          //       ),
          //       title: Text(
          //         "Wallet Method".tr,
          //         maxLines: 1,
          //         overflow: TextOverflow.ellipsis,
          //         style: Get.textTheme.headline5,
          //       ),
          //       subtitle: Text("Select your preferred wallet".tr, style: Get.textTheme.caption),
          //     ),
          //   ),
          // ListView.separated(
          //   scrollDirection: Axis.vertical,
          //   shrinkWrap: true,
          //   primary: false,
          //   itemCount: controller.walletList.length,
          //   separatorBuilder: (context, index) {
          //     return SizedBox(height: 10);
          //   },
          //   itemBuilder: (context, index) {
          //     var _paymentMethod = controller.walletList.elementAt(index);
          //     return PaymentMethodItemWidget(paymentMethod: _paymentMethod);
          //   },
          // ),
        ],
      ),
      // bottomNavigationBar: buildBottomWidget(Get.arguments as Booking),
    );
  }

  // Widget buildBottomWidget(Booking _booking) {
  //   return Container(
  //     padding: EdgeInsets.symmetric(vertical: 20),
  //     decoration: BoxDecoration(
  //       color: Get.theme.primaryColor,
  //       borderRadius: BorderRadius.all(Radius.circular(20)),
  //       boxShadow: [
  //         BoxShadow(color: Get.theme.focusColor.withOpacity(0.1), blurRadius: 10, offset: Offset(0, -5)),
  //       ],
  //     ),
  //     child: Column(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         PaymentDetailsWidget(booking: _booking),
  //         BlockButtonWidget(
  //             text: Text(
  //               "Hire & Pay Now".tr,
  //               textAlign: TextAlign.center,
  //               style: Get.textTheme.headline6.merge(
  //                 TextStyle(color: Get.theme.primaryColor),
  //               ),
  //             ),
  //             color: Get.theme.accentColor,
  //             onPressed: () {
  //               Get.toNamed(Routes.CONFIRMATION, arguments: _booking);
  //             }, icon: null,).paddingSymmetric(vertical: 10, horizontal: 20),
  //       ],
  //     ),
  //   );
  // }
}
