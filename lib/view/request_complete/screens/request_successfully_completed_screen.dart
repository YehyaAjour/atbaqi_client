import 'package:atbaqi_client/view/order_status/screens/order_status_screen.dart';

import '../../../core/utils/app_imports.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_image.dart';

class RequestSuccessfullyCompleted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        children: [
          SizedBox(
            height: 56.h,
          ),
          GestureDetector(
            onTap: (){Get.back();},
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 17.0.w),
              child: Row(
                children: [
                  CustomSvgImage(
                    imageName: 'cancel',
                    width: 24.w,
                    height: 24.h,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 21.h,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(20),
                    topEnd: Radius.circular(20),
                  )),
              child: Column(
                children: [
                  SizedBox(
                    height: 21.h,
                  ),
                  CustomText(
                    'تم الطلب بنجاح',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'din',
                  ),
                  SizedBox(
                    height: 37.h,
                  ),
                  CustomSvgImage(
                    imageName: 'ordersuccessfull',
                    width: 255.w,
                    height: 224.h,
                  ),
                  SizedBox(
                    height: 41.h,
                  ),
                  Container(
                    height: 46.h,
                    width: 198.w,
                    child: CustomText(
                      'يحتاج الطبق الي 60 دقيقة للتحضير والتوصيل ',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'din',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 76.h,
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: CustomButton(
                      title: 'حالة الطلب',
                      width: double.infinity,
                      height: 48.h,
                      btnColor: AppColors.primaryColor,
                      borderRadious: 18.r,
                      onTap: (){Get.to(OrderStatusScreen());},
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: CustomButton(
                      title: 'العودة للصفحة الرئيسية',
                      width: double.infinity,
                      height: 48.h,
                      btnColor: AppColors.whiteColor,
                      titleColor: AppColors.primaryColor,
                      borderRadious: 18.r,
                      onTap: (){},
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
