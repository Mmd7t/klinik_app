import 'package:klinik_app/controllers/doctor_view_controller.dart';
import 'package:klinik_app/models/doctor_details_model.dart';
import 'package:klinik_app/pages/doctor/widgets/post_container.dart';
import 'package:klinik_app/utils/ui.dart';
import '../../../widgets/block_button_widget.dart';
import '../widgets/doctor_til_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'profile/profile_header.dart';

class DoctorView extends StatefulWidget {
  @override
  State<DoctorView> createState() => _DoctorViewState();
}

class _DoctorViewState extends State<DoctorView> {
  final int id = Get.arguments;

  DoctorViewController controller = Get.find<DoctorViewController>();

  @override
  void initState() {
    super.initState();
    controller.docId.value = id;
    controller.doctorDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => (controller.doctorDetailsLoading.value)
            ? Center(child: CircularProgressIndicator())
            : (controller.doctorDetailsModel.value.data == null)
                ? Center(child: Text('There is no data'))
                : SafeArea(
                    child: Container(
                      color: Colors.transparent,
                      child: CustomScrollView(
                        slivers: [
                          SliverToBoxAdapter(
                            child: ProfileHeader(
                              data: controller.doctorDetailsModel.value.data[0],
                            ),
                          ),
                          // const SliverToBoxAdapter(child: const ProfileAboutme()),
                          SliverToBoxAdapter(
                            child: Container(
                              alignment: Alignment.center,
                              child: buildBlockButtonWidget(
                                  controller.doctorDetailsModel.value.data[0]),
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                SizedBox(height: 10),
                                // buildSpecialities(_doctor),
                                DoctorTilWidget(
                                  title: Text("Description".tr,
                                      style: Get.textTheme.subtitle2),
                                  content: Text(
                                      controller.doctorDetailsModel.value
                                              .data[0].description ??
                                          '',
                                      style: Get.textTheme.bodyText1),
                                ),
                                (controller.doctorNewLoading.value)
                                    ? Center(child: CircularProgressIndicator())
                                    : (controller.newsModel.value.data == null)
                                        ? Center(
                                            child: Text('There is no news'))
                                        : DoctorTilWidget(
                                            horizontalPadding: 10.0,
                                            title: Text("News".tr,
                                                style: Get.textTheme.subtitle2),
                                            content: ListView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              itemBuilder: (context, index) =>
                                                  DoctorPostContainer(
                                                      data: controller.newsModel
                                                          .value.data[index]),
                                              itemCount: controller
                                                  .newsModel.value.data.length,
                                            ),
                                          ),
                                DoctorTilWidget(
                                  title: Text("Reviews & Ratings".tr,
                                      style: Get.textTheme.subtitle2),
                                  content: Column(
                                    children: [
                                      Text(
                                          '${controller.doctorDetailsModel.value.data[0].review}',
                                          style: Get.textTheme.headline1),
                                      Wrap(
                                        children: Ui.getStarsList(
                                            double.parse(
                                              controller.doctorDetailsModel
                                                  .value.data[0].review,
                                            ),
                                            size: 32),
                                      ),
                                      Text(
                                        "Reviews (${controller.doctorDetailsModel.value.data[0].review} %s)",
                                        style: Get.textTheme.caption,
                                      ).paddingOnly(top: 10),
                                      Divider(height: 35, thickness: 1.3),
                                    ],
                                  ),
                                  // actions: [

                                  // ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
      ),
    );
  }

  int radio = 1;
  Widget buildBlockButtonWidget(DoctorDetailsDatum data) {
    List<int> radioSelected =
        List.generate(data.workingtiome.length, (index) => index + 1);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Get.theme.primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: BlockButtonWidget(
        text: Text(
          "Book an Appointment".tr,
          textAlign: TextAlign.center,
          style: Get.textTheme.headline6.merge(
            TextStyle(color: Get.theme.primaryColor),
          ),
        ),
        color: Get.theme.accentColor,
        onPressed: () {
          Get.dialog(
            Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Select an Appointment',
                      style: Get.textTheme.headline5,
                    ),
                    const SizedBox(height: 30),
                    SingleChoiseChip(data: data.workingtiome),
                    const SizedBox(height: 30),
                    BlockButtonWidget(
                      text: Text(
                        "Book".tr,
                        textAlign: TextAlign.center,
                        style: Get.textTheme.headline6.merge(
                          TextStyle(color: Get.theme.primaryColor),
                        ),
                      ),
                      color: Get.theme.accentColor,
                      icon: null,
                      onPressed: () {
                        controller.bookDoctor();
                      },
                    ),
                    const SizedBox(height: 10),
                    BlockButtonWidget(
                      text: Text(
                        "Cancel",
                        textAlign: TextAlign.center,
                        style: Get.textTheme.headline6.merge(
                          TextStyle(color: Get.theme.accentColor),
                        ),
                      ),
                      color: Colors.white,
                      border:
                          BorderSide(color: Get.theme.accentColor, width: 1),
                      icon: null,
                      onPressed: () => Get.back(),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        icon: null,
      ).paddingOnly(right: 20, left: 20),
    );
  }
}

/*-----------------------------  Single Choise Chip  ----------------------------------*/
class SingleChoiseChip extends StatefulWidget {
  final List<Workingtiome> data;

  const SingleChoiseChip({Key key, this.data}) : super(key: key);
  @override
  _SingleChoiseChipState createState() => _SingleChoiseChipState();
}

class _SingleChoiseChipState extends State<SingleChoiseChip> {
  DoctorViewController controller = Get.find<DoctorViewController>();
  int choiceIndex = 0;

  String selectedDays(day) {
    switch (day) {
      case 1:
        return 'Sat.';
        break;
      case 2:
        return 'Sun.';
        break;
      case 3:
        return 'Mon.';
        break;
      case 4:
        return 'Tues.';
        break;
      case 5:
        return 'Wed.';
        break;
      case 6:
        return 'Thur.';
        break;
      case 7:
        return 'Fri.';
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5,
      alignment: WrapAlignment.center,
      children: List.generate(
        widget.data.length,
        (index) => ChoiceChip(
          label: Text(
            '${selectedDays(widget.data[index].day)} : ' +
                '${widget.data[index].timeFrom} - ' +
                '${widget.data[index].timeTo}',
            style: Get.textTheme.bodyText1.copyWith(
              color: (choiceIndex == index) ? Colors.white : Colors.black,
              fontWeight:
                  (choiceIndex == index) ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          selected: choiceIndex == index,
          selectedColor: Get.theme.accentColor,
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          onSelected: (value) {
            setState(() {
              choiceIndex = value ? index : null;
            });
            if (choiceIndex == index) {
              controller.date.value = '${selectedDays(widget.data[index].day)}';
              controller.time.value = '${widget.data[index].timeFrom} - ' +
                  '${widget.data[index].timeTo}';
            }
          },
        ),
      ),
    );
  }
}
