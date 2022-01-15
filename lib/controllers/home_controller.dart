import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:klinik_app/models/add_comment_response_model.dart';
import 'package:klinik_app/models/categories_model.dart';
import 'package:klinik_app/models/comments_model.dart';
import 'package:klinik_app/models/news_model.dart';
import 'package:klinik_app/models/user_bookings_model.dart';
import 'package:klinik_app/models/user_profile_model.dart';
import 'package:klinik_app/utils/retrofit.dart';
import 'package:klinik_app/utils/shared_prefs.dart';
import 'package:klinik_app/widgets/dialogs.dart';
import 'package:retrofit/dio.dart';

import '../constants.dart';

class HomeController extends GetxController {
  RestClient client = RestClient(Dio(BaseOptions(baseUrl: Constants.baseUrl)));

  RxBool categoriesLoading = RxBool(false);
  RxBool newsLoading = RxBool(false);
  RxBool userBookingsLoading = RxBool(false);
  RxBool commentsLoading = RxBool(false);
  RxInt userId = 0.obs;
  RxString apiToken = ''.obs;
  @override
  onInit() {
    super.onInit();
    userBookings();
    news();
    categories();
    userProfile();
  }

  Future<void> getUserId() async {
    int data = await SharedPrefsHelper.getUserIdFromPrefs();
    if (data != null) {
      userId = data.obs;
      print(data);
    }
  }

  Future<void> getAccessToken() async {
    String data = await SharedPrefsHelper.getApiTokenFromPrefs();
    if (data != null) {
      apiToken = data.obs;
      print('access tokennnnnnnnnnn :: ' + apiToken.value);
    }
  }

  /*--------------------------------------------------------------------------*/
  /*-------------------------------  Register  -------------------------------*/
  /*--------------------------------------------------------------------------*/
  Rx<NewsModel> newsModel = NewsModel().obs;
  news() async {
    newsLoading.value = true;
    NewsModel response;
    try {
      response = await client.getNews();
      if (response != null && response.maincode == 200) {
        newsLoading.value = false;
        newsModel.value = response;
      }
    } on DioError catch (e) {
      newsLoading.value = false;
      print('errooooooooooooor  News ${e.error}');
    }
  }

  /*--------------------------------------------------------------------------*/
  /*-----------------------------  Categories  -------------------------------*/
  /*--------------------------------------------------------------------------*/

  Rx<CategoriesModel> categoriesModel = CategoriesModel().obs;
  categories() async {
    categoriesLoading.value = true;
    CategoriesModel response;
    try {
      response = await client.getCategories();
      if (response != null && response.maincode == 200) {
        categoriesLoading.value = false;
        categoriesModel.value = response;
      }
    } on DioError catch (e) {
      categoriesLoading.value = false;
      print('errooooooooooooor Categories  ${e.error}');
    }
  }

  /*--------------------------------------------------------------------------*/
  /*-----------------------------  Categories  -------------------------------*/
  /*--------------------------------------------------------------------------*/

  RxList<UserBookingsModel> userBookingsList = <UserBookingsModel>[].obs;
  userBookings() async {
    userBookingsLoading.value = true;
    print('userrrrrrrrrrrrr boooooookings');
    getUserId();
    List<UserBookingsModel> response;
    try {
      response = await client.postUserBookings(userId.value);
      if (response != null) {
        userBookingsLoading.value = false;
        userBookingsList = response.obs;
        print(
            'userrrrrrrrrrrrr boooooookings doooooooooooooooooooooooooooooooooooneeeee');
      }
    } on DioError catch (e) {
      userBookingsLoading.value = false;
      print('errooooooooooooor User Bookings  ${e.error}');
    }
  }

  /*--------------------------------------------------------------------------*/
  /*-----------------------------  Comments  -------------------------------*/
  /*--------------------------------------------------------------------------*/

  Rx<CommentsModel> commentsModel = CommentsModel().obs;
  getComments(postId) async {
    commentsLoading.value = true;
    getUserId();
    CommentsModel response;
    try {
      response = await client.getPostComments(postId);
      if (response != null && response.maincode == 200) {
        commentsLoading.value = false;
        commentsModel.value = response;
        print(
            'Posttttttttttttt Cooooooooomments dooooooooooooooooooooooooooneeeee  ${response.data.length}');
      }
    } on DioError catch (e) {
      commentsLoading.value = false;
      print('errooooooooooooor Commentttttts  ${e.error}');
    }
  }

  /*--------------------------------------------------------------------------*/
  /*-----------------------------  Add Comment  -------------------------------*/
  /*--------------------------------------------------------------------------*/

  Rx<AddCommentResponseModel> addCommentData = AddCommentResponseModel().obs;
  addComment(int postId, String comment) async {
    loadingDialog();
    getUserId();
    try {
      AddCommentResponseModel response =
          await client.postComment(userId.value, postId, comment);
      if (response != null && response.maincode == 200) {
        Get.back();
        successGetBar(response.data);
      }
    } on DioError catch (e) {
      Get.back();
      errorGetBar(e.error);
      print('errooooooooooooor User Bookings  ${e.error}');
    }
  }
  /*--------------------------------------------------------------------------*/
  /*-----------------------------  Add Like  -------------------------------*/
  /*--------------------------------------------------------------------------*/

  addLike(int postId) async {
    getUserId();
    getAccessToken();
    try {
      HttpResponse response =
          await client.postLike(userId.value, postId, apiToken.value);
      if (response != null && response.response.statusCode == 200) {
        successGetBar(response.response.data.toString());
      }
    } on DioError catch (e) {
      errorGetBar(e.error);
      print('errooooooooooooor User Bookings  ${e.error}');
    }
  }

  /*--------------------------------------------------------------------------*/
  /*-----------------------------  Add Like  -------------------------------*/
  /*--------------------------------------------------------------------------*/
  Rx<UserProfileModel> userProfileModel = UserProfileModel().obs;
  RxBool userProfileLoading = RxBool(false);
  userProfile() async {
    print('A7aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
    print('2222222 A7aaaaaaaaaaaaaaaaa');
    try {
      await getUserId();
      await getAccessToken();
      userProfileLoading.value = true;
      print('user IIIIIIIIIIIIIIIIIIIIIIId => ${userId.value}');
      print('api tooooooooooooooken => ${apiToken.value}');
      UserProfileModel response =
          await client.postUserProfile(userId.value, apiToken.value);
      if (response != null) {
        userProfileLoading.value = false;
        print('A7aaaaaaaaaaaaaaaaa');
        userProfileModel.value = response;
        print(response.name.toString());
        print(response.email.toString());
      }
    } on DioError catch (e) {
      userProfileLoading.value = false;
      print('errooooooooooooor User Profileeeeeeeeee  ${e.error}');
    }
  }
}
