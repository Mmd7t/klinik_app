import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:klinik_app/utils/ui.dart';

class ClinicsNearbyYou extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      width: Get.width,
      child: ListView.builder(
        padding: EdgeInsets.only(bottom: 10),
        primary: false,
        shrinkWrap: false,
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (_, index) {
          // var clinic = controller.clinicsNearbyYou.elementAt(index).obs;
          return GestureDetector(
            onTap: () {
              // Get.toNamed(Routes.CLINIC, arguments:{'clinic': controller.clinicsNearbyYou.elementAt(index),'heroTag': 'clinics_carousel'});
            },
            child: Container(
              width: 292,
              margin: EdgeInsetsDirectional.only(
                  end: 20, start: index == 0 ? 20 : 0),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Get.theme.primaryColor,
                  boxShadow: [
                    BoxShadow(
                        color: Get.theme.focusColor.withOpacity(0.1),
                        blurRadius: 10,
                        offset: Offset(0, 5)),
                  ],
                  border: Border.all(
                      color: Get.theme.focusColor.withOpacity(0.05))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  // Image of the card
                  Stack(
                    fit: StackFit.loose,
                    alignment: AlignmentDirectional.bottomStart,
                    children: <Widget>[
                      Hero(
                        tag: "clinics_carousel",
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          child: Image.asset(
                            'assets/img/loading.gif',
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 150,
                          ),
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        padding:
                            EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(24)),
                        child: Text(
                          "Closed".tr,
                          style: Get.textTheme.caption
                              .merge(TextStyle(color: Get.theme.primaryColor)),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'name',
                                overflow: TextOverflow.fade,
                                softWrap: false,
                                style: Get.textTheme.subtitle1,
                              ),
                              Text(
                                'about',
                                overflow: TextOverflow.fade,
                                maxLines: 2,
                                softWrap: false,
                                style: Get.textTheme.caption,
                              ),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Wrap(
                                    children: Ui.getStarsList(2),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        //SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              FlatButton(
                                padding: EdgeInsets.all(0),
                                onPressed: () {},
                                child: Icon(Icons.directions,
                                    color: Get.theme.primaryColor),
                                color: Get.theme.accentColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                              Text(
                                "Rate (%s)".trArgs([2.toString()]),
                                style: Get.textTheme.caption,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
