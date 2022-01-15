import 'package:get/get.dart' show GetPage;
import 'package:klinik_app/bindings/auth_binding.dart';
import 'package:klinik_app/bindings/doctor_details_binding.dart';
import 'package:klinik_app/pages/account/views/account_view.dart';
import 'package:klinik_app/pages/alarm/views/adding_alarm_view.dart';
import 'package:klinik_app/pages/auth/views/forgot_password_view.dart';
import 'package:klinik_app/pages/auth/views/login_view.dart';
import 'package:klinik_app/pages/auth/views/phone_verification_view.dart';
import 'package:klinik_app/pages/auth/views/register_view.dart';
import 'package:klinik_app/pages/book_doctor/views/book_doctor_view.dart';
import 'package:klinik_app/pages/checkout/views/checkout_view.dart';
import 'package:klinik_app/pages/clinic/views/clinic_view.dart';
import 'package:klinik_app/pages/doctor/views/doctor_view.dart';
import 'package:klinik_app/pages/help_privacy/views/help_view.dart';
import 'package:klinik_app/pages/help_privacy/views/privacy_view.dart';
import 'package:klinik_app/pages/notifications/views/notifications_view.dart';
import 'package:klinik_app/pages/paramedic/views/emergency_view2.dart';
import 'package:klinik_app/pages/profile/bindings/profile_binding.dart';
import 'package:klinik_app/pages/profile/views/profile_view.dart';
import 'package:klinik_app/pages/search/views/search_view.dart';
import 'package:klinik_app/pages/settings/bindings/settings_binding.dart';
import 'package:klinik_app/pages/settings/views/language_view.dart';
import 'package:klinik_app/pages/settings/views/settings_view.dart';
import 'package:klinik_app/pages/settings/views/theme_mode_view.dart';
import 'package:klinik_app/pages/speciality/views/specialities_view.dart';
import 'package:klinik_app/bindings/tabs_bindings.dart';
import 'package:klinik_app/pages/splash_screen.dart';
import 'package:klinik_app/pages/tabs/views/tabs_view.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.ROOT;

  static final routes = [
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(name: Routes.ROOT, page: () => SplashScreen()),
    GetPage(
      name: Routes.REGISTER,
      page: () => RegisterView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.FORGOT_PASSWORD,
      page: () => ForgotPasswordView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.PHONE_VERIFICATION,
      page: () => PhoneVerificationView(),
      binding: AuthBinding(),
    ),
    GetPage(name: Routes.TABS, page: () => TabsView(), binding: TabsBinding()),
    GetPage(
        name: Routes.SEARCH, page: () => SearchView(), binding: TabsBinding()),
    GetPage(name: Routes.EMERGENCY, page: () => Emergency2View()),
    GetPage(name: Routes.SPECIALITIES, page: () => SpecialitiesView()),
    GetPage(name: Routes.PROFILE, page: () => AccountView()),
    GetPage(name: Routes.NOTIFICATIONS, page: () => NotificationsView()),
    // GetPage(name: Routes.CHAT, page: () => ChatsView()),
    GetPage(
        name: Routes.SETTINGS,
        page: () => SettingsView(),
        binding: SettingsBinding()),
    GetPage(
        name: Routes.SETTINGS_THEME_MODE,
        page: () => ThemeModeView(),
        binding: SettingsBinding()),
    GetPage(
        name: Routes.SETTINGS_LANGUAGE,
        page: () => LanguageView(),
        binding: SettingsBinding()),
    GetPage(name: Routes.PRIVACY, page: () => PrivacyView()),
    GetPage(name: Routes.HELP, page: () => HelpView()),
    GetPage(name: Routes.ALARM, page: () => AddAlarmView()),
    GetPage(name: Routes.CLINIC, page: () => ClinicView()),
    GetPage(
      name: Routes.PROFILE_FILLING,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
        name: Routes.DOCTOR,
        page: () => DoctorView(),
        binding: DoctorDetailsBinding()),
    GetPage(name: Routes.BOOK_DOCTOR, page: () => BookDoctorView()),
    GetPage(name: Routes.CHECKOUT, page: () => CheckoutView()),
  ];
}
