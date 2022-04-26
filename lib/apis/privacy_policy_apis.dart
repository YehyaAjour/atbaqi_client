import 'package:dio/dio.dart';

import '../controllers/privacy_policy_controller.dart';
import 'package:get/get.dart' as myGet;

import '../core/services/sp_helper.dart';
import '../core/utils/constants.dart';
import '../models/about_us_model.dart';
import '../models/privacy_model.dart';
import '../models/terms_model.dart';


class PrivacyPolicyApis{
  PrivacyPolicyApis(){
    getAboutUs();
    getPrivacy();
    getTerms();
}
  PrivacyPolicyApis._();
  static PrivacyPolicyApis privacyPolicyApis = PrivacyPolicyApis._();
  Dio dio;
  PrivacyPolicyController privacyPolicyController = myGet.Get.find();

  initDio() {
    if (dio == null) {
      dio = Dio();
      return dio;
    } else {
      return dio;
    }
  }

  getTerms() async {
    try {
      initDio();
      String token = SPHelper.spHelper.getToken();
      Response response = await dio.get(
        baseUrl + termsUrl,
        options: Options(
          headers: {
            'auth-token': token,
          },
        ),
      );
      if (response.statusCode == 200) {
        privacyPolicyController.getTermsData.value =
            TermsModel.fromJson(response.data);
        print(" getTerms ${response.data}");
      } else {}
    } catch (err) {
      print("getTerms  $err");
    }
  }
  getPrivacy() async {
    try {
      initDio();
      String token = SPHelper.spHelper.getToken();
      Response response = await dio.get(
        baseUrl + privacyUrl,
        options: Options(
          headers: {
            'auth-token': token,
          },
        ),
      );
      if (response.statusCode == 200) {
        privacyPolicyController.getPrivacyData.value =
            PrivacyModel.fromJson(response.data);
        print(" getPrivacy ${response.data}");
      } else {}
    } catch (err) {
      print("getPrivacy  $err");
    }
  }
  getAboutUs() async {
    try {
      initDio();
      String token = SPHelper.spHelper.getToken();
      Response response = await dio.get(
        baseUrl + aboutUsUrl,
        options: Options(
          headers: {
            'auth-token': token,
          },
        ),
      );
      if (response.statusCode == 200) {
        privacyPolicyController.getAboutUsData.value =
            AboutUsModel.fromJson(response.data);
        print("getAboutUs ${response.data}");
      } else {}
    } catch (err) {
      print("getAboutUs  $err");
    }
  }

}