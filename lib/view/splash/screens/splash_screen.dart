import 'package:atbaqi_client/core/utils/app_imports.dart';
import 'package:atbaqi_client/view/auth/login_screen.dart';
import 'package:atbaqi_client/view/main%20screen/Screens/main_screen.dart';
import 'package:atbaqi_client/view/onboardingScreen/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../apis/profile_apis.dart';
import '../../../core/services/sp_helper.dart';
import '../../../core/widgets/custom_image.dart';
import '../../homescreenlayout/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    var delay = Duration(seconds: 3);

    Future.delayed(delay, () {
      if (SPHelper.spHelper.getToken() == '' ||
          SPHelper.spHelper.getToken() == null) {
        Get.offAll(() => OnboardingScreen());
      } else {
        ProfileApis.profileApis.getProfile();

        Get.off(MainScreen());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // SPHelper.spHelper.setToken("");
    return Scaffold(
      body: CustomPngImage(
          imageName: 'splash', height: Get.height, width: Get.width),
    );
  }
}
