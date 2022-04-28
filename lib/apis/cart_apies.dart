
import 'package:dio/dio.dart';
import 'package:get/get.dart' as myGet;

import '../controllers/cart_controller.dart';
import '../core/services/sp_helper.dart';
import '../core/utils/constants.dart';
import '../core/utils/helper.dart';
import '../core/utils/progress_dialog_utils.dart';
import '../models/all_cart_list_model.dart';
import '../models/all_favourite_model.dart';


class CartApis {
  CartApis._();

  static CartApis cartApis = CartApis._();
  Dio dio;
  CartController cartController = myGet.Get.find();


  initDio() {
    if (dio == null) {
      dio = Dio();
      return dio;
    } else {
      return dio;
    }
  }





  addToCart(String meal_id,String meal_qty) async {
    try {
      initDio();
      String token = SPHelper.spHelper.getToken();
      ProgressDialogUtils.show();

      FormData data = FormData.fromMap({
        'meal_id': meal_id,
        'meal_qty': meal_qty,
      });
      Response response = await dio.post(
        baseUrl + AddToCartURL,
        data: data,
        options: Options(
          headers: {
            'auth-token': token,
          },
        ),
      );
      if (response.data['status']) {
        ProgressDialogUtils.hide();
        print('addToCartSuccessful');
        Helper.getSheetSucsses(response.data['errNum']);
        getAllCartList();
      } else {
        ProgressDialogUtils.hide();
        print('addToCartAlready Added');
        Helper.getSheetError(response.data['msg']);
      }
    } catch (err) {
      ProgressDialogUtils.hide();
      print(err.toString());
    }
  }


  getAllCartList() async {
    try {
      initDio();
      String token = SPHelper.spHelper.getToken();
      Response response = await dio.get(
        baseUrl + GetAllCartListURL,
        options: Options(
          headers: {
            'auth-token': token,
          },
        ),
      );
      if (response.statusCode == 200) {
        cartController.getCartListData.value =
            AllCartListModel.fromJson(response.data);
        print("Store in All Cart List Model Successful ${response.data}");
      } else {}
    } catch (e) {
      print(e.toString());
    }
  }



}
