import '../../../controllers/order_controller.dart';
import '../../../core/utils/app_imports.dart';
import '../../../core/utils/helper.dart';
import '../widget/order_details_item.dart';

class OrderDetailsScreen extends StatelessWidget {
  OrderController orderController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        title: CustomText(
          'تفاصيل الطلب',
          fontSize: 20.sp,
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 59.h,
          ),
          Obx(() => orderController.getOrderDetailsData.value.status == null
              ? Helper.loading()
              : orderController
                          .getOrderDetailsData.value.orderStatus.orderItems ==
                      0
                  ? CustomText(
                      "لا تتوفر وجبات لعرضها",
                      fontSize: 14.sp,
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemCount: orderController.getOrderDetailsData.value
                            .orderStatus.orderItems.length,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          var value = orderController.getOrderDetailsData.value
                              .orderStatus.orderItems[index];
                          return OrderDetailsItem(
                            itemName: value.meal.name,
                            price: value.meal.price,
                            imgUrl: value.meal.image,
                            category: value.meal.categoryId,
                            quantity: value.quantity.toString(),
                          );
                        },
                      ),
                    )),
        ],
      ),
    );
  }
}
