
import '../../../core/utils/app_imports.dart';

class StepperRealEstates extends StatelessWidget {
  final int index;
  List<String> titles = [
    'بانتظار\n موافقة الأسرة',
    "الطلب\n قيد التحضير",
    "الطلب\n قيد التوصيل ",
    "تم\n التحضير",
  ];

  //todo:two list: icons and text ;
  StepperRealEstates(
      this.index,
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
            4,
                (i) => Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 20.w,
                          height: 20.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index >= i
                                ? AppColors.primaryColor
                                : Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        CustomText(
                          titles[i],
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.center,
                          color: AppColors.black,
                        ),
                      ],
                    ),
                    i == 3
                        ? SizedBox()
                        : i == 0
                        ? Padding(
                      padding: EdgeInsets.only(bottom: 12.h),
                      child: Container(
                        width: 50.5.w,
                        height: 3.h,
                        decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(2100),
                          color: index >= i
                              ? AppColors.primaryColor
                              : AppColors.borderColor,
                        ),
                      ),
                    )
                        : Padding(
                      padding: EdgeInsets.only(bottom: 12.h),
                      child: Container(
                        width: 50.5.w,
                        height: 3.h,
                        decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(2100),
                          color: index >= i
                              ? AppColors.primaryColor
                              : AppColors.borderColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
