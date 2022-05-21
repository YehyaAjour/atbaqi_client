import 'dart:developer';

  import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
 import 'package:get/get.dart' as my;

class NotificationHelper {
  // AppController appController = my.Get.find();
  String token = '';
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      new FlutterLocalNotificationsPlugin();
  Map<String, dynamic> message = {};
  initialNotification() async {
    getToken();
    var initializationSettingsAndroid =
        new AndroidInitializationSettings('app_icon');
    var initializationSettingsIOS = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: onSelectNotification,
    );
    await firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print(
            'Message also contained a notification: ${message.notification.title}');
        showNotification(message.notification.title, message.notification.body);

       }
    });
  }

  Future onSelectNotification(String payload) async {
    if (payload != null) {}
  }

  void showNotification(String title, String body) async {
    await _demoNotification(
      title,
      body,
    );
   }

  Future<void> _demoNotification(String title, String body) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'channel_ID',
      'channel name',
      'channel description',
      importance: Importance.max,
      playSound: true,
      showProgress: true,
      priority: Priority.high,
      ticker: 'test ticker',
    );

    var iOSChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSChannelSpecifics,
    );
    await flutterLocalNotificationsPlugin
        .show(0, title, body, platformChannelSpecifics, payload: 'test');
  }

  getToken() async {
    firebaseMessaging.subscribeToTopic('all');
    token = await firebaseMessaging.getToken();
    log('FcmToken $token');
    return token;
  }

  Dio dio;

  initDio() {
    if (dio == null) {
      dio = Dio();
      return dio;
    } else {
      return dio;
    }
  }

  // getStatus(String id) async {
  //   try {
  //     initDio();
  //     String token = SPHelper.spHelper.getToken();
  //     my.Get.find<AppController>().getAllOrderData.value =
  //         OrderStatusModel.fromJson({});

  //     Response response = await dio.get(
  //       "http://memeals.herokuapp.com/api/family/order-status/" + id.toString(),
  //       options: Options(
  //         headers: {'auth-token': token, "Accept": "application/json"},
  //       ),
  //     );
  //     if (response.statusCode == 200) {
  //       my.Get.find<AppController>().getAllOrderData.value =
  //           OrderStatusModel.fromJson(response.data);

  //       print(" getStatus ${response.data}");
  //     } else {}
  //   } catch (err) {
  //     print("getStatus  $err");
  //   }
  // }
}
