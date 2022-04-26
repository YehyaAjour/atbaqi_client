

import 'package:dio/dio.dart';
import 'package:get/get.dart' as myGet;
import '../controllers/contact_us_controller.dart';
import '../core/services/sp_helper.dart';
import '../core/utils/constants.dart';
import '../core/utils/helper.dart';
import '../core/utils/progress_dialog_utils.dart';

class ContactUsApis{
  ContactUsApis._();

  static ContactUsApis contactUsApis = ContactUsApis._();
  Dio dio;
  ContactUsController contactUsController = myGet.Get.find();

  initDio() {
    if (dio == null) {
      dio = Dio();
      return dio;
    } else {
      return dio;
    }
  }


  contactUs(String title, String message) async {
    try {
      initDio();
      String token = SPHelper.spHelper.getToken();
      ProgressDialogUtils.show();

      FormData data = FormData.fromMap({
        'title': title,
        'message': message,
      });
      Response response = await dio.post(
          baseUrl + contactUsUrl,
          data: data,
        options: Options(
          headers: {
            'auth-token': token,
          },
        ),
      );
      if (response.statusCode==200) {
        ProgressDialogUtils.hide();
        Helper.getSheetSucsses(response.data['errNum']);
      } else {
        ProgressDialogUtils.hide();
        Helper.getSheetError(response.data['message']);
      }
    } catch (err) {
      ProgressDialogUtils.hide();
      Helper.getSheetError(err.toString());
    }
  }

}