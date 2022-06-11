import 'package:atbaqi_client/apis/order_apis.dart';
import 'package:atbaqi_client/view/order_status/widget/stepper.dart';

import '../../../core/utils/app_imports.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_image.dart';

class OrderReceived extends StatelessWidget {
  String status;
  String orderId;
  OrderReceived(this.status, this.orderId);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 82.h,
        ),
        CustomSvgImage(
          imageName: 'received',
          width: 160.w,
          height: 160.h,
        ),
        SizedBox(
          height: 24.h,
        ),
        CustomText(
          status != "delivery"
              ? 'تم الاستلام'
              : 'تم التجهيز بانتظار الاستلام من طرفك',
          fontSize: 20.sp,
          fontFamily: 'din',
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 110.h,
        ),
        Visibility(
          visible: status == "delivery",
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
            child: CustomButton(
              title: 'تأكيد الاستلام',
              width: double.infinity,
              height: 48.h,
              btnColor: AppColors.primaryColor,
              borderRadious: 18.r,
              onTap: () {
                OrderApis.orderApis.accceptOrder(orderId);
              },
            ),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
