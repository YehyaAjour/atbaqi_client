import 'package:atbaqi_client/core/services/firebase_chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  int indexScreen = 0;
  int currentQuantity = 1;

  var mapProfile = {}.obs;

  var listChats = [].obs;
  int countMessageUnRead = 0;
 
  setIndexScreen(int value) {
    this.indexScreen = value;
    update();
  }

  increaseCurrentQuantity() {
    this.currentQuantity++;
    update();
  }

  decreaseCurrentQuantity() {
    if (currentQuantity > 1) {
      this.currentQuantity--;
      update();
    } else {
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
