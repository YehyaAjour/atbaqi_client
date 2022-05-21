import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../models/all_order_model.dart';
import '../models/order_details_model.dart';
import '../models/order_status_model.dart';

class OrderController extends GetxController{
   Rx<AllOrderModel> getAllOrderListData = AllOrderModel().obs;
   Rx<OrderDetailsModel> getOrderDetailsData = OrderDetailsModel().obs;
   Rx<OrderStatusModel> getOrderStatusData = OrderStatusModel().obs;
}