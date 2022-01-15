import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:klinik_app/models/auth_models/login_model.dart';
import 'package:klinik_app/models/auth_models/otp_model.dart';
import 'package:klinik_app/models/auth_models/register_model.dart';
import 'package:klinik_app/routes/app_pages.dart';
import 'package:klinik_app/services/app_services.dart';
import 'package:klinik_app/utils/retrofit.dart';
import 'package:klinik_app/widgets/dialogs.dart';

import '../constants.dart';

class AuthController extends GetxController {
  RestClient client = RestClient(Dio(BaseOptions(baseUrl: Constants.baseUrl)));

  final appServices = Get.find<AppServices>();

  RxBool loginObsecure = RxBool(true);
  RxBool signupObsecure = RxBool(true);
  RxBool signupConfirmObsecure = RxBool(true);

  /*--------------------------------------------------------------------------*/
  /*-------------------------------  Register  -------------------------------*/
  /*--------------------------------------------------------------------------*/
  RxString name = ''.obs;
  RxString email = ''.obs;
  RxString password = ''.obs;
  RxString confirmPassword = ''.obs;
  RxString phone = ''.obs;

  register() async {
    loadingDialog();
    RegisterResponseModel response;
    try {
      response = await client.postRegister(RegisterModel(
        name: name.value,
        email: email.value,
        password: password.value,
        mobile: phone.value,
      ).toJson());
      if (response != null && response.statusCode == '200') {
        Get.back();
        Get.offAllNamed(Routes.PHONE_VERIFICATION, arguments: phone.value);
        print(response.code);
      }
    } on DioError catch (e) {
      Get.back();
      print('errooooooooooooor  ${e.error}');
    }
  }

  /*--------------------------------------------------------------------------*/
  /*--------------------------------  Login  ---------------------------------*/
  /*--------------------------------------------------------------------------*/

  login() async {
    loadingDialog();
    print(email.value);
    print(password.value);
    LoginResponseModel response;
    try {
      response = await client.postLogin(LoginModel(
        phone: phone.value.toString(),
        password: password.value,
      ).toJson());
      if (response != null && response.code == 200) {
        Get.back();
        appServices.saveAccessToken(response.data.apiToken);
        appServices.saveUserId(response.data.id);
        Get.offAllNamed(Routes.TABS);
      }
    } on DioError catch (e) {
      Get.back();
      print(e.error);
      errorGetBar('${e.error}');
    }
  }

  /*--------------------------------------------------------------------------*/
  /*--------------------------------  Login  ---------------------------------*/
  /*--------------------------------------------------------------------------*/
  RxInt code = 0.obs;
  verify() async {
    loadingDialog();
    print(phone.value);
    print(code.value);
    VerifyCodeResponseModel response;
    try {
      response = await client.postVerifyCode(phone.value, code.value);
      if (response != null && response.code == 200) {
        Get.back();
        appServices.saveAccessToken(response.data.apiToken);
        appServices.saveUserId(response.data.id);
        Get.offAndToNamed(Routes.TABS);
      }
    } on DioError catch (e) {
      Get.back();
      print(e.error);
      errorGetBar('${e.error}');
    }
  }
}
