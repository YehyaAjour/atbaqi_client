import '../../../controllers/app_controller.dart';
import '../../../core/utils/app_imports.dart';

class AddToCartButton extends StatelessWidget {
  final int currentQuantity;
  final String price;
  final Function onPressedAddToCart;
  final Function onIncreaseIconPressed;
  final Function onDecreaseIconPressed;

  const AddToCartButton(
      {this.currentQuantity,
      this.price,
      this.onPressedAddToCart,
      this.onIncreaseIconPressed,
      this.onDecreaseIconPressed});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              'الكمية:',
              color: Colors.black,
              fontSize: 18.sp,
            ),
            SizedBox(
              width: 20.w,
            ),
            IconButton(
              onPressed: onIncreaseIconPressed,
              icon: Icon(
                Icons.add_circle,
                color: AppColors.primaryColor,
                size: 30,
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            CustomText(
              '${currentQuantity}',
              color: Colors.black,
              fontSize: 18.sp,
            ),
            SizedBox(
              width: 20.w,
            ),
            IconButton(
              onPressed:onDecreaseIconPressed,
              icon: Icon(
                Icons.remove_circle,
                color: Colors.grey,
                size: 30,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: onPressedAddToCart,
              child: Container(
                width: 230.w,
                height: 50.h,
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10.r)),
                child: Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: 25.0.w, vertical: 4.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        'إضافة إلى السلة',
                        color: Colors.white,
                        fontSize: 16.sp,
                      ),
                      VerticalDivider(
                        color: Colors.white,
                        width: 1,
                        thickness: 2,
                      ),
                      Row(
                        children: [
                          CustomText(
                            '${currentQuantity * int.parse(price)}',
                            color: Colors.white,
                            fontSize: 16.sp,
                          ),
                          CustomText(
                            ' شيكل',
                            color: Colors.white,
                            fontSize: 16.sp,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
