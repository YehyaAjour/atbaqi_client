import 'package:atbaqi_client/models/all_categories_model.dart';
import 'package:atbaqi_client/models/all_familes_model.dart';
import 'package:atbaqi_client/models/home_model.dart';
import 'package:atbaqi_client/models/meal_by_category_model.dart';
import 'package:get/get.dart';

import '../models/family_by_id_model.dart';
import '../models/meal_by_id_model.dart';

class HomeController extends GetxController {
  Rx<AllCategoriesModel> getAllCategories = AllCategoriesModel().obs;
  Rx<HomeModel> getHomeData = HomeModel().obs;
  Rx<AllFamilesModel> getAllFamiles = AllFamilesModel().obs;
  Rx<MealByCategoryModel> getMealByCategory = MealByCategoryModel().obs;
  Rx<MealByIdModel> getMealById = MealByIdModel().obs;
  Rx<FamilyByIdModel> getFamilyById = FamilyByIdModel().obs;
}
