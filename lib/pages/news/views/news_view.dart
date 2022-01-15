// import 'package:doctors_appointments/
import 'package:klinik_app/controllers/home_controller.dart';
import 'package:klinik_app/pages/news/widgets/post.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klinik_app/services/app_services.dart';

class NewsView extends GetView<HomeController> {
  final appServices = Get.find<AppServices>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: (appServices.isDark.value)
            ? Colors.grey.shade900
            : Colors.grey.shade100,
        body: Obx(
          () => (controller.newsLoading.value)
              ? Center(child: CircularProgressIndicator())
              : (controller.newsModel.value.data == null)
                  ? Text('There is no data')
                  : RefreshIndicator(
                      onRefresh: () => controller.news(),
                      color: Get.theme.accentColor,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => PostContainer(
                            data: controller.newsModel.value.data[index]),
                        itemCount: controller.newsModel.value.data.length,
                      ),
                    ),
        ),
      ),
    );
  }
}
