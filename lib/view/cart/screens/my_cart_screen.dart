import 'package:atbaqi_client/controllers/cart_controller.dart';
import 'package:atbaqi_client/core/widgets/custom_button.dart';

import '../../../core/utils/app_imports.dart';
import '../../../core/utils/helper.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/custom_image.dart';
import '../widget/cart_item.dart';

class MyCartScreen extends StatelessWidget {
  CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              CustomAppBar(title: 'السلة',),
              SizedBox(
                height: 40.h,
              ),
              Obx(() => cartController.getCartListData.value.status == null
                  ? Helper.loading()
                  : cartController.getCartListData.value.cartItems.length == 0
                  ? CustomText(
                "لا يوجد عناصر في السلة لعرضها",
                fontSize: 14.sp,
              )
                  : Expanded(
                    child: ListView.builder(
                      itemCount: cartController
                          .getCartListData.value.cartItems.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        var value = cartController.getCartListData.value.cartItems[index];
                        return CartItem(
                            onTap: () {},
                            mealImage: value.meals.image,
                            mealName: value.meals.name,
                            mealPrice: value.meals.price,
                            mealQuantity: value.quantity.toString());
                      },

                    ),
                  )),

              SizedBox(height: 20.h,),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText('السعر',fontSize: 18.sp,),
              CustomText(
                ' 30 ' + 'شيكل',
                fontSize: 18.sp,
                color: AppColors.primaryColor,
              )
            ],
          ),
        ),
        SizedBox(height: 20.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(title: 'التالي',),
          ],
        ),
        SizedBox(height: 20.h,)
      ],
    );
  }
}
