import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klinik_app/models/doctor_details_model.dart';
import 'package:klinik_app/services/app_services.dart';
import 'package:klinik_app/utils/ui.dart';

class ProfileHeader extends StatelessWidget {
  final DoctorDetailsDatum data;
  ProfileHeader({key, this.data}) : super(key: key);
  final appServices = Get.find<AppServices>();
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 8),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
/*----------------------------------------------------------------------------------------*/
/*-----------------------------------  Profile Cover  ------------------------------------*/
/*----------------------------------------------------------------------------------------*/
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    height: MediaQuery.of(context).size.height * 0.27,
                    decoration: BoxDecoration(
                      color: Get.theme.accentColor,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: (data.profileCover == null)
                            ? AssetImage('assets/img/loading.gif')
                            : NetworkImage(data.profileCover),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.95,
                      height: MediaQuery.of(context).size.height * 0.07,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white60,
                            ),
                            child: IconButton(
                              iconSize: 20,
                              icon: Icon(Icons.arrow_back_ios_outlined,
                                  color: Get.theme.hintColor),
                              onPressed: () => {Get.back()},
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white60,
                            ),
                            child: IconButton(
                              iconSize: 20,
                              icon: Icon(Icons.favorite_outline,
                                  color: Get.theme.hintColor),
                              onPressed: () {},
                            ).marginSymmetric(horizontal: 10),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
/*----------------------------------------------------------------------------------------*/
/*------------------------------------  Profile Image  -----------------------------------*/
/*----------------------------------------------------------------------------------------*/
              Positioned(
                bottom: -65,
                left: 0,
                right: 0,
                child: CircleAvatar(
                  maxRadius: 65,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    maxRadius: 65,
                    backgroundColor: Get.theme.accentColor.withOpacity(0.5),
                    child: CircleAvatar(
                      maxRadius: 60,
                      child: ClipOval(
                        child: Container(
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: data.img,
                            placeholder: (context, url) => Image.asset(
                              'assets/img/loading.gif',
                              fit: BoxFit.cover,
                            ),
                            errorWidget: (context, url, error) =>
                                Image.asset('assets/img/placeholder.png'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 80),
/*----------------------------------------------------------------------------------------*/
/*------------------------------------  Profile Name  ------------------------------------*/
/*----------------------------------------------------------------------------------------*/
          Text(
            data.name,
            style: Theme.of(context).textTheme.headline5.copyWith(
                  color: (appServices.isDark.value)
                      ? Colors.white
                      : Colors.black87,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Get.theme.accentColor.withOpacity(0.15),
            ),
            child: Text(
              data.category,
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          const SizedBox(height: 10),
          buildSpecialities(data),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.end,
                  children:
                      List.from(Ui.getStarsList(double.parse(data.review)))
                        ..addAll([
                          SizedBox(width: 5),
                          Text(
                            "Reviews (${data.review} %s)",
                            style: Get.textTheme.caption,
                          ),
                        ]),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget buildSpecialities(DoctorDetailsDatum data) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(CupertinoIcons.home, color: Get.theme.accentColor),
                const SizedBox(width: 10),
                Text('From ${data.from}', style: Get.textTheme.bodyText1),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(CupertinoIcons.conversation_bubble,
                    color: Get.theme.accentColor),
                const SizedBox(width: 10),
                Text('Lives in ${data.live}', style: Get.textTheme.bodyText1),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(CupertinoIcons.bag, color: Get.theme.accentColor),
                const SizedBox(width: 10),
                Text('Studied ${data.eduction}',
                    style: Get.textTheme.bodyText1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
