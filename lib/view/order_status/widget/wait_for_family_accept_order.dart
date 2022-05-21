import 'package:atbaqi_client/view/order_status/widget/stepper.dart';

import '../../../core/utils/app_imports.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_image.dart';

class WaitForFamilyAcceptOrder extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 82.h,
        ),
        CustomSvgImage(
          imageName: 'wait',
          width: 160.w,
          height: 160.h,
          color: AppColors.primaryColor,
        ),
        SizedBox(
          height: 24.h,
        ),
        CustomText('تم ارسال الطلب بانتظار موافقة الأسرة',
          fontSize: 20.sp, fontFamily: 'din',textAlign: TextAlign.center,),
        SizedBox(
          height: 110.h,
        ),


      ],
    );
  }
}
