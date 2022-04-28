import 'dart:io';
import 'package:atbaqi_client/apis/home_apis.dart';
import 'package:atbaqi_client/apis/profile_apis.dart';
import 'package:atbaqi_client/core/services/firebase_notification.dart';
import 'package:atbaqi_client/view/main%20screen/Screens/main_screen.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as myGet;

import '../controllers/auth_controller.dart';
import '../core/services/sp_helper.dart';
import '../core/utils/constants.dart';
import '../core/utils/helper.dart';
import '../core/utils/progress_dialog_utils.dart';
import '../models/forget_password_model.dart';
import '../view/auth/login_screen.dart';
import 'cart_apies.dart';
import 'favourite_apis.dart';

class AuthApis {
  AuthApis._();

  static AuthApis authApis = AuthApis._();
  Dio dio;

  AuthController authController = myGet.Get.find();
  // ProfileController profileController = myGet.Get.find();

  initDio() {
    if (dio == null) {
      dio = Dio();
      return dio;
    } else {
      return dio;
    }
  }

  login(String phone, String password) async {
    try {
      initDio();
      ProgressDialogUtils.show();

      FormData data = FormData.fromMap({
        'phone': phone,
        'password': password,
      });
      Response response = await dio.post(baseUrl + loginUrl, data: data);
      if (response.data["status"]) {
        await SPHelper.spHelper.setToken(response.data['user']['api_token']);

        ProgressDialogUtils.hide();
        ProfileApis.profileApis.getProfile();
        // HomeApis.homeApis.getAllMeals();
        // HomeApis.homeApis.getHomeMeals();
        print(response.data['user']['api_token']);
        HomeApis.homeApis.getAllCategories();
        HomeApis.homeApis.getHome();
        ProfileApis.profileApis.getProfile();
        HomeApis.homeApis.getHome();
        FavouriteApis.favouriteApis.getAllFavorites();
        CartApis.cartApis.getAllCartList();
        myGet.Get.offAll(() => MainScreen());
        Helper.getSheetSucsses(response.data['msg']);
      } else {
        ProgressDialogUtils.hide();
        Helper.getSheetError(response.data['msg']);
      }
    } catch (err) {
      ProgressDialogUtils.hide();
      print(err);
    }
  }

  register(
      String phone, email, name, File image, passwordR, confirmPassword) async {
    try {
      initDio();
      ProgressDialogUtils.show();
      dynamic fcm = NotificationHelper().getToken();
      FormData data = FormData.fromMap({
        'phone': phone,
        "email": email,
        "name": name,
        "image": await MultipartFile.fromFile(image.path, filename: image.path),
        "password": passwordR,
        'password_confirmation': confirmPassword,
        "fcm": fcm,
        "device": "android",
      });
      Response response = await dio.post(
        baseUrl + registerUrl,
        options: Options(headers: {"Accept": "application/json"}),
        data: data,
      );
      if (response.statusCode == 200) {
        ProgressDialogUtils.hide();
        myGet.Get.off(() => LoginScreen());
        Helper.getSheetSucsses("تم تسجيل الاشتراك بنجاح");
      } else {
        ProgressDialogUtils.hide();
        Helper.getSheetError("هناك خطأ");
      }
    } catch (err) {
      ProgressDialogUtils.hide();
      print(err);

      Helper.getSheetError(err.toString());
    }
  }

  logOut() async {
    try {
      initDio();
      ProgressDialogUtils.show();
      String token = SPHelper.spHelper.getToken();

      Response response = await dio.post(
        baseUrl + logoutUrl,
        options: Options(
          headers: {
            'auth-token': token,
          },
        ),
      );

      if (response.data['status']) {
        ProgressDialogUtils.hide();
        myGet.Get.offAll(() => LoginScreen());
        SPHelper.spHelper.setToken("");
        Helper.getSheetSucsses(response.data['msg']);
      } else {
        ProgressDialogUtils.hide();
      }
    } catch (err) {
      ProgressDialogUtils.hide();
    }
  }

  //
  forgetPassword(String email) async {
    try {
      initDio();
      ProgressDialogUtils.show();

      FormData data = FormData.fromMap({
        'email': email,
      });
      Response response =
          await dio.post(baseUrl + forgetpasswordUrl, data: data);
      if (response.data["status"]) {
        authController.getForgetPasswordData.value =
            ForgetPasswordModel.fromJson(response.data);
        ProgressDialogUtils.hide();
        Helper.getSheetSucsses(response.data['msg']);
      } else {
        ProgressDialogUtils.hide();
        print(response.data['msg']);
        Helper.getSheetError(response.data['msg']);
      }
    } catch (err) {
      ProgressDialogUtils.hide();
      print(err.toString());
      Helper.getSheetError(err.toString());
    }
  }

  //
  reAssignPassword(
      String code, String password, String password_confirmation) async {
    try {
      initDio();
      ProgressDialogUtils.show();

      FormData data = FormData.fromMap({
        'code': code,
        'password': password,
        'password_confirmation': password_confirmation,
      });
      Response response =
          await dio.post(baseUrl + resetPasswordUrl, data: data);
      if (response.data["status"]) {
        ProgressDialogUtils.hide();
        myGet.Get.offAll(() => LoginScreen());
        Helper.getSheetSucsses(response.data['msg']);
      } else {
        ProgressDialogUtils.hide();
        // print(response.data['msg']['code'][0]);
        Helper.getSheetError(response.data['msg']['code'][0]);
      }
    } catch (err) {
      ProgressDialogUtils.hide();
      print(err.toString());
      Helper.getSheetError(err.toString());
    }
  }
}
