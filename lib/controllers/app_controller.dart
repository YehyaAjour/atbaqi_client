import 'package:get/get.dart';

class AppController extends GetxController {
  int indexScreen = 0;
  int currentQuantity = 1;


  setIndexScreen(int value) {
    this.indexScreen = value;
    update();
  }
  increaseCurrentQuantity() {
    this.currentQuantity++;
    update();
  }
  decreaseCurrentQuantity() {
    if(currentQuantity>1){
      this.currentQuantity--;
      update();
    }else{
      currentQuantity = 1;
      update();
    }
  }


  int indexEstates = 0;

  setIndexEstates(int value) {
    this.indexEstates = value;
    update(['indexEstates']);
  }
}
