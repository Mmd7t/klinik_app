import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klinik_app/utils/ui.dart';
import '../../../services/translation_service.dart';

class LanguageView extends StatelessWidget {
  final bool hideAppBar;

  LanguageView({this.hideAppBar = false});

  final translationServices = Get.find<TranslationService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: hideAppBar
            ? null
            : AppBar(
                title: Text(
                  "Languages".tr,
                  style: context.textTheme.headline6,
                ),
                centerTitle: true,
                backgroundColor: Get.theme.scaffoldBackgroundColor,
                automaticallyImplyLeading: false,
                leading: new IconButton(
                  icon: new Icon(Icons.arrow_back_ios,
                      color: Get.theme.hintColor),
                  onPressed: () => Get.back(),
                ),
                elevation: 0,
              ),
        body: ListView(
          primary: true,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: Ui.getBoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  TranslationService.languages.length,
                  (index) {
                    final List titles = ['ar'.tr, 'en_US'.tr];
                    var _lang = TranslationService.languages.elementAt(index);
                    return RadioListTile<String>(
                      // checkColor: Colors.white,
                      controlAffinity: ListTileControlAffinity.trailing,
                      groupValue: Get.locale.toString(),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      activeColor: Theme.of(context).accentColor,
                      title: Text(
                        titles[index],
                        style: Get.textTheme.bodyText1
                            .copyWith(color: Colors.grey),
                      ),
                      value: _lang,
                      onChanged: (val) {
                        translationServices.updateLocale(val);
                      },
                    );
                  },
                ),
              ),
            )
          ],
        ));
  }
}
