// /*
//  * Copyright (c) 2020 .
//  */

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../models/booking_model.dart';

// import '../../../../common/ui.dart';

// class PaymentDetailsWidget extends StatelessWidget {
//   const PaymentDetailsWidget({
//     Key key,
//     @required Booking booking,
//   })  : _booking = booking,
//         super(key: key);

//   final Booking _booking;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
//       margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       // decoration: Ui.getBoxDecoration(),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Column(
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
//                 child: CachedNetworkImage(
//                   height: 80,
//                   width: 80,
//                   fit: BoxFit.cover,
//                   imageUrl: _booking.doctor.media.thumb,
//                   placeholder: (context, url) => Image.asset(
//                     'assets/img/loading.gif',
//                     fit: BoxFit.cover,
//                     width: double.infinity,
//                     height: 80,
//                   ),
//                   errorWidget: (context, url, error) => Image.asset('assets/img/placeholder.png'),,
//                 ),
//               ),
//               if (_booking.doctor.available)
//                 Container(
//                   width: 80,
//                   child: Text("Available".tr,
//                       maxLines: 1,
//                       style: Get.textTheme.bodyText2.merge(
//                         TextStyle(color: Colors.green, height: 1.4, fontSize: 10),
//                       ),
//                       softWrap: false,
//                       textAlign: TextAlign.center,
//                       overflow: TextOverflow.fade),
//                   decoration: BoxDecoration(
//                     color: Colors.green.withOpacity(0.2),
//                     borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
//                   ),
//                   padding: EdgeInsets.symmetric(horizontal: 5, vertical: 6),
//                 ),
//               if (!_booking.doctor.available)
//                 Container(
//                   width: 80,
//                   child: Text("Offline".tr,
//                       maxLines: 1,
//                       style: Get.textTheme.bodyText2.merge(
//                         TextStyle(color: Colors.grey, height: 1.4, fontSize: 10),
//                       ),
//                       softWrap: false,
//                       textAlign: TextAlign.center,
//                       overflow: TextOverflow.fade),
//                   decoration: BoxDecoration(
//                     color: Colors.grey.withOpacity(0.2),
//                     borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
//                   ),
//                   padding: EdgeInsets.symmetric(horizontal: 5, vertical: 6),
//                 ),
//             ],
//           ),
//           SizedBox(width: 12),
//           Expanded(
//             child: Wrap(
//               runSpacing: 10,
//               alignment: WrapAlignment.start,
//               children: <Widget>[
//                 Row(
//                   children: [
//                     Text(
//                       _booking.doctor.name ?? '',
//                       style: Get.textTheme.bodyText2,
//                       maxLines: 3,
//                       // textAlign: TextAlign.end,
//                     ),
//                   ],
//                 ),
//                 Divider(height: 8, thickness: 1),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text("Service Payment".tr),
//                     Ui.getPrice(_booking.doctor.booking_price, style: Get.textTheme.subtitle2),
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text("Tax".tr),
//                     Ui.getPrice(_booking.tax, style: Get.textTheme.subtitle2),
//                   ],
//                 ),
//                 Divider(height: 8, thickness: 1),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text("Total".tr),
//                     Ui.getPrice(_booking.total, style: Get.textTheme.headline6),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
