import 'package:atbaqi_client/apis/home_apis.dart';
import 'package:atbaqi_client/controllers/home_controller.dart';
import 'package:atbaqi_client/core/utils/app_imports.dart';
import 'package:atbaqi_client/core/utils/helper.dart';
import 'package:atbaqi_client/core/value/colors.dart';
import 'package:atbaqi_client/core/widgets/custom_image.dart';
import 'package:atbaqi_client/core/widgets/custom_text.dart';
import 'package:atbaqi_client/view/all%20familes/screens/all_familes_screen.dart';
import 'package:atbaqi_client/view/homescreenlayout/widget/home_item.dart';
import 'package:flutter/material.dart';

import '../../../apis/auth_apis.dart';
import '../widget/drawer_widget.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: AppColors.whiteColor,
          leading: GestureDetector(
            onTap: () {
              _scaffoldKey.currentState.openDrawer();
            },
            child: Center(
              child: CustomSvgImage(
                imageName: "menu",
                width: 24.w,
                height: 18.h,
              ),
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications,
                  color: AppColors.primaryColor,
                )),
          ]),
      drawer: DrawerWidget(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 15.h,
          ),
          Container(
            width: Get.width,
            height: 40.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: AppColors.grey.withOpacity(0.23))),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: AppColors.grey.withOpacity(0.23),
                  ),
                  CustomText(
                    "قم بالبحث عن وجبتك المفضلة",
                    fontSize: 14.sp,
                    color: AppColors.grey.withOpacity(0.23),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              CustomText(
                "الأسر المنتجة",
                fontSize: 16.sp,
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  HomeApis.homeApis.getAllFamiles();
                  Get.to(() => AllFamiliesScreen());
                },
                child: Container(
                  width: 71.w,
                  height: 24.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(
                        color: Colors.orange,
                      )),
                  child: Center(
                      child: CustomText(
                    "عرض الكل",
                    fontSize: 14.sp,
                    color: AppColors.grey,
                  )),
                ),
              )
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          Obx(() => homeController.getHomeData.value.status == null
              ? Helper.loading()
              : homeController.getHomeData.value.familyHome.length == 0
                  ? CustomText(
                      "لا توجد اسر منتجة",
                      fontSize: 14.sp,
                    )
                  : Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        itemBuilder: (context, index) {
                          var model = homeController
                              .getHomeData.value.familyHome[index];
                          return HomeItem(
                            model: model,
                          );
                        },
                        itemCount:
                            homeController.getHomeData.value.familyHome.length,
                      ),
                    ))
        ]),
      ),
    );
  }
}
