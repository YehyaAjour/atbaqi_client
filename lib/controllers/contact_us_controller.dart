import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';

class ContactUsController extends GetxController{

  String title,message;
  setTitle(String value) => this.title = value;
  setMessage(String value) => this.message = value;

  validationTitle(String value) {
    if (GetUtils.isNull(value) || value.isEmpty) {
      return "عنوان الرسالة مطلوب";
    }
  }

  validationMessage(String value) {
    if (GetUtils.isNull(value) || value.isEmpty) {
      return "لا يمكن أن تكون الرسالة فارغة";
    }
  }

}