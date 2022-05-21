import 'package:atbaqi_client/apis/cart_apies.dart';
import 'package:atbaqi_client/apis/order_apis.dart';
import 'package:atbaqi_client/controllers/cart_controller.dart';
import 'package:atbaqi_client/core/widgets/custom_button.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lottie/lottie.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:lottie/lottie.dart';

import '../../../core/utils/app_imports.dart';
import '../../../core/utils/helper.dart';
import '../../../core/widgets/custom_app_bar.dart';
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
              CustomAppBar(
                title: 'السلة',
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset('assets/images/swipe_right.json',
                      width: 30, height: 30),
                  CustomText(
                    'مرر إلى اليمين للحذف',
                    fontSize: 12.sp,
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
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
                              var value = cartController
                                  .getCartListData.value.cartItems[index];
                              return Slidable(
                                
                                actionPane: SlidableDrawerActionPane(),
                                actions: [
                                  IconSlideAction(
                                    caption: 'حذف',
                                    icon: Icons.delete,
                                    color: AppColors.red,
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (ctx) => AlertDialog(
                                          title: Text("تأكيد الحذف"),
                                          content: Text(
                                              "هل أنت متأكد من حذف الطبق؟"),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () {
                                                CartApis.cartApis
                                                    .removeFromCart(value
                                                        .meals.id
                                                        .toString());
                                                Navigator.of(ctx).pop();
                                              },
                                              child: CustomText(
                                                "تأكيد",
                                                color: AppColors.primaryColor,
                                                fontSize: 16.sp,
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(ctx).pop();
                                              },
                                              child: CustomText(
                                                "إلغاء",
                                                fontSize: 16.sp,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  )
                                ],
                                child: CartItem(
                                    onTap: () {},
                                    mealImage: value.meals.image,
                                    mealName: value.meals.name,
                                    mealPrice: value.meals.price,
                                    mealQuantity: value.quantity.toString()),
                              );
                            },
                          ),
                        )),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
       Obx(() => cartController.getCartListData.value.cartItems.length >0? Column(
         children: [
           Padding(
             padding: EdgeInsets.symmetric(horizontal: 20.0.w),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 CustomText('السعر',fontSize: 18.sp,),
                 CustomText(
                 '' + ' شيكل ',
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
               CustomButton(title: 'التالي',onTap: (){
                 showDialog(
                   context: context,
                   builder: (ctx) => AlertDialog(
                     title: CustomText("تأكيد الطلب"),
                     content: Text("هل أنت متأكد من إرسال الطلب إلى الأسرة؟"),
                     actions: <Widget>[
                       TextButton(
                         onPressed: () {
                           OrderApis.orderApis.createOrder('gaza');
                           Get.back();
                         },
                         child: CustomText("تأكيد",color: AppColors.green,fontSize: 16.sp,),

                       ),TextButton(
                         onPressed: () {
                           Get.back();
                         },
                         child: CustomText("إلغاء",fontSize: 16.sp,),
                       ),
                     ],
                   ),
                 );
               },),
             ],
           ),
         ],
       ):SizedBox()),
        SizedBox(height: 20.h,)
      ],
    );
  }
}
