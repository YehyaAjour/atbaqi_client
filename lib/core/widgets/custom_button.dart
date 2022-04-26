
import 'dart:ui';

import '../utils/app_imports.dart';
import '../utils/helper.dart';


class CustomButton extends StatelessWidget {
  final String title;
  final Function onTap;
  final double width;
  final double height;
  final Color btnColor;

  CustomButton(
      {this.title, this.onTap, this.width, this.height, this.btnColor});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: width ?? 335.w,
            height: height ?? 48.h,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color(0x29000000),
                  offset: Offset(0, 3),
                  blurRadius: 6,
                ),
              ],
              color: btnColor ?? AppColors.primaryColor,
              borderRadius: Helper.appRaduis,
            ),
            child: Center(
              child: CustomText(
                title ?? "",
                fontSize: 20.sp,
                color: AppColors.whiteColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
