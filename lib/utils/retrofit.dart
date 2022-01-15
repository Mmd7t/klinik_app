import 'package:dio/dio.dart';
import 'package:klinik_app/models/add_comment_response_model.dart';
import 'package:klinik_app/models/auth_models/login_model.dart';
import 'package:klinik_app/models/auth_models/otp_model.dart';
import 'package:klinik_app/models/auth_models/register_model.dart';
import 'package:klinik_app/models/booking_model.dart';
import 'package:klinik_app/models/categories_model.dart';
import 'package:klinik_app/models/comments_model.dart';
import 'package:klinik_app/models/doctor_details_model.dart';
import 'package:klinik_app/models/doctors_by_category_model.dart';
import 'package:klinik_app/models/news_model.dart';
import 'package:klinik_app/models/user_bookings_model.dart';
import 'package:klinik_app/models/user_profile_model.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';
part 'retrofit.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;
  //  Dio.interceptors.add(PrettyDioLogger(requestBody: true , requestHeader: true));
  /*--------------------------------------------------------------------------*/
  /*------------------------------  Register  --------------------------------*/
  /*--------------------------------------------------------------------------*/
  @POST("registe")
  Future<RegisterResponseModel> postRegister(@Body() Map<String, dynamic> data);

  /*--------------------------------------------------------------------------*/
  /*--------------------------------  Login  ---------------------------------*/
  /*--------------------------------------------------------------------------*/
  @POST("login")
  Future<LoginResponseModel> postLogin(@Body() Map<String, dynamic> data);

  /*--------------------------------------------------------------------------*/
  /*--------------------------------  verify  --------------------------------*/
  /*--------------------------------------------------------------------------*/
  @POST("verify")
  Future<VerifyCodeResponseModel> postVerifyCode(
      @Field('mobile') String phone, @Field('code') int code);

  /*--------------------------------------------------------------------------*/
  /*--------------------------------  News  ----------------------------------*/
  /*--------------------------------------------------------------------------*/
  @GET("news")
  Future<NewsModel> getNews();

  /*--------------------------------------------------------------------------*/
  /*--------------------------------  News  ----------------------------------*/
  /*--------------------------------------------------------------------------*/
  @GET("categories")
  Future<CategoriesModel> getCategories();

  /*--------------------------------------------------------------------------*/
  /*--------------------------------  News  ----------------------------------*/
  /*--------------------------------------------------------------------------*/
  @GET("cate/{id}/doctors")
  Future<DoctorsByCategoryModel> getDoctorsByCategory(@Path('id') int id);

  /*--------------------------------------------------------------------------*/
  /*--------------------------------  News  ----------------------------------*/
  /*--------------------------------------------------------------------------*/
  @GET("doctors/{id}")
  Future<DoctorDetailsModel> getDoctorDetails(@Path('id') int id);

  /*--------------------------------------------------------------------------*/
  /*--------------------------------  News  ----------------------------------*/
  /*--------------------------------------------------------------------------*/
  @POST("bookdoctor")
  Future<BookingResponseModel> postBookingDoctor(
    @Field('api_token') String apiToken,
    @Field('user_id') int userId,
    @Field('doctor_id') int docId,
    @Field('date') String date,
    @Field('time') String time,
  );

  /*--------------------------------------------------------------------------*/
  /*--------------------------------  News  ----------------------------------*/
  /*--------------------------------------------------------------------------*/
  @GET("post/{postId}/comments")
  Future<CommentsModel> getPostComments(@Path('postId') int postId);

  /*--------------------------------------------------------------------------*/
  /*--------------------------------  News  ----------------------------------*/
  /*--------------------------------------------------------------------------*/
  @GET("doctor/{doc_id}/posts")
  Future<NewsModel> getDoctorPosts(@Path('doc_id') int postId);

  /*--------------------------------------------------------------------------*/
  /*--------------------------------  News  ----------------------------------*/
  /*--------------------------------------------------------------------------*/
  @POST("addcomment")
  Future<AddCommentResponseModel> postComment(
    @Field('user_id') int userId,
    @Field('post_id') int postId,
    @Field('comment') String comment,
  );

  /*--------------------------------------------------------------------------*/
  /*--------------------------------  News  ----------------------------------*/
  /*--------------------------------------------------------------------------*/
  @POST("likepost")
  Future<HttpResponse> postLike(
    @Field('user_id') int userId,
    @Field('post_id') int postId,
    @Field('api_token') String apiToken,
  );

  /*--------------------------------------------------------------------------*/
  /*--------------------------------  News  ----------------------------------*/
  /*--------------------------------------------------------------------------*/
  @POST("userbooking")
  Future<List<UserBookingsModel>> postUserBookings(
      @Field('user_id') int userId);

  /*--------------------------------------------------------------------------*/
  /*--------------------------------  News  ----------------------------------*/
  /*--------------------------------------------------------------------------*/
  @POST("userinfo")
  Future<UserProfileModel> postUserProfile(
    @Field('user_id') int userId,
    @Field('api_token') String apiToken,
  );
}

//      _dio.interceptors.add(PrettyDioLogger(requestBody: true , requestHeader: true));
