import 'package:atbaqi_client/controllers/home_controller.dart';
import 'package:atbaqi_client/models/all_categories_model.dart';
import 'package:atbaqi_client/models/all_familes_model.dart';
import 'package:atbaqi_client/models/home_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as myGet;
import '../core/services/sp_helper.dart';
import '../core/utils/constants.dart';
import '../models/family_by_id_model.dart';
import '../models/meal_by_category_model.dart';
import '../models/meal_by_id_model.dart';

class HomeApis {
  HomeApis(){
    getHome();
    getAllCategories();
    getAllFamiles();
  }
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

  getMealByCategory(String id) async {
    try {
      initDio();
      String token = SPHelper.spHelper.getToken();
      Response response = await dio.get(
        baseUrl + 'user/meals/by/category/$id',
        options: Options(
          headers: {
            'auth-token': token,
          },
        ),
      );

      if (response.statusCode == 200) {
        homeController.getMealByCategory.value =
            MealByCategoryModel.fromJson(response.data);
        print("Store in MealByCategoryModel Successful ${response.data}");
      } else {
      }
    } catch (e) {

      print(e.toString());
    }
  }

  getMealById(String id) async {
    try {
      initDio();
      String token = SPHelper.spHelper.getToken();
      Response response = await dio.get(
        baseUrl + 'user/meal/$id',
        options: Options(
          headers: {
            'auth-token': token,
          },
        ),
      );

      if (response.statusCode == 200) {
        homeController.getMealById.value =
            MealByIdModel.fromJson(response.data);
        print("Store in MealByIdModel Successful ${response.data}");
      } else {
      }
    } catch (e) {

      print(e.toString());
    }
  }

  getFamilyById(String id) async {
    try {
      initDio();
      String token = SPHelper.spHelper.getToken();
      Response response = await dio.get(
        baseUrl + 'user/family/$id',
        options: Options(
          headers: {
            'auth-token': token,
          },
        ),
      );

      if (response.statusCode == 200) {
        homeController.getFamilyById.value =
            FamilyByIdModel.fromJson(response.data);
        print("Store in FamilyByIdModel Successful ${response.data}");
      } else {
      }
    } catch (e) {

      print(e.toString());
    }
  }
}
