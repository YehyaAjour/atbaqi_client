import 'package:atbaqi_client/core/utils/constants.dart';
import 'package:atbaqi_client/view/cart/screens/my_cart_screen.dart';
import 'package:atbaqi_client/view/main%20screen/Screens/main_screen.dart';

import '../../../apis/cart_apies.dart';
import '../../../controllers/app_controller.dart';
import '../../../controllers/home_controller.dart';
import '../../../core/utils/app_imports.dart';
import '../../../core/widgets/cached_network_image.dart';
import '../../familymeals/screens/family_details_screen.dart';
import '../widget/add_to_cart_button.dart';

class MealDetailsScreen extends StatelessWidget {
  final String categoryName;
  final String mealId;
  final String mealName;
  final String numberPerson;
  final String description;
  final String image;
  final String price;
  HomeController homeController = Get.find();

  MealDetailsScreen(
      {this.categoryName,
      this.mealName,
      this.numberPerson,
      this.description,
      this.image,
      this.price,
      this.mealId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => Get.back(), child: Icon(Icons.arrow_back)),
        backgroundColor: AppColors.primaryColor,
        elevation: 0.0,
        centerTitle: true,
        title: CustomText(
          "تفاصيل الطبق",
          color: AppColors.whiteColor,
          fontSize: 18.sp,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 34.h,
            ),
            Row(
              children: [
                CachedNetworkImageShare(baseImageUrl + image, 98, 135, 1),
                SizedBox(
                  width: 14.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      mealName??'',
                      fontSize: 18.sp,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    CustomText(
                     categoryName!=null? 'التصنيف: ' + categoryName:'',
                      fontSize: 18.sp,
                      color: AppColors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        CustomText(
                          "يكفي ل ",
                          fontSize: 18.sp,
                          color: AppColors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                        CustomText(
                          numberPerson??'',
                          fontSize: 18.sp,
                          color: AppColors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        CustomText(
                          "أشخاص",
                          fontSize: 18.sp,
                          color: AppColors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        CustomText(
                          price??'',
                          fontSize: 18.sp,
                          color: AppColors.primaryColor,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        CustomText(
                          "شيكل",
                          fontSize: 18.sp,
                          color: AppColors.primaryColor,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 60.h,
            ),
            CustomText(
              "وصف الطبق ",
              fontSize: 20.sp,
            ),
            SizedBox(
              height: 15.h,
            ),
            Container(
              constraints: BoxConstraints(maxWidth: 331.w),
              child: CustomText(
                description,
                fontSize: 14.sp,
                color: AppColors.grey,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 150.h,
            ),
            GetBuilder<AppController>(
              init: AppController(),
              builder: (controller)=>AddToCartButton(
                currentQuantity: controller.currentQuantity,
                price: price,
                onIncreaseIconPressed: (){controller.increaseCurrentQuantity();},
                onDecreaseIconPressed: (){controller.decreaseCurrentQuantity();},
                onPressedAddToCart: () async {
                 await CartApis.cartApis.addToCart(mealId, controller.currentQuantity.toString());

                },
              ),

            )
          ],
        ),
      ),
    );
  }
}
