import 'package:atbaqi_client/models/all_categories_model.dart';
import 'package:atbaqi_client/models/all_familes_model.dart';
import 'package:atbaqi_client/models/home_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Rx<AllCategoriesModel> getAllCategories = AllCategoriesModel().obs;
  Rx<HomeModel> getHomeData = HomeModel().obs;
  Rx<AllFamilesModel> getAllFamiles = AllFamilesModel().obs;
}
