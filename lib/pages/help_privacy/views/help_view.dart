import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).accentColor,
            elevation: 0,
            centerTitle: true,
            iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
            bottom: TabBar(
              indicatorColor: Theme.of(context).primaryColor.withOpacity(0.6),
              indicatorWeight: 3,
              tabs: List.generate(2, (index) {
                return Tab(
                    child: Text(
                  'ds',
                  softWrap: false,
                  overflow: TextOverflow.fade,
                  style: Get.textTheme.bodyText2
                      .merge(TextStyle(color: Get.theme.primaryColor)),
                ));
              }),
              labelColor: Theme.of(context).primaryColor,
            ),
            title: Text(
              "Help & Faq".tr,
              style: Theme.of(context).textTheme.headline6.merge(TextStyle(
                  letterSpacing: 1.3, color: Theme.of(context).primaryColor)),
            ),
            automaticallyImplyLeading: false,
            leading: new IconButton(
              icon:
                  new Icon(Icons.arrow_back_ios, color: Get.theme.primaryColor),
              onPressed: () => Get.back(),
            ),
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              // controller.refreshFaqs(showMessage: true);
            },
            child: TabBarView(
              children: List.generate(2, (index) {
                return SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text("Help & Support".tr, style: Get.textTheme.headline5),
                      Text("Most frequently asked questions".tr,
                              style: Get.textTheme.caption)
                          .paddingSymmetric(vertical: 5),
                      ListView.separated(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        primary: false,
                        itemCount: 2,
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 15);
                        },
                        itemBuilder: (context, indexFaq) {
                          return Text('a7a');
                        },
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
      );
  }
}
