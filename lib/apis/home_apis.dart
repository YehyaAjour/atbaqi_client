import 'dart:io';
import 'package:atbaqi_client/apis/profile_apis.dart';
import 'package:atbaqi_client/controllers/home_controller.dart';
import 'package:atbaqi_client/core/services/firebase_notification.dart';
import 'package:atbaqi_client/models/all_categories_model.dart';
import 'package:atbaqi_client/models/all_familes_model.dart';
import 'package:atbaqi_client/models/home_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as myGet;
import 'package:get/get_core/src/get_main.dart';

import '../controllers/auth_controller.dart';
import '../core/services/sp_helper.dart';
import '../core/utils/constants.dart';
import '../core/utils/helper.dart';
import '../core/utils/progress_dialog_utils.dart';
import '../models/forget_password_model.dart';
import '../view/auth/login_screen.dart';
import '../view/homescreenlayout/screens/home_screen.dart';

class HomeApis {
  HomeApis._();

  static HomeApis homeApis = HomeApis._();
  Dio dio;

  HomeController homeController = myGet.Get.find();
  // ProfileController profileController = myGet.Get.find();

  initDio() {
    if (dio == null) {
      dio = Dio();
      return dio;
    } else {
      return dio;
    }
  }

  getAllCategories() async {
    try {
      initDio();
      String token = SPHelper.spHelper.getToken();
      Response response = await dio.get(
        baseUrl + categoriesUrl,
        options: Options(
          headers: {
            'auth-token': token,
          },
        ),
      );
      if (response.data["status"]) {
        homeController.getAllCategories.value =
            AllCategoriesModel.fromJson(response.data);
        print("getAllCategories ${response.data}");
      } else {}
    } catch (e) {
      print(e.toString());
    }
  }

  getHome() async {
    try {
      initDio();
      String token = SPHelper.spHelper.getToken();
      Response response = await dio.get(
        baseUrl + homeMealsUrl,
        options: Options(
          headers: {
            'auth-token': token,
          },
        ),
      );
      if (response.data["status"]) {
        homeController.getHomeData.value = HomeModel.fromJson(response.data);
        print("getHomeMeeals ${response.data}");
      } else {}
    } catch (e) {
      print(e.toString());
    }
  }

  getAllFamiles() async {
    try {
      initDio();
      String token = SPHelper.spHelper.getToken();
      Response response = await dio.get(
        baseUrl + allFamilesUrl,
        options: Options(
          headers: {
            'auth-token': token,
          },
        ),
      );
      if (response.data["status"]) {
        homeController.getAllFamiles.value =
            AllFamilesModel.fromJson(response.data);
        print("get All Familes ${response.data}");
      } else {}
    } catch (e) {
      print(e.toString());
    }
  }
}
