
import '../../../core/utils/app_imports.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final Widget widget;
  final Function onTap;

  DrawerItem({this.title, this.widget, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            children: [
              widget,
              SizedBox(
                width: 10.w,
              ),
              CustomText(
                title ?? "",
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Divider(),
          SizedBox(
            height: 15.h,
          ),
        ],
      ),
    );
  }
}
