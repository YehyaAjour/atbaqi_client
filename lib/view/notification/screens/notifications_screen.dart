

import 'package:atbaqi_client/controllers/notification_controller.dart';

import '../../../core/utils/app_imports.dart';
import '../../../core/utils/helper.dart';
import '../widget/notification_item.dart';

class NotificationScreen extends StatelessWidget {
  NotificationController notificationController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        title: CustomText(
          'الاشعارات',
          fontSize: 20.sp,
          color: Colors.white,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          Obx(() {
            return notificationController.getAllNotificationData.value.status == null
                ? Helper.loading()
                : notificationController
                            .getAllNotificationData.value.notification.length ==
                        0
                    ? CustomText(
                        "لا توجد اشعارات",
                        fontSize: 14.sp,
                      )
                    : Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          physics: BouncingScrollPhysics(),
                          itemCount:  notificationController
                              .getAllNotificationData.value.notification.length,
                          itemBuilder: (context, index) {
                            return NotificationItem(
                              value:  notificationController
                                  .getAllNotificationData.value
                                  .notification[index],
                            );
                          },
                        ),
                      );
          })
        ],
      ),
    );
  }
}
