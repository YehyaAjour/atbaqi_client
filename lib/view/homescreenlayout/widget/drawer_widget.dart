import '../../../apis/auth_apis.dart';
import '../../../apis/privacy_policy_apis.dart';
import '../../../controllers/app_controller.dart';
import '../../../controllers/auth_controller.dart';
import '../../../controllers/profile_controller.dart';
import '../../../core/utils/app_imports.dart';
import '../../../core/utils/constants.dart';
import '../../../core/widgets/cached_network_image.dart';
import '../../../core/widgets/custom_image.dart';
import '../../help and support/screens/help_and_support_screen.dart';
import '../../help and support/screens/privacy_policy_screen.dart';
import '../../main screen/Screens/main_screen.dart';
import '../../profile/screens/user_profile_screen.dart';
import 'drawer_item.dart';

class DrawerWidget extends StatelessWidget {
  ProfileController profileController = Get.find();
  AuthController authController = Get.find();
AppController appController =Get.find();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            SizedBox(
              height: 200.h,
            ),
            Obx(() {
              return profileController.getProfileData.value.status==null?SizedBox():
              DrawerItem(
                onTap: () async {
                  Get.back();
                  await appController.setIndexScreen(3);
                  Get.to(() => MainScreen());
                  Get.back();
                },
                widget:profileController
                    .getProfileData.value.status == null ? SizedBox():CachedNetworkImageShare(
                    baseImageUrl +
                        profileController
                            .getProfileData.value.profiles[0].image,
                    35.h,
                    35.w,
                    0.r),
                title:
                profileController.getProfileData.value.profiles[0].name ??
                    "",
              );
            }),


            DrawerItem(
              onTap: () {
                PrivacyPolicyApis(); // getAllPrivacyPolicy
                return Get.to(() => PrivacyPolicyScreen());
              },
              widget: CustomSvgImage(
                imageName: "security",
                height: 24.h,
                width: 24.w,
              ),
              title: "سياسة الخصوصية",
            ),
            // DrawerItem(
            //   onTap: () {},
            //   widget: CustomSvgImage(
            //     imageName: "term",
            //     height: 24.h,
            //     width: 24.w,
            //   ),
            //   title: "شروط الاستخدام ",
            // ),
            DrawerItem(
              onTap: () {
                Get.to(() => HelpAndSupportScreen());
              },
              widget: CustomSvgImage(
                imageName: "help",
                height: 24.h,
                width: 24.w,
              ),
              title: "مساعدة",
            ),
            SizedBox(
              height: 40.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomSvgImage(
                  imageName: "whatsapp",
                  height: 28.h,
                  width: 28.w,
                ),
                SizedBox(
                  width: 30.w,
                ),
                CustomSvgImage(
                  imageName: "snapchat",
                  height: 28.h,
                  width: 28.w,
                ),
                SizedBox(
                  width: 30.w,
                ),
                CustomSvgImage(
                  imageName: "call",
                  height: 28.h,
                  width: 28.w,
                ),
              ],
            ),
            SizedBox(
              height: 70.h,
            ),
            DrawerItem(
              onTap: () {
                AuthApis.authApis.logOut();
              },
              widget: CustomSvgImage(
                imageName: "logout",
                height: 24.h,
                width: 24.w,
              ),
              title: "تسجيل الخروج",
            ),
          ],
        ),
      ),
    );
  }
}
