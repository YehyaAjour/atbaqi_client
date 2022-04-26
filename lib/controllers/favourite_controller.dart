import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../models/all_favourite_model.dart';

class FavouriteController extends GetxController{
  Rx<AllFavouriteModel> getAllFavouriteData = AllFavouriteModel().obs;
}