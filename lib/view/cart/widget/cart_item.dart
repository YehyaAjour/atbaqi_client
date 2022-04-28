import 'package:atbaqi_client/core/utils/constants.dart';
import 'package:atbaqi_client/core/widgets/custom_image.dart';

import '../../../core/utils/app_imports.dart';
import '../../../core/widgets/cached_network_image.dart';

class CartItem extends StatelessWidget {
  final Function onTap;
  final String mealName;
  final String mealPrice;
  final String mealImage;
  final String mealQuantity;

  const CartItem(
      {this.onTap,
      this.mealName,
      this.mealPrice,
      this.mealImage,
      this.mealQuantity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Row(
              children: [
                CachedNetworkImageShare(
                    baseImageUrl + mealImage ?? '', 55, 78, 8),
                SizedBox(width: 15.w,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      mealName ?? '',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        CustomText(
                          'الكمية: ',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,

                        ),
                        CustomText(
                          mealQuantity??'',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,


                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.more_horiz_outlined,size: 30,),
                      onPressed: () {},
                    ),
                    Row(
                      children: [
                        CustomText(
                          mealPrice ?? '',
                          fontSize: 16.sp,
                          color: AppColors.primaryColor,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        CustomText(
                          "شيكل",
                          fontSize: 16.sp,
                          color: AppColors.primaryColor,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Divider()
          ],
        ),
      ),
    );
  }
}
