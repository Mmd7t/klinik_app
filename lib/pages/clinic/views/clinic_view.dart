import 'package:klinik_app/utils/ui.dart';

import '../../doctor/widgets/doctor_til_widget.dart';
import '../../doctor/widgets/doctor_title_bar_widget.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ClinicView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
          onRefresh: () async {
            // controller.refreshClinic(showMessage: true);
          },
          child: CustomScrollView(
            primary: true,
            shrinkWrap: false,
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                expandedHeight: 310,
                elevation: 0,
                floating: true,
                iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
                centerTitle: true,
                automaticallyImplyLeading: false,
                leading: new IconButton(
                  icon: Container(
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, boxShadow: [
                      BoxShadow(
                        color: Get.theme.primaryColor.withOpacity(0.5),
                        blurRadius: 20,
                      ),
                    ]),
                    child: new Icon(Icons.arrow_back_ios,
                        color: Get.theme.hintColor),
                  ),
                  onPressed: () => {Get.back()},
                ),
                actions: [
                  new IconButton(
                    icon: Container(
                      decoration:
                          BoxDecoration(shape: BoxShape.circle, boxShadow: [
                        BoxShadow(
                          color: Get.theme.primaryColor.withOpacity(0.5),
                          blurRadius: 20,
                        ),
                      ]),
                      child: Icon(Icons.favorite_outline,
                          color: Get.theme.hintColor),
                    ),
                    onPressed: () {
                      // _clinic.isFavorite
                      //     ? _clinic?.isFavorite = true
                      //     : _clinic?.isFavorite = false;
                    },
                  ).marginSymmetric(horizontal: 10),
                ],
                bottom: buildDoctorTitleBarWidget(),
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  background: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: <Widget>[
                      // buildCarouselSlider(),
                      // buildCarouselBullets(),
                    ],
                  ),
                ).marginOnly(bottom: 50),
              ),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 10),
                    buildDoctors(),
                    DoctorTilWidget(
                      title: Text("Description".tr,
                          style: Get.textTheme.subtitle2),
                      content: Text('_clinic', style: Get.textTheme.bodyText1),
                    ),
                    DoctorTilWidget(
                      title: Text("Reviews & Ratings".tr,
                          style: Get.textTheme.subtitle2),
                      content: Column(
                        children: [
                          Text('rate'.toString(),
                              style: Get.textTheme.headline1),
                          Wrap(
                            children: Ui.getStarsList(3, size: 32),
                          ),
                          Text(
                            "Reviews (%s)"
                                .trArgs(['_clinic.totalReviews'.toString()]),
                            style: Get.textTheme.caption,
                          ).paddingOnly(top: 10),
                          Divider(height: 35, thickness: 1.3),
                          // CircularLoadingWidget(height: 100);
                        ],
                      ),
                      // actions: [
                      //   // TODO view all reviews
                      // ],
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  Widget buildDoctors() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Wrap(
          alignment: WrapAlignment.start,
          spacing: 5,
          runSpacing: 8,
          children: List.generate(5, (index) {
            // var _doctor = _clinic.doctors.elementAt(index);
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: Text('name', style: Get.textTheme.bodyText1),
              decoration: BoxDecoration(
                  color: Get.theme.accentColor.withOpacity(0.1),
                  border: Border.all(
                    color: Get.theme.accentColor.withOpacity(0.1),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            );
          })),
    );
  }

  DoctorTitleBarWidget buildDoctorTitleBarWidget() {
    return DoctorTitleBarWidget(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  '',
                  style: Get.textTheme.headline5.merge(TextStyle(height: 1.1)),
                  maxLines: 2,
                  softWrap: true,
                  overflow: TextOverflow.fade,
                ),
              ),
              // if (_clinic.closed == null)
              Container(
                child: Text("  .  .  .  ".tr,
                    maxLines: 1,
                    style: Get.textTheme.bodyText2.merge(
                      TextStyle(color: Colors.grey, height: 1.4, fontSize: 10),
                    ),
                    softWrap: false,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.fade),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                margin: EdgeInsets.symmetric(vertical: 3),
              ),
              // if (!_clinic.closed)
              //   Container(
              //     child: Text("Open".tr,
              //         maxLines: 1,
              //         style: Get.textTheme.bodyText2.merge(
              //           TextStyle(
              //               color: Colors.green, height: 1.4, fontSize: 10),
              //         ),
              //         softWrap: false,
              //         textAlign: TextAlign.center,
              //         overflow: TextOverflow.fade),
              //     decoration: BoxDecoration(
              //       color: Colors.green.withOpacity(0.2),
              //       borderRadius: BorderRadius.circular(8),
              //     ),
              //     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              //     margin: EdgeInsets.symmetric(vertical: 3),
              //   ),
              // if (_clinic.closed)
              //   Container(
              //     child: Text("Closed".tr,
              //         maxLines: 1,
              //         style: Get.textTheme.bodyText2.merge(
              //           TextStyle(
              //               color: Colors.grey, height: 1.4, fontSize: 10),
              //         ),
              //         softWrap: false,
              //         textAlign: TextAlign.center,
              //         overflow: TextOverflow.fade),
              //     decoration: BoxDecoration(
              //       color: Colors.grey.withOpacity(0.2),
              //       borderRadius: BorderRadius.circular(8),
              //     ),
              //     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              //     margin: EdgeInsets.symmetric(vertical: 3),
              //   ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.end,
                  children: List.from(Ui.getStarsList(3))
                    ..addAll([
                      SizedBox(width: 5),
                      Text(
                        "Reviews (%s)",
                        style: Get.textTheme.caption,
                      ),
                    ]),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // CarouselSlider buildCarouselSlider() {
  //   return CarouselSlider(
  //     options: CarouselOptions(
  //       autoPlay: true,
  //       autoPlayInterval: Duration(seconds: 7),
  //       height: 370,
  //       viewportFraction: 1.0,
  //       onPageChanged: (index, reason) {
  //         // controller.currentSlide.value = index;
  //       },
  //     ),
  //     items: _clinic.medias.map((Media media) {
  //       return Builder(
  //         builder: (BuildContext context) {
  //           return Hero(
  //             tag: controller.heroTag.value + _clinic.id,
  //             child: CachedNetworkImage(
  //               width: double.infinity,
  //               height: 350,
  //               fit: BoxFit.cover,
  //               imageUrl: media.url,
  //               placeholder: (context, url) => Image.asset(
  //                 'assets/img/loading.gif',
  //                 fit: BoxFit.cover,
  //                 width: double.infinity,
  //               ),
  //               errorWidget: (context, url, error) => Image.asset('assets/img/placeholder.png'),,
  //             ),
  //           );
  //         },
  //       );
  //     }).toList(),
  //   );
  // }

  // Container buildCarouselBullets(Clinic _clinic) {
  //   return Container(
  //     margin: EdgeInsets.symmetric(vertical: 100, horizontal: 20),
  //     child: Row(
  //       mainAxisSize: MainAxisSize.min,
  //       children: _clinic.medias.map((Media media) {
  //         return Container(
  //           width: 20.0,
  //           height: 5.0,
  //           margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
  //           decoration: BoxDecoration(
  //               borderRadius: BorderRadius.all(
  //                 Radius.circular(10),
  //               ),
  //               color: controller.currentSlide.value == _clinic.medias.indexOf(media) ? Get.theme.hintColor : Get.theme.primaryColor.withOpacity(0.4)),
  //         );
  //       }).toList(),
  //     ),
  //   );
  // }

}
