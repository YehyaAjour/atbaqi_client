import 'package:atbaqi_client/controllers/app_controller.dart';
import 'package:atbaqi_client/core/value/colors.dart';
import 'package:atbaqi_client/core/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/widgets/custom_image.dart';

class CustomNavBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      init: AppController(),
      builder: (controller) => BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.white,
        currentIndex: controller.indexScreen,
        onTap: controller.setIndexScreen,
        showSelectedLabels: false,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        items: [
          BottomNavigationBarItem(
            activeIcon: Column(
              children: [
                CustomSvgImage(
                  imageName: 'home',
                  height: 24.h,
                  width: 24.w,
                  color: AppColors.primaryColor,
                ),
                SizedBox(
                  height: 5.h,
                ),
                CustomText(
                  "الرئيسة",
                  fontSize: 14.sp,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w400,
                )
              ],
            ),
            icon: Column(
              children: [
                CustomSvgImage(
                  imageName: 'home',
                  height: 24.h,
                  width: 24.w,
                  color: AppColors.borderColor,
                ),
                SizedBox(
                  height: 5.h,
                ),
                CustomText(
                  "الرئيسة",
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: AppColors.borderColor,
                )
              ],
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            activeIcon: Column(
              children: [
                CustomSvgImage(
                  imageName: 'cart',
                  height: 21.h,
                  width: 21.w,
                  color: AppColors.primaryColor,
                ),
                SizedBox(
                  height: 5.h,
                ),
                CustomText(
                  "السلة",
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: AppColors.primaryColor,
                )
              ],
            ),
            icon: Column(
              children: [
                CustomSvgImage(
                  imageName: 'cart',
                  height: 21.h,
                  width: 21.w,
                  color: AppColors.borderColor,
                ),
                SizedBox(
                  height: 5.h,
                ),
                CustomText(
                  "السلة ",
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: AppColors.borderColor,
                )
              ],
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            activeIcon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomSvgImage(
                  imageName: 'favorite',
                  height: 24.h,
                  width: 24.w,
                  color: AppColors.primaryColor,
                ),
                SizedBox(
                  height: 5.h,
                ),
                CustomText(
                  "المفضلة",
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: AppColors.primaryColor,
                )
              ],
            ),
            icon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomSvgImage(
                  imageName: 'favorite',
                  height: 24.h,
                  width: 24.w,
                  color: AppColors.borderColor,
                ),
                SizedBox(
                  height: 5.h,
                ),
                CustomText(
                  "المفضلة",
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: AppColors.borderColor,
                )
              ],
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            activeIcon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomSvgImage(
                  imageName: 'profile',
                  height: 24.h,
                  width: 24.w,
                  color: AppColors.primaryColor,
                ),
                SizedBox(
                  height: 5.h,
                ),
                CustomText(
                  "الملف الشخصي",
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: AppColors.primaryColor,
                )
              ],
            ),
            icon: Column(
              children: [
                CustomSvgImage(
                  imageName: 'profile',
                  height: 24.h,
                  width: 24.w,
                  color: AppColors.borderColor,
                ),
                SizedBox(
                  height: 5.h,
                ),
                CustomText(
                  "الملف الشخصي",
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: AppColors.borderColor,
                )
              ],
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}
