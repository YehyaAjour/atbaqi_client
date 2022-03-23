import 'package:get/get.dart';

class OTPController extends GetxController{
  bool isFinish= false;
  void changeIsFinish(){
    isFinish=true;
    update();
  }
}