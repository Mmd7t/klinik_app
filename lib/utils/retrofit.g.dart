// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retrofit.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    _dio.interceptors
        .add(PrettyDioLogger(requestBody: true, requestHeader: true));
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<RegisterResponseModel> postRegister(data) async {
    ArgumentError.checkNotNull(data, 'data');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(data ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>('registe',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = RegisterResponseModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<LoginResponseModel> postLogin(data) async {
    ArgumentError.checkNotNull(data, 'data');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(data ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>('login',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = LoginResponseModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<VerifyCodeResponseModel> postVerifyCode(phone, code) async {
    ArgumentError.checkNotNull(phone, 'phone');
    ArgumentError.checkNotNull(code, 'code');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'mobile': phone, 'code': code};
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>('verify',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = VerifyCodeResponseModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<NewsModel> getNews() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('news',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = NewsModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<CategoriesModel> getCategories() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('categories',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = CategoriesModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<DoctorsByCategoryModel> getDoctorsByCategory(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('cate/$id/doctors',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = DoctorsByCategoryModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<DoctorDetailsModel> getDoctorDetails(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('doctors/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = DoctorDetailsModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<BookingResponseModel> postBookingDoctor(
      apiToken, userId, docId, date, time) async {
    ArgumentError.checkNotNull(apiToken, 'apiToken');
    ArgumentError.checkNotNull(userId, 'userId');
    ArgumentError.checkNotNull(docId, 'docId');
    ArgumentError.checkNotNull(date, 'date');
    ArgumentError.checkNotNull(time, 'time');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {
      'api_token': apiToken,
      'user_id': userId,
      'doctor_id': docId,
      'date': date,
      'time': time
    };
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>('bookdoctor',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = BookingResponseModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<CommentsModel> getPostComments(postId) async {
    ArgumentError.checkNotNull(postId, 'postId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'post/$postId/comments',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = CommentsModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<NewsModel> getDoctorPosts(postId) async {
    ArgumentError.checkNotNull(postId, 'postId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'doctor/$postId/posts',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = NewsModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<AddCommentResponseModel> postComment(userId, postId, comment) async {
    ArgumentError.checkNotNull(userId, 'userId');
    ArgumentError.checkNotNull(postId, 'postId');
    ArgumentError.checkNotNull(comment, 'comment');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'user_id': userId, 'post_id': postId, 'comment': comment};
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>('addcomment',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = AddCommentResponseModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<HttpResponse<dynamic>> postLike(userId, postId, apiToken) async {
    ArgumentError.checkNotNull(userId, 'userId');
    ArgumentError.checkNotNull(postId, 'postId');
    ArgumentError.checkNotNull(apiToken, 'apiToken');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'user_id': userId, 'post_id': postId, 'api_token': apiToken};
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request('likepost',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<List<UserBookingsModel>> postUserBookings(userId) async {
    ArgumentError.checkNotNull(userId, 'userId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'user_id': userId};
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<List<dynamic>>('userbooking',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) =>
            UserBookingsModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<UserProfileModel> postUserProfile(userId, apiToken) async {
    ArgumentError.checkNotNull(userId, 'userId');
    ArgumentError.checkNotNull(apiToken, 'apiToken');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'user_id': userId, 'api_token': apiToken};
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>('userinfo',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UserProfileModel.fromJson(_result.data);
    return value;
  }
}
