import 'package:get/get.dart';

class AppController extends GetxController {
  int indexScreen = 0;

  setIndexScreen(int value) {
    this.indexScreen = value;
    update();
  }
}
