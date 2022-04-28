

import 'package:atbaqi_client/core/utils/constants.dart';
import 'package:atbaqi_client/core/widgets/custom_image.dart';

import '../../../core/utils/app_imports.dart';
import '../../../core/widgets/cached_network_image.dart';

class MealsItem extends StatelessWidget {
  final Function onTap;
  final String mealName;
  final String mealPrice;
  final String mealImage;

  const MealsItem({this.onTap, this.mealName, this.mealPrice, this.mealImage});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.0.w),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CachedNetworkImageShare(
                    baseImageUrl+mealImage, 55, 78, 8),
                CustomText(
               mealName,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
                Row(
                  children: [
                    CustomText(
                     mealPrice,
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
                GestureDetector(
                    onTap: onTap,
                    child: CustomSvgImage(imageName:'addToCart',height: 50.h,width: 50.w,))


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
