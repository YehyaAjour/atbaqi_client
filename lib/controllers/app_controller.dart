import 'package:atbaqi_client/core/services/firebase_chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  int indexScreen = 0;
  int currentQuantity = 1;

  var mapProfile = {}.obs;

  var listChats = [].obs;
  int countMessageUnRead = 0;
  testChat() async {
    await FireBaseHelper.fireBaseHelper
        .getAllMyChats(myId: mapProfile['userprofile'][0]['jawwal']);

    this.countMessageUnRead = 0;
    for (var i = 0; i < listChats.length; i++) {
      QuerySnapshot querySnapshot = await FireBaseHelper.fireBaseHelper
          .getAllChatMessagesWithoutStream(listChats[i]['mobile'].toString(),
              mapProfile['userprofile'][0]['jawwal']);

      for (var j = 0; j < querySnapshot.docs.length; j++) {
        if (querySnapshot.docs[j].data()['senderId'] ==
            mapProfile['userprofile'][0]['jawwal']) {
          this.countMessageUnRead = 0;
        } else {
          if (!querySnapshot.docs[j].data()['read']) {
            countMessageUnRead = countMessageUnRead + 1;
          }
        }

        update(['notification']);
      }
    }
  }

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
