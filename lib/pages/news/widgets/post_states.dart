import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klinik_app/controllers/home_controller.dart';
import 'package:klinik_app/models/news_model.dart';
import 'package:klinik_app/utils/ui.dart';
import 'package:share_plus/share_plus.dart';

class PostStats extends StatefulWidget {
  final NewsDatum data;

  PostStats({Key key, this.data}) : super(key: key);

  @override
  State<PostStats> createState() => _PostStatsState();
}

class _PostStatsState extends State<PostStats> {
  final homeController = Get.find<HomeController>();
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
                  color: Get.theme.accentColor,
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
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.grey.shade500),
                    children: [
                      TextSpan(text: '${widget.data.likes} '),
                      TextSpan(text: 'likes'.tr),
                    ],
                  ),
                ),
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.grey.shade500),
                  children: [
                    TextSpan(text: '${widget.data.allComments.length} '),
                    TextSpan(text: 'Comments'.tr),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(color: Colors.grey.shade400, height: 20),
        Row(
          children: [
            _PostButton(
              icon: Icon(
                Icons.thumb_up_alt_outlined,
                color: Get.theme.accentColor,
                size: 20.0,
              ),
              onTap: () => homeController.addLike(widget.data.id),
            ),
            _PostButton(
              icon: Icon(
                Icons.comment_outlined,
                color: Get.theme.accentColor,
                size: 20.0,
              ),
              onTap: () {
                print('idddddddddddddddddddddd   ${widget.data.id}');
                homeController.getComments(widget.data.id);
                Get.bottomSheet(
                  MBottomSheet(id: widget.data.id),
                  isScrollControlled: true,
                  enableDrag: true,
                  ignoreSafeArea: false,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                );
              },
            ),
            _PostButton(
              icon: Icon(
                Icons.share_outlined,
                color: Get.theme.accentColor,
                size: 25.0,
              ),
              onTap: () {
                Share.share(widget.data.content + widget.data.img);
              },
            )
          ],
        ),
      ],
    );
  }
}

class _PostButton extends StatelessWidget {
  final Icon icon;
  final Function onTap;

  const _PostButton({
    Key key,
    @required this.icon,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        elevation: 0,
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(50),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 6),
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            alignment: Alignment.center,
            child: icon,
          ),
        ),
      ),
    );
  }
}

class MBottomSheet extends StatefulWidget {
  final int id;
  MBottomSheet({Key key, this.id}) : super(key: key);

  @override
  State<MBottomSheet> createState() => _MBottomSheetState();
}

class _MBottomSheetState extends State<MBottomSheet> {
  final homeController = Get.find<HomeController>();
  TextEditingController commentController = TextEditingController();
  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  Widget postComment(String time, String postComment, String profileName) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(maxRadius: 20),
          SizedBox(width: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        profileName,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        postComment,
                        style: TextStyle(fontSize: 16.0),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12.0),
              Row(
                children: [
                  const SizedBox(width: 20),
                  Text('Like', style: TextStyle(fontWeight: FontWeight.w600)),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                  Text('Reply', style: TextStyle(fontWeight: FontWeight.w600)),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: Get.size.width,
        height: Get.size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Comments',
                style: Get.textTheme.headline4.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Get.theme.accentColor,
                ),
              ),
            ),
            Divider(
              endIndent: 30,
              indent: 30,
              color: Get.theme.accentColor,
            ),
            Expanded(
              child: Obx(
                () => (homeController.commentsLoading.value)
                    ? Container(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator())
                    : (homeController.commentsModel.value.data.isEmpty ||
                            homeController.commentsModel.value.data == [])
                        ? Container(
                            alignment: Alignment.center,
                            child: Text('No Comments',
                                style: Get.textTheme.subtitle1))
                        : ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount:
                                homeController.commentsModel.value.data.length,
                            itemBuilder: (context, index) => postComment(
                                '',
                                homeController.commentsModel.value.data[index]
                                        .comment ??
                                    '',
                                homeController.commentsModel.value.data[index]
                                        .sender ??
                                    ''),
                          ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Get.theme.accentColor.withOpacity(0.5),
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: TextFormField(
                      controller: commentController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter comment';
                        } else {
                          return null;
                        }
                      },
                      style: Get.textTheme.caption,
                      keyboardType: TextInputType.text,
                      decoration: Ui.getInputDecoration(
                        hintText: "Type your comment here".tr,
                        suffixIcon: IconButton(
                          onPressed: () {
                            if (commentController.text.trim().isEmpty) {
                              print('empty');
                            } else {
                              homeController.addComment(
                                  widget.id, commentController.text.trim());

                              homeController.getComments(widget.id);
                            }
                          },
                          icon: Icon(Icons.send),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
