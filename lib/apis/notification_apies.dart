import 'package:dio/dio.dart';

import '../controllers/notification_controller.dart';
import 'package:get/get.dart' as myGet;

import '../core/services/sp_helper.dart';
import '../core/utils/constants.dart';
import '../models/notification_model.dart';



class NotificationApis{

  NotificationApis._();
  static NotificationApis notificationApis = NotificationApis._();
  Dio dio;
  NotificationController notificationController = myGet.Get.find();

  initDio() {
    if (dio == null) {
      dio = Dio();
      return dio;
    } else {
      return dio;
    }
  }

  getNotificationList() async {
    try {
      initDio();
      String token = SPHelper.spHelper.getToken();
      Response response = await dio.get(
        baseUrl + AllNotificationURL,
        options: Options(
          headers: {
            'auth-token': token,
            'Accept': 'application/json'
          },
        ),
      );
      if (response.statusCode == 200) {
        notificationController.getAllNotificationData.value =
            NotificationModel.fromJson(response.data);
        print(" NotificationModel ${response.data}");
      } else {}
    } catch (err) {
      print("NotificationModel  $err");
    }
  }


}