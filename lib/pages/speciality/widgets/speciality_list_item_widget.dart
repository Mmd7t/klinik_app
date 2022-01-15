import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:klinik_app/models/categories_model.dart';
import 'package:klinik_app/routes/app_pages.dart';
import 'package:klinik_app/utils/ui.dart';

class SpecialityListItemWidget extends StatelessWidget {
  final CategoriesDatum speciality;
  final String heroTag;
  final bool expanded;

  SpecialityListItemWidget(
      {Key key, this.heroTag, this.expanded, this.speciality})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: Ui.getBoxDecoration(
        border: Border.fromBorderSide(BorderSide.none),
        gradient: new LinearGradient(
          colors: [
            Ui.parseColor(speciality.background, opacity: 0.6),
            Ui.parseColor(speciality.background, opacity: 0.2),
          ],
          begin: AlignmentDirectional.topStart, //const FractionalOffset(1, 0),
          end: AlignmentDirectional.topEnd,
          stops: [0.0, 0.5],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Theme(
        data: Get.theme.copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: this.expanded,
          expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
          title: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                // const SizedBox(width: 10),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Get.theme.primaryColor, width: 2),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: (speciality.img.endsWith('.svg'))
                        ? SvgPicture.network(
                            speciality.img,
                            placeholderBuilder: (context) => Image.asset(
                              'assets/img/loading.gif',
                              fit: BoxFit.cover,
                            ),
                          )
                        : CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: speciality.img,
                            placeholder: (context, url) => Image.asset(
                              'assets/img/loading.gif',
                              fit: BoxFit.cover,
                            ),
                            errorWidget: (context, url, error) =>
                                Image.asset('assets/img/placeholder.png'),
                          ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    speciality.name,
                    overflow: TextOverflow.fade,
                    softWrap: false,
                    style: Get.textTheme.headline6.copyWith(
                      color: Colors.black,
                    ),
                  ),
                ),
                Text(
                  "(" + speciality.doctors.length.toString() + ")",
                  overflow: TextOverflow.fade,
                  softWrap: false,
                  style: Get.textTheme.caption,
                ),
              ],
            ),
          ),
          children: List.generate(speciality.doctors.length, (index) {
            var _speciality = speciality.doctors.elementAt(index);
            return GestureDetector(
              onTap: () {
                // controller.docId.value = speciality.doctors[index].id;
                // controller.doctorDetails();
                Get.toNamed(Routes.DOCTOR,
                    arguments: speciality.doctors[index].id);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 16),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border:
                            Border.all(color: Get.theme.primaryColor, width: 2),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: (_speciality.img.endsWith('.svg'))
                            ? SvgPicture.network(
                                _speciality.img,
                                placeholderBuilder: (context) => Image.asset(
                                  'assets/img/loading.gif',
                                  fit: BoxFit.cover,
                                ),
                              )
                            : CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: _speciality.img,
                                placeholder: (context, url) => Image.asset(
                                  'assets/img/loading.gif',
                                  fit: BoxFit.cover,
                                ),
                                errorWidget: (context, url, error) =>
                                    Image.asset('assets/img/placeholder.png'),
                              ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(_speciality.name, style: Get.textTheme.bodyText2),
                    Spacer(),
                    Text('Review (${_speciality.review})'.toString(),
                        style: Get.textTheme.bodyText1),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Get.theme.scaffoldBackgroundColor.withOpacity(0.2),
                  border: Border(
                    top: BorderSide(
                      color: Get.theme.scaffoldBackgroundColor.withOpacity(0.3),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
