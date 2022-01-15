import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klinik_app/controllers/doctor_view_controller.dart';
import 'package:klinik_app/models/news_model.dart';
import 'package:klinik_app/routes/app_pages.dart';
import 'package:klinik_app/services/app_services.dart';

import 'post_description.dart';
import 'post_states.dart';

class PostContainer extends StatelessWidget {
  final NewsDatum data;

  PostContainer({Key key, this.data}) : super(key: key);
  final appServices = Get.find<AppServices>();
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: appServices.isDark.value ? Colors.grey.shade800 : Colors.white,
      margin: EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 5.0,
      ),
      elevation: 1.0,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GestureDetector(
                    onTap: () {
                      print(data.doctors.id);
                      Get.put<DoctorViewController>(DoctorViewController(),
                              permanent: true)
                          .doctorNews(data.doctors.id);
                      Get.toNamed(Routes.DOCTOR, arguments: data.doctors.id);
                    },
                    child: _PostHeader(
                      img: data.doctors.img,
                      name: data.doctors.name,
                      job: data.doctors.category,
                      time: data.doctors.createdAt == null
                          ? ''
                          : '${data.doctors.createdAt.day}/${data.doctors.createdAt.month}/${data.doctors.createdAt.year}',
                    ),
                  ),
                  Divider(color: Colors.grey.shade300, height: 20),
                  const SizedBox(height: 10),
                  PostDescription(description: data.content),
                  const SizedBox(height: 6.0),
                ],
              ),
            ),
            (data.img == null)
                ? const SizedBox()
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: data.img,
                        placeholder: (context, url) => Image.asset(
                          'assets/img/loading.gif',
                          fit: BoxFit.cover,
                        ),
                        errorWidget: (context, url, error) => const SizedBox(),
                      ),
                    ),
                  ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: PostStats(data: data),
            ),
          ],
        ),
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final String img;
  final String name;
  final String time;
  final String job;

  _PostHeader({Key key, this.img, this.name, this.time, this.job})
      : super(key: key);
  final appServices = Get.find<AppServices>();
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // ProfileAvatar(imageUrl: post.user.imageUrl),
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Get.theme.primaryColor, width: 2),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: img,
              placeholder: (context, url) => Image.asset(
                'assets/img/loading.gif',
                fit: BoxFit.cover,
              ),
              errorWidget: (context, url, error) =>
                  Image.asset('assets/img/placeholder.png'),
            ),
          ),
        ),
        const SizedBox(width: 8.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: Theme.of(context).textTheme.subtitle1.fontSize,
                  color:
                      (appServices.isDark.value) ? Colors.white : Colors.black,
                ),
              ),
              Text(
                job,
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 12.0,
                ),
              ),
              Text(
                time,
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 10.0,
                ),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text('+ Follow'.tr),
        ),
        // IconButton(
        //   icon: const Icon(Icons.more_horiz, color: Colors.black54),
        //   onPressed: () => print('More'),
        // ),
      ],
    );
  }
}
