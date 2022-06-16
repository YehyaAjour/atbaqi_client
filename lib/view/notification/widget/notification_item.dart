
import '../../../core/utils/app_imports.dart';
import '../../../core/widgets/custom_image.dart';

class NotificationItem extends StatelessWidget {
  final dynamic value;

  NotificationItem({Key key, this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Row(
            children: [
              CustomPngImage(
                imageName: "notification",
                height: 35.h,
                width: 30.w,
              ),
              SizedBox(
                width: 15,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      value.data.title??value.data.type,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                      color: AppColors.primaryColor,
                    ),
                    CustomText(
                      value.data.message??value.data.description,
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
