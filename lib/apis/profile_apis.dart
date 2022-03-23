import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart' as myGet;

import '../controllers/profile_controller.dart';
import '../core/services/sp_helper.dart';
import '../core/utils/constants.dart';
import '../core/utils/helper.dart';
import '../models/profile_model.dart';

class ProfileApis {
  ProfileApis._();

  static ProfileApis profileApis = ProfileApis._();
  Dio dio;

  ProfileController profileController = myGet.Get.find();

  initDio() {
    if (dio == null) {
      dio = Dio();
      return dio;
    } else {
      return dio;
    }
  }

  getProfile() async {
    try {
      initDio();
      String token = SPHelper.spHelper.getToken();
      Response response = await dio.get(
        baseUrl + profileUrl,
        options: Options(
          headers: {
            'auth-token': token,
          },
        ),
      );
      // print(" getProfile ${response.data}");
      if (response.data["status"]) {
        profileController.getProfileData.value =
            ProfileModel.fromJson(response.data);
        Helper.getSheetSucsses(response.data);
      } else {}
    } catch (err) {
      print("getProfile  $err");
    }
  }
}
