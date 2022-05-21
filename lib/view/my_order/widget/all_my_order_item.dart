import 'package:atbaqi_client/core/value/colors.dart';
import 'package:atbaqi_client/core/widgets/custom_image.dart';

import '../../../core/utils/app_imports.dart';

class AllMyOrderItem extends StatelessWidget {
  final String order_status;
  final String orderNumber;
  final String price;
  final String familyName;
  final Function onTap;

  const AllMyOrderItem(
      {this.order_status,
      this.orderNumber,
      this.price,
      this.onTap,
      this.familyName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: Column(
          children: [
            Container(
              height: 100.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13.r)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(7.w),
                      height: 80.h,
                      width: 70.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border:
                              Border.all(color: Colors.grey.withOpacity(0.8))),
                      child: CustomSvgImage(
                        imageName: order_status == 'pending' ? 'wait'
                            : order_status == 'rejected' ? 'rejected'
                                : 'complete_order',
                        color: order_status == 'pending' ? Colors.grey
                            : order_status == 'rejected' ? Colors.red
                                : AppColors.primaryColor,
                      ),
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                CustomText(
                                  'رقم الطلب  #  ',
                                  fontSize: 14.sp,
                                  color: Colors.grey,
                                ),
                                CustomText(
                                  orderNumber,
                                  fontSize: 14.sp,
                                ),
                                Spacer(),
                                Container(
                                  height: 25.h,
                                  width: 60.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      border: Border.all(
                                          color: order_status == 'pending' ? Colors.grey
                                          : order_status == 'rejected' ? Colors.red
                                              : Colors.green)),
                                  child: Center(
                                      child: CustomText(
                                          order_status == 'pending' ? 'قيد التجهيز'
                                              : order_status == 'rejected' ? 'مرفوض'
                                                  : 'مكتمل',
                                          fontSize: 10.sp,
                                          color: order_status == 'pending' ? Colors.grey
                                              : order_status == 'rejected' ? Colors.red
                                                  : Colors.green)),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              children: [
                                CustomText(
                                  'العائلة المنتجة ',
                                  fontSize: 14.sp,
                                  color: Colors.grey,
                                ),
                                CustomText(
                                  familyName,
                                  fontSize: 14.sp,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              children: [
                                CustomText(
                                  'السعر ',
                                  fontSize: 14.sp,
                                  color: Colors.grey,
                                ),
                                CustomText(
                                  price,
                                  fontSize: 14.sp,
                                ),
                                CustomText(
                                  '₪',
                                  fontSize: 14.sp,
                                ),
                                Spacer(),
                                CustomText(
                                  'تفاصيل الطلب',
                                  fontSize: 15.sp,
                                  color: AppColors.primaryColor,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 7.h,
            )
          ],
        ),
      ),
    );
  }
}