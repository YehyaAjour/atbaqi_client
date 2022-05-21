import 'package:atbaqi_client/apis/order_apis.dart';
import 'package:atbaqi_client/models/order_status_model.dart';
import 'package:atbaqi_client/view/my_order/widget/order_details_item.dart';

import '../../../controllers/order_controller.dart';
import '../../../core/utils/app_imports.dart';
import '../../../core/utils/helper.dart';
import '../../../core/widgets/cached_network_image.dart';
import '../../../models/all_order_model.dart';
import '../../../models/order_details_model.dart';
import '../../order_status/screens/order_status_screen.dart';
import '../widget/all_my_order_item.dart';
import 'order_details_screen.dart';

class MyOrderScreen extends StatelessWidget {
  OrderController orderController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        title: CustomText(
          'طلباتي',
          fontSize: 20.sp,
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 59.h,
          ),
          Obx(() => orderController.getAllOrderListData.value.order == null
              ? Helper.loading()
              : orderController.getAllOrderListData.value.order.length == 0
                  ? CustomText(
                      "لم تقم باضافة اي طلب",
                      fontSize: 14.sp,
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemCount: orderController
                            .getAllOrderListData.value.order.length,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          var value = orderController
                              .getAllOrderListData.value.order[index];
                          return AllMyOrderItem(
                            order_status: value.status,
                            price: value.total,
                            orderNumber: value.id.toString(),
                            familyName: value.family.name,
                            onTap: (){
                              OrderApis.orderApis.getOrderStatus(value.id);
                              Get.to(OrderStatusScreen());
                              // orderController.getOrderDetailsData.value =
                              //     OrderDetailsModel.fromJson({});
                              // OrderApis.orderApis.getOrderDetails(value.id.toString());

                              // Get.to(OrderDetailsScreen());
                            },

                          );
                        },
                      ),
                    )),
        ],
      ),
    );
  }
}
