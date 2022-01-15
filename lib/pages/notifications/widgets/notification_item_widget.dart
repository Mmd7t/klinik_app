// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart' show DateFormat;

// import '../../../../common/ui.dart';
// // import '../../../models/notification_model.dart' as model;

// class NotificationItemWidget extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return Dismissible(
//       // key: Key(this.notification.hashCode.toString()),
//       background: Container(
//         padding: EdgeInsets.all(12),
//         margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
//         decoration: Ui.getBoxDecoration(color: Colors.red),
//         child: Align(
//           alignment: Alignment.centerRight,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 5),
//             child: Icon(
//               Icons.delete_outline,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ),
//       onDismissed: (direction) {
//         onDismissed(this.notification);
//         // Then show a snackbar
//         Get.showSnackbar(Ui.SuccessSnackBar(message: "The notification is deleted".tr));
//       },
//       child: Container(
//         padding: EdgeInsets.all(12),
//         margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
//         decoration: Ui.getBoxDecoration(color: this.notification.read ? Get.theme.primaryColor : Get.theme.focusColor.withOpacity(0.15)),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             Stack(
//               children: <Widget>[
//                 Container(
//                   width: 50,
//                   height: 50,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       gradient: LinearGradient(begin: Alignment.bottomLeft, end: Alignment.topRight, colors: [
//                         Get.theme.focusColor.withOpacity(1),
//                         Get.theme.focusColor.withOpacity(0.2),
//                       ])),
//                   child: Icon(
//                     Icons.notifications_outlined,
//                     color: Theme.of(context).scaffoldBackgroundColor,
//                     size: 30,
//                   ),
//                 ),
//                 Positioned(
//                   right: -15,
//                   bottom: -30,
//                   child: Container(
//                     width: 60,
//                     height: 60,
//                     decoration: BoxDecoration(
//                       color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.15),
//                       borderRadius: BorderRadius.circular(150),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   left: -20,
//                   top: -55,
//                   child: Container(
//                     width: 60,
//                     height: 60,
//                     decoration: BoxDecoration(
//                       color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.15),
//                       borderRadius: BorderRadius.circular(150),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             SizedBox(width: 15),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 mainAxisSize: MainAxisSize.max,
//                 children: <Widget>[
//                   Text(
//                     this.notification.type.tr,
//                     overflow: TextOverflow.ellipsis,
//                     maxLines: 3,
//                     style: Theme.of(context).textTheme.bodyText1.merge(TextStyle(fontWeight: notification.read ? FontWeight.w300 : FontWeight.w600)),
//                   ),
//                   Text(
//                     DateFormat('d, MMMM y | HH:mm').format(this.notification.createdAt),
//                     style: Theme.of(context).textTheme.caption,
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
