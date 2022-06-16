import 'package:atbaqi_client/apis/cart_apies.dart';
import 'package:atbaqi_client/controllers/app_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as myGet;

import '../controllers/order_controller.dart';
import '../core/services/sp_helper.dart';
import '../core/utils/constants.dart';
import '../core/utils/helper.dart';
import '../core/utils/progress_dialog_utils.dart';
import '../models/all_order_model.dart';
import '../models/order_details_model.dart';
import '../models/order_status_model.dart';
import '../view/order_status/screens/order_status_screen.dart';

class OrderApis {
  OrderApis._();

  static OrderApis orderApis = OrderApis._();
  Dio dio;
  OrderController orderController = myGet.Get.find();
  AppController appController = myGet.Get.find();

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
      if (response.data['status']) {
        CartApis.cartApis.getAllCartList();
        ProgressDialogUtils.hide();
        appController.setIndexEstates(0);
        getOrderDetails(response.data['order-created']['id'].toString());
        myGet.Get.to(OrderStatusScreen());
        Helper.getSheetSucsses(response.data['msg']);
      } else {
        ProgressDialogUtils.hide();
        Helper.getSheetError(response.data['msg']);

      }
    } catch (err) {
      ProgressDialogUtils.hide();
      print(err.toString());
    }
  }

  getAllOrderList() async {
    try {
      initDio();
      String token = SPHelper.spHelper.getToken();
      Response response = await dio.get(
        baseUrl + AllORDERURL,
        options: Options(
          headers: {'auth-token': token, 'Accept': 'application/json'},
        ),
      );
      if (response.statusCode == 200) {
        orderController.getAllOrderListData.value =
            AllOrderModel.fromJson(response.data);
        print("Store in  AllOrder Model Successful ${response.data}");
      } else {}
    } catch (e) {
      print(e.toString());
    }
  }

  getOrderDetails(var orderId) async {
    // try {
    orderController.getOrderDetailsData.value = OrderDetailsModel();
    initDio();
    String token = SPHelper.spHelper.getToken();
    Response response = await dio.get(
      baseUrl + 'user/order/$orderId',
      options: Options(
        headers: {'auth-token': token, 'Accept': 'application/json'},
      ),
    );
    if (response.statusCode == 200) {
      orderController.getOrderDetailsData.value =
          OrderDetailsModel.fromJson(response.data);
      print("Store in  Order Details Model Successful ${response.data}");
    } else {}
    // } catch (e) {
    //   print(e.toString());
    // }
  }

  getOrderStatus(var orderId) async {
    try {
      initDio();
      String token = SPHelper.spHelper.getToken();
      Response response = await dio.get(
        baseUrl + 'user/order-status/$orderId',
        options: Options(
          headers: {'auth-token': token, 'Accept': 'application/json'},
        ),
      );
      if (response.statusCode == 200) {
        orderController.getOrderStatusData.value =
            OrderStatusModel.fromJson(response.data);
        print("Store in  Order Status Model Model Successful ${response.data}");
      } else {}
    } catch (e) {
      print(e.toString());
    }
  }

  cancelOrder(var orderId) async {
    try {
      initDio();
      String token = SPHelper.spHelper.getToken();
      ProgressDialogUtils.show();

      Response response = await dio.put(
        baseUrl + 'user/order/cancel-order/$orderId',
        options: Options(
          headers: {'auth-token': token, 'Accept': 'application/json'},
        ),
      );
      if (response.statusCode == 200) {
        myGet.Get.back();
        getAllOrderList();
        ProgressDialogUtils.hide();

        Helper.getSheetSucsses('تم الغاء الطلب');
      } else {
        ProgressDialogUtils.hide();
      }
    } catch (e) {
      ProgressDialogUtils.hide();

      print(e.toString());
    }
  }

  accceptOrder(var orderId) async {
    try {
      initDio();
      String token = SPHelper.spHelper.getToken();
      ProgressDialogUtils.show();

      Response response = await dio.put(
        baseUrl + 'user/order/acceptOrder/$orderId',
        options: Options(
          headers: {'auth-token': token, 'Accept': 'application/json'},
        ),
      );
      if (response.statusCode == 200) {
        myGet.Get.back();
        getAllOrderList();
        ProgressDialogUtils.hide();

        Helper.getSheetSucsses('تم استلام الطلب');
      } else {
        ProgressDialogUtils.hide();
      }
    } catch (e) {
      ProgressDialogUtils.hide();

      print(e.toString());
    }
  }
}
