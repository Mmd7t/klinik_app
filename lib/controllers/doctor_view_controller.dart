import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:klinik_app/models/booking_model.dart';
import 'package:klinik_app/models/doctor_details_model.dart';
import 'package:klinik_app/models/news_model.dart';
import 'package:klinik_app/utils/retrofit.dart';
import 'package:klinik_app/utils/shared_prefs.dart';
import 'package:klinik_app/widgets/dialogs.dart';

import '../constants.dart';

class DoctorViewController extends GetxController {
  RestClient client = RestClient(Dio(BaseOptions(baseUrl: Constants.baseUrl)));

  RxInt docId = 0.obs;
  RxInt userId = 0.obs;
  RxString apiToken = ''.obs;
  RxString date = ''.obs;
  RxString time = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getAccessToken();
    getUserId();
  }

  void getAccessToken() async {
    String data = await SharedPrefsHelper.getApiTokenFromPrefs();
    if (data != null) {
      apiToken = data.obs;
    }
    print('access token :: ' + apiToken.value);
  }

  void getUserId() async {
    int data = await SharedPrefsHelper.getUserIdFromPrefs();
    if (data != null) {
      userId = data.obs;
    }
    print(data);
  }

  /*--------------------------------------------------------------------------*/
  /*-----------------------------  Categories  -------------------------------*/
  /*--------------------------------------------------------------------------*/

  Rx<DoctorDetailsModel> doctorDetailsModel = DoctorDetailsModel().obs;
  RxBool doctorDetailsLoading = RxBool(false);
  doctorDetails() async {
    doctorDetailsLoading.value = true;
    DoctorDetailsModel response;
    try {
      response = await client.getDoctorDetails(docId.value);
      if (response != null && response.maincode == 200) {
        doctorDetailsLoading.value = false;
        doctorDetailsModel.value = response;
      }
    } on DioError catch (e) {
      doctorDetailsLoading.value = false;
      print('errooooooooooooor Categories  ${e.error}');
    }
  }

  Rx<BookingResponseModel> bookingDoctorModel = BookingResponseModel().obs;
  bookDoctor() async {
    loadingDialog();
    BookingResponseModel response;
    try {
      response = await client.postBookingDoctor(
          apiToken.value, userId.value, docId.value, date.value, time.value);
      if (response != null && response.statusCode == "200") {
        Get.back();
        Get.back();
        successGetBar('Appointment Successfully Booked');
      }
    } on DioError catch (e) {
      Get.back();
      Get.back();
      errorGetBar(e.error.toString());
      print('errooooooooooooor Categories  ${e.error}');
    }
  }

  /*--------------------------------------------------------------------------*/
  /*-------------------------------  Register  -------------------------------*/
  /*--------------------------------------------------------------------------*/
  Rx<NewsModel> newsModel = NewsModel().obs;
  RxBool doctorNewLoading = RxBool(false);
  doctorNews(docId) async {
    doctorNewLoading.value = true;
    NewsModel response;
    try {
      response = await client.getDoctorPosts(docId);
      if (response != null && response.maincode == 200) {
        doctorNewLoading.value = false;
        print('A7aaaaa');
        newsModel.value = response;
      }
    } on DioError catch (e) {
      doctorNewLoading.value = false;
      print('errooooooooooooor  News ${e.error}');
    }
  }
}
