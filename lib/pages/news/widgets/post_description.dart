import 'package:auto_direction/auto_direction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klinik_app/services/app_services.dart';
import 'package:linkwell/linkwell.dart';

class PostDescription extends StatefulWidget {
  final String description;

  const PostDescription({Key key, this.description}) : super(key: key);

  @override
  _PostDescriptionState createState() => _PostDescriptionState();
}

class _PostDescriptionState extends State<PostDescription> {
  final appServices = Get.find<AppServices>();
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () => setState(() => isExpanded = !isExpanded),
            child: AnimatedSize(
              duration: const Duration(milliseconds: 300),
              child: ConstrainedBox(
                constraints: isExpanded
                    ? new BoxConstraints()
                    : new BoxConstraints(maxHeight: 45.0),
                child: AutoDirection(
                  text: widget.description,
                  child: LinkWell(
                    widget.description,
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.3,
                      color: (appServices.isDark.value)
                          ? Colors.white
                          : Colors.black,
                    ),
                    linkStyle: TextStyle(
                      height: 1.3,
                      color: Colors.blue[300],
                      decoration: TextDecoration.underline,
                    ),
                    // textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            child: Text(
              (isExpanded) ? '' : '.......',
              style: TextStyle(color: Colors.grey),
            ),
            onTap: () => setState(() => isExpanded = !isExpanded),
          ),
        ],
      ),
    );
  }
}
