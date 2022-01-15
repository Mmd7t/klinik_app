import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:klinik_app/models/user_bookings_model.dart';
import 'package:klinik_app/utils/ui.dart';

class BookingsListWidget extends StatelessWidget {
  final List<UserBookingsModel> data;

  BookingsListWidget(this.data);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(bottom: 10, top: 10),
      primary: true,
      shrinkWrap: false,
      itemCount: data.length,
      itemBuilder: (_, index) {
        UserBookingsModel _booking = data[index];
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: Ui.getBoxDecoration(),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: (_booking.doctor.img.endsWith('.svg'))
                        ? SvgPicture.network(
                            _booking.doctor.img,
                            width: 80,
                            height: 80,
                            placeholderBuilder: (context) => Image.asset(
                              'assets/img/loading.gif',
                              fit: BoxFit.cover,
                              width: 80,
                              height: 80,
                            ),
                          )
                        : CachedNetworkImage(
                            fit: BoxFit.cover,
                            width: 80,
                            height: 80,
                            imageUrl: _booking.doctor.img,
                            placeholder: (context, url) => Image.asset(
                              'assets/img/loading.gif',
                              fit: BoxFit.cover,
                              width: 80,
                              height: 80,
                            ),
                            errorWidget: (context, url, error) =>
                                Image.asset('assets/img/placeholder.png'),
                          ),
                  ),
                  Container(
                    width: 80,
                    child: Text("Available".tr,
                        maxLines: 1,
                        style: Get.textTheme.bodyText2.merge(
                          TextStyle(
                              color: Colors.green, height: 1.4, fontSize: 10),
                        ),
                        softWrap: false,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.fade),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.2),
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 6),
                  ),
                  // Container(
                  //   width: 80,
                  //   child: Text("Offline".tr,
                  //       maxLines: 1,
                  //       style: Get.textTheme.bodyText2.merge(
                  //         TextStyle(
                  //             color: Colors.grey, height: 1.4, fontSize: 10),
                  //       ),
                  //       softWrap: false,
                  //       textAlign: TextAlign.center,
                  //       overflow: TextOverflow.fade),
                  //   decoration: BoxDecoration(
                  //     color: Colors.grey.withOpacity(0.2),
                  //     borderRadius: BorderRadius.only(
                  //         bottomRight: Radius.circular(10),
                  //         bottomLeft: Radius.circular(10)),
                  //   ),
                  //   padding: EdgeInsets.symmetric(horizontal: 5, vertical: 6),
                  // ),
                ],
              ),
              SizedBox(width: 20),
              Expanded(
                child: Wrap(
                  runSpacing: 10,
                  alignment: WrapAlignment.end,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${data[index].doctor.name}',
                          style: Get.textTheme.bodyText2,
                          maxLines: 3,
                          // textAlign: TextAlign.end,
                        ),
                        Text(
                          '${data[index].doctor.category}',
                          style: Get.textTheme.bodyText2,
                          maxLines: 3,
                          // textAlign: TextAlign.end,
                        ),
                      ],
                    ),
                    Divider(height: 8, thickness: 1),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Review".tr,
                            style: Get.textTheme.bodyText1,
                          ),
                        ),
                        Wrap(
                          spacing: 0,
                          children: Ui.getStarsList(0.0),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Time".tr,
                            style: Get.textTheme.bodyText1,
                          ),
                        ),
                        Text(
                          '${_booking.date} - ${_booking.time}',
                          style: Get.textTheme.caption,
                        ),
                      ],
                    ),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: Text(
                    //         "Total Price".tr,
                    //         style: Get.textTheme.bodyText1,
                    //       ),
                    //     ),
                    //     // Ui.getPrice(_booking.total,
                    //     //     style: Get.textTheme.headline6),
                    //   ],
                    // ),
                    Wrap(
                      //spacing: 10,
                      children: [
                        FlatButton(
                          onPressed: () {
                            //Get.toNamed(Routes.RATING, arguments: _task);
                          },
                          shape: StadiumBorder(),
                          color: Get.theme.accentColor.withOpacity(0.1),
                          child:
                              Text("Rating".tr, style: Get.textTheme.subtitle1),
                        ),
                        const SizedBox(width: 15),
                        FlatButton(
                          onPressed: () {},
                          shape: StadiumBorder(),
                          color: Get.theme.accentColor.withOpacity(0.1),
                          child: Text("Re-Booking".tr,
                              style: Get.textTheme.subtitle1),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
