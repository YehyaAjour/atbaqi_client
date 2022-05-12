
import 'package:atbaqi_client/apis/cart_apies.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as myGet;

import '../core/services/sp_helper.dart';
import '../core/utils/constants.dart';
import '../core/utils/helper.dart';
import '../core/utils/progress_dialog_utils.dart';


class OrderApis {
  OrderApis._();

  static OrderApis orderApis = OrderApis._();
  Dio dio;


  initDio() {
    if (dio == null) {
      dio = Dio();
      return dio;
    } else {
      return dio;
    }
  }

  createOrder(String address) async {
    try {
      initDio();
      String token = SPHelper.spHelper.getToken();
      ProgressDialogUtils.show();

      FormData data = FormData.fromMap({
        'address': address,
      });
      Response response = await dio.post(
        baseUrl + CREATEORDERURL,
        data: data,
        options: Options(
          headers: {
            'auth-token': token,
          },
        ),
      );
      if (response.statusCode==200) {
        ProgressDialogUtils.hide();
        print('CreateOrderSuccessful');
        Helper.getSheetSucsses(response.data['msg']);
        CartApis.cartApis.getAllCartList();
      } else {

      }
    } catch (err) {
      ProgressDialogUtils.hide();
      print(err.toString());
    }
  }





}
