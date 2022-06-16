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
          Obx(
            () => Expanded(
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
                    orderController.getOrderDetailsData.value.status == null
                        ? Helper.loading()
                        : GetBuilder<AppController>(
                            id: 'indexEstates',
                            init: AppController(),
                            builder: (controller) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  orderController.getOrderDetailsData.value
                                                  .orderStatus.status ==
                                              'rejected' ||
                                          orderController.getOrderDetailsData
                                                  .value.orderStatus.status ==
                                              'cancelled'
                                      ? OrderRejected()
                                      : StepperRealEstates(orderController
                                                  .getOrderDetailsData
                                                  .value
                                                  .orderStatus
                                                  .status ==
                                              'pending'
                                          ? 0
                                          : orderController
                                                      .getOrderDetailsData
                                                      .value
                                                      .orderStatus
                                                      .status ==
                                                  'processing'
                                              ? 1
                                          : orderController
                                                  .getOrderDetailsData.value
                                                  .orderStatus.status=='delivery'?2
                                              : orderController
                                                              .getOrderDetailsData
                                                              .value
                                                              .orderStatus
                                                              .status ==
                                                          'completed' ||
                                                      orderController
                                                              .getOrderDetailsData
                                                              .value
                                                              .orderStatus
                                                              .status ==
                                                          'accepted'
                                                  ? 3
                                                  : 0),
                                  orderController.getOrderDetailsData.value
                                              .orderStatus.status ==
                                          'pending'
                                      ? WaitForFamilyAcceptOrder(orderController
                                          .getOrderDetailsData
                                          .value
                                          .orderStatus
                                          .id
                                          .toString())
                                      : orderController.getOrderDetailsData
                                                  .value.orderStatus.status ==
                                              'processing'
                                          ? OrderInProggress(orderController
                                              .getOrderDetailsData
                                              .value
                                              .orderStatus
                                              .family
                                              .id
                                              .toString())
                                          // : value == 'processing'
                                          // ? OrderPrepared()
                                          : orderController
                                                          .getOrderDetailsData
                                                          .value
                                                          .orderStatus
                                                          .status ==
                                                      'completed' ||
                                                  orderController
                                                          .getOrderDetailsData
                                                          .value
                                                          .orderStatus
                                                          .status ==
                                                      "delivery"|| orderController
                                                          .getOrderDetailsData
                                                          .value
                                                          .orderStatus
                                                          .status ==
                                                      "accepted"
                                              ? OrderReceived(orderController.getOrderDetailsData.value.orderStatus.status, orderController.getOrderDetailsData.value.orderStatus.id.toString())
                                              : orderController.getOrderDetailsData.value.orderStatus.status == 'cancelled'
                                                  ? Center(
                                                      child: CustomText(
                                                          'تم الغاء الطلب من قبل المستخدم'),
                                                    )
                                                  :orderController.getOrderDetailsData.value.orderStatus.status == 'rejected'?Center(
                                                      child: CustomText(
                                                          'تم الغاء الطلب من قبل الأسرة'),
                                                    ): Container(),
                                ],
                              );
                            },
                          ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
