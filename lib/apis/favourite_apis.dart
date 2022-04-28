
import 'package:dio/dio.dart';
import 'package:get/get.dart' as myGet;

import '../controllers/favourite_controller.dart';
import '../core/services/sp_helper.dart';
import '../core/utils/constants.dart';
import '../core/utils/helper.dart';
import '../core/utils/progress_dialog_utils.dart';
import '../models/all_favourite_model.dart';


class FavouriteApis {
  FavouriteApis._();

  static FavouriteApis favouriteApis = FavouriteApis._();
  Dio dio;
  FavouriteController favouriteController = myGet.Get.find();


  initDio() {
    if (dio == null) {
      dio = Dio();
      return dio;
    } else {
      return dio;
    }
  }





  addToFavourite(int family_id) async {
    try {
      initDio();
      String token = SPHelper.spHelper.getToken();
      ProgressDialogUtils.show();

      FormData data = FormData.fromMap({
        'family_id': family_id,
      });
      Response response = await dio.post(
        baseUrl + AddToFavouriteURL,
        data: data,
        options: Options(
          headers: {
            'auth-token': token,
          },
        ),
      );
      if (response.data['status']) {
        ProgressDialogUtils.hide();
        print('addToFavouriteSuccessful');
        getAllFavorites();
         Helper.getSheetSucsses(response.data['errNum']);
      } else {
         ProgressDialogUtils.hide();
        print('تمت أضافة الأسرة للمفضلة مؤخراً');
        Helper.getSheetError(response.data['msg']);
      }
    } catch (err) {
      ProgressDialogUtils.hide();
      print(err.toString());
    }
  }
  removeFromFavourite(int family_id) async {
    try {
      initDio();
      String token = SPHelper.spHelper.getToken();
      ProgressDialogUtils.show();

      FormData data = FormData.fromMap({
        'family_id': family_id,
      });
      Response response = await dio.post(
        baseUrl + RemoveFromFavouriteURL,
        data: data,
        options: Options(
          headers: {
            'auth-token': token,
          },
        ),
      );
      if (response.statusCode==200) {
        ProgressDialogUtils.hide();
        print('removeFromFavourite');
        getAllFavorites();
         Helper.getSheetSucsses(response.data['msg']);
      } else {

      }
    } catch (err) {
      ProgressDialogUtils.hide();
      print(err.toString());
    }
  }


  getAllFavorites() async {
    try {
      initDio();
      String token = SPHelper.spHelper.getToken();
      Response response = await dio.get(
        baseUrl + GetAllFavouriteURL,
        options: Options(
          headers: {
            'auth-token': token,
          },
        ),
      );
      if (response.statusCode == 200) {
        favouriteController.getAllFavouriteData.value =
            AllFavouriteModel.fromJson(response.data);
        print("Store in All Favourite Model Successful ${response.data}");
      } else {}
    } catch (e) {
      print(e.toString());
    }
  }


}
