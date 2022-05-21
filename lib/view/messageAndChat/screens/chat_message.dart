import 'dart:async';

import 'package:atbaqi_client/core/services/firebase_chat.dart';
import 'package:atbaqi_client/core/utils/app_imports.dart';
import 'package:atbaqi_client/core/utils/helper.dart';
import 'package:atbaqi_client/core/widgets/custom_image.dart';
import 'package:atbaqi_client/models/message_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as init;

class ChatMessanger extends StatefulWidget {
  final String myId;
  final String otherId;
  final String name;
  final String image;
  final String id;
  final String recevidNotificationId;
  ChatMessanger(
      {this.myId,
      this.otherId,
      this.id,
      this.name,
      this.image,
      this.recevidNotificationId});

  @override
  _ChatMessangerState createState() => _ChatMessangerState();
}

class _ChatMessangerState extends State<ChatMessanger> {
  TextEditingController textEditingController = TextEditingController();

  ScrollController _controller;
  @override
  void initState() {
    _controller = ScrollController();
    try {
      Timer(
        Duration(milliseconds: 200),
        () {
          if (_controller == null) {
          } else {
            _controller.jumpTo(_controller.position.maxScrollExtent);
          }
        },
      );
    } catch (e) {}
    super.initState();
  }

  buildMessage(Map map, String myId, double width) {
    if (map['senderId'] == myId) {
      return myMessage(map, width, map['hour']);
    } else {
      return partnerMessageView(map, width, map['hour']);
    }
  }

  Widget myMessage(Map map, double width, String hour) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            child: map['content'].toString().isNotEmpty
                ? Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: BubbleSpecialThree(
                      text: map['content'],
                      color: Color(0xffFFCB00),
                      tail: false,
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontFamily: "din"),
                    ),
                  )
                : SizedBox()
            // : Container(
            //     constraints: BoxConstraints(
            //       minWidth: 50.w,
            //       maxWidth: 200.w,
            //     ),
            //     child: CachedNetworkImage(
            //       imageUrl: map['urlImage'],
            //       imageBuilder: (context, imageProvider) => Container(
            //         height: ScreenUtil().setHeight(150),
            //         decoration: BoxDecoration(
            //           image: DecorationImage(
            //             image: imageProvider,
            //             fit: BoxFit.cover,
            //           ),
            //         ),
            //       ),
            //       placeholder: (context, url) =>
            //           Center(child: CircularProgressIndicator()),
            //       errorWidget: (context, url, error) =>
            //           Center(child: Icon(Icons.error)),
            //     ),
            //   ),
            ),
      ],
    );
  }

  Widget partnerMessageView(Map map, double width, String hour) {
    return Container(
      padding: const EdgeInsets.only(top: 8.0, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            constraints: BoxConstraints(
              minWidth: 50,
              maxWidth: 200,
            ),
            decoration: BoxDecoration(
              color: Color(0xffefeff4),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(8.00),
                topLeft: Radius.circular(8.00),
                bottomRight: Radius.circular(8.00),
              ),
            ),
            child: Container(
              child: map['content'].toString().isNotEmpty
                  ? CustomText(
                      map['content'],
                    )
                  // style: getStyle(blackColor, FontWeight.normal, 17))
                  : Container(
                      constraints: BoxConstraints(
                        minWidth: 50,
                        maxWidth: 200,
                      ),
                      child: CachedNetworkImage(
                        imageUrl: map['urlImage'],
                        imageBuilder: (context, imageProvider) => Container(
                          height: ScreenUtil().setHeight(150),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                            Center(child: Icon(Icons.error)),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: CustomText(
            "الرسائل ",
            textAlign: TextAlign.right,
            color: AppColors.whiteColor,
            fontSize: 16.sp,
            // style: getStyle(whiteColor, FontWeight.w700, 16),
          ),
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24.00)),
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FireBaseHelper.fireBaseHelper
                        .getAllChatMessages(widget.otherId, widget.myId),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: Container(),
                        );
                      } else if (snapshot.hasData && snapshot.data == null) {
                        return Center(child: Helper.loading());
                      } else {
                        List<Map<String, dynamic>> data =
                            snapshot.data.docs.map((e) => e.data()).toList();
                        List<MessageModel> messages =
                            data.map((e) => MessageModel.fromJson(e)).toList();
                        return ListView.builder(
                          controller: _controller,
                          itemCount: messages.length,
                          itemBuilder: (context, index) {
                            return buildMessage(
                              data[index],
                              widget.myId,
                              size.width,
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ),
              Container(
                child: Row(
                  children: [
                    SizedBox(
                      width: ScreenUtil().setWidth(10),
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (textEditingController.text.trim().isNotEmpty) {
                          // DateTime dateTime = DateTime.now();
                          // String hour = '${dateTime.hour}:${dateTime.minute}';

                          // Server.server.chatNotification(
                          //     textEditingController.text, widget.id);
                          FireBaseHelper.fireBaseHelper.updateReadMessage(
                            widget.myId,
                            widget.otherId,
                          );
                          String hour =
                              init.DateFormat.jm().format(DateTime.now());
                          FireBaseHelper.fireBaseHelper.newMessage(
                            message: MessageModel(
                              content: textEditingController.text,
                              recieverId: widget.otherId,
                              senderId: widget.myId,
                              hour: hour,
                              timeStamp: FieldValue.serverTimestamp(),
                              isRead: false,
                            ),
                            reciverId: widget.otherId,
                            senderId: widget.myId,
                          );

                          textEditingController.clear();

                          Timer(
                            Duration(milliseconds: 300),
                            () => _controller
                                .jumpTo(_controller.position.maxScrollExtent),
                          );
                        }
                      },
                      child: CustomSvgImage(
                        height: 40.h,
                        width: 40.w,
                        color: AppColors.primaryColor,
                        imageName: 'send',
                      ),
                    ),
                    SizedBox(
                      width: ScreenUtil().setWidth(14),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        width: ScreenUtil().setWidth(290),
                        // height: ScreenUtil().setHeight(55),
                        decoration: BoxDecoration(
                          color: Color(0xffffffff),
                          border: Border.all(
                            width: 1.00,
                            color: Color(0xffefeff4),
                          ),
                          borderRadius: BorderRadius.circular(8.00),
                        ),
                        child: Column(
                          children: [
                            TextField(
                              controller: textEditingController,
                              onTap: () {
                                try {
                                  Timer(
                                    Duration(milliseconds: 300),
                                    () => _controller.jumpTo(
                                        _controller.position.maxScrollExtent),
                                  );
                                } catch (e) {}
                              },
                              decoration: InputDecoration(
                                hintText: "اكتب الرسالة هنا",
                                hintStyle: TextStyle(
                                  fontFamily: "din",
                                  fontSize: 15.sp,
                                  color: Color(0xffc8c7cc),
                                ),

                                contentPadding: EdgeInsets.only(
                                    left: 15, right: 15, top: 15),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                // hintText: translator.translate('message_here'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: ScreenUtil().setWidth(10),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
