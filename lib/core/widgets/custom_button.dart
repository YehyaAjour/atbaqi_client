import 'dart:ui';

import '../utils/app_imports.dart';
import '../utils/helper.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function onTap;
  final double width;
  final double height;
  final Color btnColor;
  final double borderRadious;
  final Color titleColor;

  CustomButton(
      {this.title,
      this.onTap,
      this.width,
      this.height,
      this.btnColor,
      this.borderRadious,
      this.titleColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
          border: Border.all(color: AppColors.primaryColor),
          color: btnColor ?? AppColors.primaryColor,
          borderRadius: borderRadious != null
              ? BorderRadius.circular(borderRadious)
              : Helper.appRaduis,
        ),
        child: Center(
          child: CustomText(
            title ?? "",
            fontSize: 20.sp,
            color: titleColor??AppColors.whiteColor,
          ),
        ),
      ),
    );
  }
}
