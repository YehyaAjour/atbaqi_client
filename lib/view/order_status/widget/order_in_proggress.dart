import 'package:atbaqi_client/controllers/app_controller.dart';
import 'package:atbaqi_client/controllers/profile_controller.dart';
import 'package:atbaqi_client/core/value/colors.dart';
import 'package:atbaqi_client/view/messageAndChat/screens/chat_message.dart';
import 'package:atbaqi_client/view/order_status/widget/stepper.dart';

import '../../../core/utils/app_imports.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_image.dart';

class OrderInProggress extends StatelessWidget {
  String familyId;
  String processTime;
  OrderInProggress(this.familyId,this.processTime);
  AppController appController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 82.h,
        ),
        CustomSvgImage(
          imageName: 'inproggress',
          width: 160.w,
          height: 160.h,
        ),
        SizedBox(
          height: 24.h,
        ),
        CustomText('الطلب قيد التحضير', fontSize: 20.sp, fontFamily: 'din'),
        SizedBox(
          height: 24.h,
        ),
        CustomText('الوقت المقدر لتحضير طلبك من قبل الأسرة :', fontSize: 20.sp, fontFamily: 'din',fontWeight: FontWeight.normal,),
        SizedBox(
          height: 15.h,
        ),
        CustomText(processTime.split(' ').first, fontSize: 20.sp, fontFamily: 'din',color: AppColors.primaryColor,),
        SizedBox(
          height: 5.h,
        ),
        CustomText(processTime.split(' ').last, fontSize: 20.sp, fontFamily: 'din',color: AppColors.primaryColor,),

        SizedBox(
          height: 55.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: CustomButton(
            title: 'تواصل مع الاسرة',
            width: double.infinity,
            height: 48.h,
            btnColor: AppColors.primaryColor,
            borderRadious: 18.r,
            onTap: () {
              Get.to(ChatMessanger(
                myId: Get.find<ProfileController>()
                    .getProfileData
                    .value
                    .profiles[0]
                    .id.toString(),
                otherId: familyId,
                // id: Get.find<ProfileController>()
                //     .getProfileData
                //     .value
                //     .id
                //     .toString(),
              ));
            },
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
