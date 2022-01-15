import 'package:get/get.dart';
import 'package:klinik_app/utils/shared_prefs.dart';

class AppServices extends GetxService {
  @override
  onInit() {
    super.onInit();
    getThemeFromPrefs();
    getAccessToken();
    getUserId();
  }

  RxString accessToken = RxString('');
  RxInt userId;

  void saveAccessToken(String token) {
    accessToken = token.obs;
    SharedPrefsHelper.saveApiKeyToPrefs(token);
  }

  void saveUserId(int id) {
    userId = id.obs;
    SharedPrefsHelper.saveUserIdToPrefs(id);
  }

  void getAccessToken() async {
    String data = await SharedPrefsHelper.getApiTokenFromPrefs();
    if (data != null) {
      accessToken = data.obs;
    }
    print('access token :: ' + accessToken.value);
  }

  void getUserId() async {
    int data = await SharedPrefsHelper.getUserIdFromPrefs();
    if (data != null) {
      userId = data.obs;
    }
    print(data);
  }

  removeUserData() async {
    await SharedPrefsHelper.removeToken();
    await SharedPrefsHelper.removeUserId();
    accessToken.value = '';
    userId.value = null;
  }

  /*--------------------------------------------------------------------------*/
  /*------------------------------  Variables  -------------------------------*/
  /*--------------------------------------------------------------------------*/
  RxBool isDark = RxBool(false);

  /*--------------------------------------------------------------------------*/
  /*---------------------------  Save Functions  -----------------------------*/
  /*--------------------------------------------------------------------------*/

  changeTheme(bool value) {
    isDark.value = value;
    print(
        'valueeeeeeeeeeeeeeeeeeeeeeeeeeeeeee theeeeeeemeeeeee :: ${isDark.value}');
    SharedPrefsHelper.saveTheme(value);
  }

  getThemeFromPrefs() async {
    bool val = await SharedPrefsHelper.checkTheme();
    if (val) {
      isDark.value = await SharedPrefsHelper.getTheme();
    } else {
      isDark.value = false;
    }
  }
}
