import 'package:atbaqi_client/controllers/app_controller.dart';
import 'package:atbaqi_client/controllers/home_controller.dart';
import 'package:atbaqi_client/controllers/order_controller.dart';
import 'package:atbaqi_client/core/services/firebase_notification.dart';
import 'package:atbaqi_client/core/widgets/custom_error.dart';
import 'package:atbaqi_client/view/splash/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'controllers/auth_controller.dart';
import 'controllers/cart_controller.dart';
import 'controllers/contact_us_controller.dart';
import 'controllers/favourite_controller.dart';
import 'controllers/otp_controller.dart';
import 'controllers/privacy_policy_controller.dart';
import 'controllers/profile_controller.dart';
import 'core/services/sp_helper.dart';
import 'core/utils/app_imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await SPHelper.spHelper.initSharedPrefrences();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColors.primaryColor,
  ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // customError();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    NotificationHelper().initialNotification();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // SPHelper.spHelper.setToken("");
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: () {
        Get.put(AuthController());
        Get.put(ProfileController());
        Get.put(OTPController());
        Get.put(AppController());
        Get.put(HomeController());
        Get.put(PrivacyPolicyController());
        Get.put(ContactUsController());
        Get.put(FavouriteController());
        Get.put(CartController());
        Get.put(OrderController());
        return GetMaterialApp(
          theme: ThemeData(
              primaryColor: AppColors.primaryColor,
              // scaffoldBackgroundColor: AppColors.whiteColor,
              // ignore: deprecated_member_use
              accentColor: AppColors.primaryColor),
          defaultTransition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 300),
          debugShowCheckedModeBanner: false,
          locale: const Locale('ar'),
          fallbackLocale: const Locale('ar'),
          localizationsDelegates: const [
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('ar', 'AE'),
          ],
          home: SplashScreen(),
        );
      },
    );
  }
}
