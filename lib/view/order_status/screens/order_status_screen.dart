import 'package:atbaqi_client/controllers/app_controller.dart';
import 'package:atbaqi_client/core/value/colors.dart';
import 'package:atbaqi_client/view/order_status/widget/order_prepared.dart';
import 'package:atbaqi_client/view/order_status/widget/order_received.dart';
import 'package:flutter/material.dart';

import '../../../controllers/order_controller.dart';
import '../../../core/utils/app_imports.dart';
import '../../../core/utils/helper.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_image.dart';
import '../../my_order/widget/order_details_item.dart';
import '../widget/order_in_proggress.dart';
import '../widget/order_rejected.dart';
import '../widget/stepper.dart';
import '../widget/wait_for_family_accept_order.dart';

class OrderStatusScreen extends StatefulWidget {
  @override
  State<OrderStatusScreen> createState() => _OrderStatusScreenState();
}

class _OrderStatusScreenState extends State<OrderStatusScreen> {
  OrderController orderController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        children: [
          SizedBox(
            height: 56.h,
          ),
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 17.0.w),
              child: Row(
                children: [
                  CustomSvgImage(
                    imageName: 'cancel',
                    width: 24.w,
                    height: 24.h,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 21.h,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(20),
                    topEnd: Radius.circular(20),
                  )),
              child: Column(
                children: [
                  SizedBox(
                    height: 21.h,
                  ),
                  CustomText(
                    'حالة الطلب',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'din',
                  ),
                  SizedBox(
                    height: 37.h,
                  ),
                  GetBuilder<AppController>(
                    id: 'indexEstates',
                    init: AppController(),
                    builder: (controller) {
                      var value =
                          orderController.getOrderStatusData.value.orderStatus;
                      return Column(
                        children: [
                         value == 'rejected'?OrderRejected()
                             : StepperRealEstates(
                              value == 'pending' ? 0
                                  : value == 'processing' ? 1
                              // : value == 'processing' ? 2
                                  : value == 'completed' ? 3
                                  : 0),
                          value == 'pending'
                              ? WaitForFamilyAcceptOrder()
                              : value == 'processing'
                              ? OrderInProggress()
                          // : value == 'processing'
                          // ? OrderPrepared()
                              : value == 'completed'
                              ? OrderReceived()
                              : CustomText('تم رفض الطلب'),
                        ],
                      );
                    },
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
