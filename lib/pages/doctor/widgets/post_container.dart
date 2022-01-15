import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klinik_app/models/news_model.dart';
import 'package:klinik_app/pages/news/widgets/post_description.dart';

class DoctorPostContainer extends StatelessWidget {
  final NewsDatum data;

  const DoctorPostContainer({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 2.0,
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
                      borderRadius: BorderRadius.circular(12),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: data.img,
                        placeholder: (context, url) => Image.asset(
                          'assets/img/loading.gif',
                          fit: BoxFit.cover,
                        ),
                        errorWidget: (context, url, error) => SizedBox(),
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

  const _PostHeader({Key key, this.img, this.name, this.time, this.job})
      : super(key: key);
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
                  color: Colors.black,
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
          child: Text('+ Follow'),
        ),
        // IconButton(
        //   icon: const Icon(Icons.more_horiz, color: Colors.black54),
        //   onPressed: () => print('More'),
        // ),
      ],
    );
  }
}

class PostStats extends StatefulWidget {
  final NewsDatum data;

  PostStats({Key key, this.data}) : super(key: key);

  @override
  State<PostStats> createState() => _PostStatsState();
}

class _PostStatsState extends State<PostStats> {
  TextEditingController commentController = TextEditingController();
  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.thumb_up,
                  size: 10.0,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 4.0),
              Expanded(
                child: Text(
                    (widget.data.likes != null)
                        ? '${widget.data.likes} likes'
                        : '0 likes',
                    style: TextStyle(color: Colors.grey.shade500)),
              ),
              Text(
                  (widget.data.comments != 0)
                      ? '${widget.data.comments} Comments'
                      : '0 Comments',
                  style: TextStyle(color: Colors.grey.shade500)),
            ],
          ),
        ),
      ],
    );
  }
}
