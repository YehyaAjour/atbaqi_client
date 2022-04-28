import '../utils/app_imports.dart';
import 'custom_image.dart';

class CustomAppBar extends StatelessWidget {
final String title;

  const CustomAppBar({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 11.h),
      alignment: Alignment.bottomCenter,
      height: 100.h,
      width: Get.width,
      decoration: BoxDecoration(color: AppColors.primaryColor),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10.0.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: CustomSvgImage(
                imageName: "menu",
                width: 24.w,
                height: 18.h,
                color: Colors.white,
              ),
            ),
            CustomText(
              title,
              color: Colors.white,
            ),

            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications,
                  color: AppColors.whiteColor,
                )),
          ],
        ),
      ),
    );
  }
}
