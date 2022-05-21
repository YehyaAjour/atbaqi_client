import 'package:atbaqi_client/controllers/app_controller.dart';
import 'package:atbaqi_client/controllers/profile_controller.dart';
import 'package:atbaqi_client/core/services/firebase_chat.dart';
import 'package:atbaqi_client/core/utils/app_imports.dart';
import 'package:atbaqi_client/models/message_model.dart';
import 'package:atbaqi_client/view/messageAndChat/screens/chat_message.dart';
import 'package:atbaqi_client/view/messageAndChat/widgets/chat_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyChatsScreen extends StatelessWidget {
  AppController appController = Get.find();
  ProfileController profileController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          centerTitle: true,
          title: CustomText(
            "الرسائل ",
            color: AppColors.whiteColor,
            fontSize: 16.sp,
            textAlign: TextAlign.right,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24.00)),
          ),
        ),
        body: Column(
          children: [
            Obx(() {
              return Expanded(
                child: appController.listChats == []
                    ? CircularProgressIndicator()
                    : appController.listChats.length == 0
                        ? Center(
                            child: CustomText(
                              'لا يوجد رسائل',
                              fontSize: 16.sp,
                            ),
                          )
                        : ListView.builder(
                            itemCount: appController.listChats.length,
                            itemBuilder: (context, index) {
                              List<Map<String, dynamic>> myChat =
                                  appController.listChats.value;
                              return StreamBuilder<QuerySnapshot>(
                                  stream: FireBaseHelper.fireBaseHelper
                                      .getAllChatMessages(
                                    myChat[index]['mobile'].toString(),
                                    profileController
                                        .getProfileData.value.profiles[0].phone,
                                  ),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Center(
                                        child: Container(),
                                      );
                                    } else {
                                      List<Map<String, dynamic>> data = snapshot
                                          .data.docs
                                          .map((e) => e.data())
                                          .toList();
                                      List<MessageModel> messages = data
                                          .map((e) => MessageModel.fromJson(e))
                                          .toList();
                                      return GestureDetector(
                                        onTap: () {
                                          Get.to(ChatMessanger(
                                            myId: profileController
                                                .getProfileData
                                                .value
                                                .profiles[0]
                                                .phone,
                                            otherId: myChat[index]['mobile']
                                                .toString(),
                                            id: myChat[index]['usersInfo']['id']
                                                .toString(),
                                          ));
                                          FireBaseHelper.fireBaseHelper
                                              .updateReadMessage(
                                            profileController.getProfileData
                                                .value.profiles[0].phone,
                                            myChat[index]['mobile'].toString(),
                                          );
                                        },
                                        child: ChatItem(
                                          myChat[index],
                                          messages.length == 0
                                              ? ""
                                              : messages.last.content,
                                          messages.where((element) {
                                            return element.isRead == false &&
                                                element.senderId !=
                                                    profileController
                                                        .getProfileData
                                                        .value
                                                        .profiles[0]
                                                        .phone;
                                          }).length,
                                        ),
                                      );
                                    }
                                  });
                            },
                          ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
