import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:klinik_app/controllers/home_controller.dart';
import 'package:klinik_app/routes/app_pages.dart';
import 'package:klinik_app/services/app_services.dart';
import '../../../widgets/home_search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpecialitiesView extends GetView<HomeController> {
  final appServices = Get.find<AppServices>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: Column(
          children: [
            HomeSearchBarWidget(),
            Expanded(
              child: (controller.categoriesLoading.value)
                  ? Center(child: CircularProgressIndicator())
                  : (controller.categoriesModel.value.data == null)
                      ? Center(child: Text('There is no data'))
                      : RefreshIndicator(
                          onRefresh: () => controller.categories(),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: GridView.builder(
                              itemCount:
                                  controller.categoriesModel.value.data.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 5,
                                      mainAxisSpacing: 5),
                              itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  Get.bottomSheet(
                                    Container(
                                      decoration: BoxDecoration(
                                        color:
                                            Get.theme.scaffoldBackgroundColor,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        children: List.generate(
                                            controller
                                                .categoriesModel
                                                .value
                                                .data[index]
                                                .doctors
                                                .length, (index) {
                                          var _speciality = controller
                                              .categoriesModel
                                              .value
                                              .data[index]
                                              .doctors
                                              .elementAt(index);
                                          return GestureDetector(
                                            onTap: () {
                                              // controller.docId.value = speciality.doctors[index].id;
                                              // controller.doctorDetails();
                                              Get.toNamed(Routes.DOCTOR,
                                                  arguments: controller
                                                      .categoriesModel
                                                      .value
                                                      .data[index]
                                                      .doctors[index]
                                                      .id);
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 25, vertical: 16),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: 40,
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      border: Border.all(
                                                          color: Get.theme
                                                              .primaryColor,
                                                          width: 2),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      child: (_speciality.img
                                                              .endsWith('.svg'))
                                                          ? SvgPicture.network(
                                                              _speciality.img,
                                                              placeholderBuilder:
                                                                  (context) =>
                                                                      Image
                                                                          .asset(
                                                                'assets/img/loading.gif',
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            )
                                                          : CachedNetworkImage(
                                                              fit: BoxFit.cover,
                                                              imageUrl:
                                                                  _speciality
                                                                      .img,
                                                              placeholder:
                                                                  (context,
                                                                          url) =>
                                                                      Image
                                                                          .asset(
                                                                'assets/img/loading.gif',
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                              errorWidget: (context,
                                                                      url,
                                                                      error) =>
                                                                  Icon(Icons
                                                                      .error_outline),
                                                            ),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 10),
                                                  Text(_speciality.name,
                                                      style: Get
                                                          .textTheme.bodyText2),
                                                  Spacer(),
                                                  Text(
                                                      'Review (${_speciality.review})'
                                                          .toString(),
                                                      style: Get
                                                          .textTheme.bodyText1),
                                                ],
                                              ),
                                              decoration: BoxDecoration(
                                                color: Get.theme
                                                    .scaffoldBackgroundColor
                                                    .withOpacity(0.2),
                                                border: Border(
                                                  top: BorderSide(
                                                    color: Get.theme
                                                        .scaffoldBackgroundColor
                                                        .withOpacity(0.3),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                      ),
                                    ),
                                  );
                                },
                                child: Card(
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  color: appServices.isDark.value
                                      ? Colors.grey.shade800
                                      : Colors.white,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          border: Border.all(
                                              color: Get.theme.primaryColor,
                                              width: 2),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          child: (controller.categoriesModel
                                                  .value.data[index].img
                                                  .endsWith('.svg'))
                                              ? SvgPicture.network(
                                                  controller.categoriesModel
                                                      .value.data[index].img,
                                                  placeholderBuilder:
                                                      (context) => Image.asset(
                                                    'assets/img/loading.gif',
                                                    fit: BoxFit.cover,
                                                  ),
                                                )
                                              : CachedNetworkImage(
                                                  fit: BoxFit.cover,
                                                  imageUrl: controller
                                                      .categoriesModel
                                                      .value
                                                      .data[index]
                                                      .img,
                                                  placeholder: (context, url) =>
                                                      Image.asset(
                                                    'assets/img/loading.gif',
                                                    fit: BoxFit.cover,
                                                  ),
                                                  errorWidget: (context, url,
                                                          error) =>
                                                      Icon(Icons.error_outline),
                                                ),
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      Text(
                                          controller.categoriesModel.value
                                              .data[index].name,
                                          style: Get.textTheme.bodyText2),
                                      const SizedBox(height: 10),
                                      Text(
                                          '${controller.categoriesModel.value.data[index].doctors.length} doctors'
                                              .toString(),
                                          style: Get.textTheme.bodyText1),
                                      const SizedBox(height: 20),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // child: ListView.separated(
                          //   scrollDirection: Axis.vertical,
                          //   shrinkWrap: true,
                          //   primary: false,
                          //   itemCount:
                          //       controller.categoriesModel.value.data.length,
                          //   separatorBuilder: (context, index) {
                          //     return SizedBox(height: 10);
                          //   },
                          //   itemBuilder: (context, index) {
                          //     return SpecialityListItemWidget(
                          //       heroTag: 'category_list',
                          //       expanded: index == 0,
                          //       speciality: controller
                          //           .categoriesModel.value.data[index],
                          //     );
                          //   },
                          // ),
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
