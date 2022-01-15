import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:klinik_app/constants.dart';
import 'routes/app_pages.dart';
import 'services/app_services.dart';
import 'services/translation_service.dart';
import 'utils/translations.dart';

Future<void> initServices() async {
  Get.log('starting services ...');
  await Get.putAsync<AppServices>(() async => AppServices());
  await Get.putAsync<TranslationService>(() async => TranslationService());
  Get.log('All services started...');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final appServices = Get.find<AppServices>();
  final translationServices = Get.find<TranslationService>();

  @override
  void initState() {
    super.initState();
    translationServices.getLocale();
    print(
        'theeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeme darkkkkkkk :: ${appServices.isDark.value}');
    SystemChrome.setPreferredOrientations(const [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GetMaterialApp(
        title: 'Klinik',
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: translationServices.supportedLocales(),
        translations: Messages(),
        locale: Get.locale ?? Locale(Get.deviceLocale.languageCode),
        fallbackLocale: const Locale('en'),
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.cupertino,
        themeMode: appServices.isDark.value ? ThemeMode.dark : ThemeMode.light,
        theme: getLightTheme(),
        darkTheme: getDarkTheme(),
      ),
    );
  }
}
