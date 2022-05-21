import 'package:atbaqi_client/core/utils/constants.dart';

import '../../../core/utils/app_imports.dart';
import '../../../core/widgets/cached_network_image.dart';

class OrderDetailsItem extends StatelessWidget {
  final String imgUrl;
  final String itemName;
  final String category;
  final String price;
  final String quantity;

  const OrderDetailsItem({this.imgUrl, this.itemName, this.price,this.category,this.quantity});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 19.0.w),
          child: Container(
            height: 100.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x29000000),
                  offset: Offset(0, 1),
                  blurRadius: 6,
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 9.w,),
                  CachedNetworkImageShare(
                      baseImageUrl + imgUrl,
                      55,
                      78,
                      1),
                  SizedBox(
                    width: 19.w,
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [

                              CustomText(
                                itemName,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              Spacer(),
                              CustomText(
                                'الكمية ',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.normal,
                                color: AppColors.grey,
                              ),
                              CustomText(
                                quantity,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.normal,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              CustomText(
                                'التصنيف ',
                                fontSize: 14.sp,
                                color: AppColors.grey,
                                fontWeight: FontWeight.normal,

                              ),
                              CustomText(
                                category,
                                fontSize: 12.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,

                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              CustomText(
                                'السعر ',
                                fontSize: 14.sp,
                                color: AppColors.grey,
                                fontWeight: FontWeight.normal,

                              ),CustomText(
                                price,
                                fontSize: 14.sp,
                                color: AppColors.primaryColor,
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 5.h,)
      ],
    );
  }
}
