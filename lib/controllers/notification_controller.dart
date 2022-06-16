import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../models/notification_model.dart';

class NotificationController extends GetxController {
  Rx<NotificationModel> getAllNotificationData = NotificationModel().obs;

}
