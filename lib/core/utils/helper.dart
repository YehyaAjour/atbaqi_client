import 'package:fluttertoast/fluttertoast.dart';

import '../value/colors.dart';
import '../widgets/custom_text.dart';
import 'app_imports.dart';

class Helper {
  static setToast(String msg) {
    return Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.primaryColor,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static getSheetError(String title) {
    return Get.snackbar(
      '',
      '',
      messageText: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            title,
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Colors.red,
          ),
          SizedBox(
            width: ScreenUtil().setWidth(10),
          ),
          Icon(
            Icons.info,
            color: Colors.red,
          ),
        ],
      ),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.white,
    );
  }

  static getSheetSucsses(String title) {
    return Get.snackbar(
      '',
      '',
      messageText: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            title,
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Colors.green,
          ),
          SizedBox(
            width: ScreenUtil().setWidth(10),
          ),
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        ],
      ),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.white,
    );
  }

  static loading() {
    return Center(
        child: Column(
      children: [
        SizedBox(
          height: 10.h,
        ),
        CircularProgressIndicator(
          color: AppColors.primaryColor,
        ),
      ],
    ));
  }

  static var appRaduis = BorderRadius.circular(8.r);
}
