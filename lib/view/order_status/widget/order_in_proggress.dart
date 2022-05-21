import 'package:atbaqi_client/view/order_status/widget/stepper.dart';

import '../../../core/utils/app_imports.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_image.dart';

class OrderInProggress extends StatelessWidget {

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
        CustomText('الطلب قيد التحضير',fontSize: 20.sp,fontFamily: 'din'),
        SizedBox(
          height: 110.h,
        ),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.0.w),
          child: CustomButton(
            title: 'تواصل مع الاسرة',
            width: double.infinity,
            height: 48.h,
            btnColor: AppColors.primaryColor,
            borderRadious: 18.r,
            onTap: (){},
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.0.w),
          child: CustomButton(
            title: 'الغاء الطلب',
            width: double.infinity,
            height: 48.h,
            btnColor: AppColors.primaryColor,
            borderRadious: 18.r,
            onTap: (){},
          ),
        ),
      ],
    );
  }
}
