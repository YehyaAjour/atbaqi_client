
import '../../../core/utils/app_imports.dart';

class ProfileItem extends StatelessWidget {
  final String title;
  final Function onTap;
  final Widget widget;

  const ProfileItem({this.title, this.onTap, this.widget});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: GestureDetector(
            onTap: onTap,
            child: Row(
              children: [
                CustomText(
                  title ?? "",
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                ),
                Spacer(),
                widget ??
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 20.h,
                    )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        Divider(),
        SizedBox(
          height: 15.h,
        ),
      ],
    );
  }
}
