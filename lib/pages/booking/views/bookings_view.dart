import 'package:flutter/services.dart';
import 'package:klinik_app/controllers/home_controller.dart';

import '../../../widgets/notification_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/bookings_list_widget.dart';

class BookingsView extends StatefulWidget {
  @override
  State<BookingsView> createState() => _BookingsViewState();
}

class _BookingsViewState extends State<BookingsView> {
  final controller = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
    controller.userBookings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light,
        ),
        child: Obx(
          () => (controller.userBookingsLoading.value)
              ? Center(child: CircularProgressIndicator())
              : (controller.userBookingsList == [] ||
                      controller.userBookingsList.isEmpty ||
                      controller.userBookingsList == null)
                  ? RefreshIndicator(
                      onRefresh: () => controller.userBookings(),
                      child: Center(
                          child: Text('No Bookings',
                              style: Get.textTheme.subtitle1)),
                    )
                  : RefreshIndicator(
                      onRefresh: () => controller.userBookings(),
                      child: BookingsListWidget(controller.userBookingsList),
                    ),
        ),
      ),
    );
  }
}
