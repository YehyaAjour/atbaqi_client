import '../../../apis/auth_apis.dart';
import '../../../controllers/auth_controller.dart';
import '../../../controllers/profile_controller.dart';
import '../../../core/utils/app_imports.dart';
import '../../../core/utils/constants.dart';
import '../../../core/widgets/cached_network_image.dart';
import '../../../core/widgets/custom_image.dart';
import '../../user_profile/screens/user_profile_screen.dart';
import 'drawer_item.dart';

class DrawerWidget extends StatelessWidget {
  ProfileController profileController = Get.find();
  AuthController authController = Get.find();

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
            DrawerItem(
              onTap: () {
                Get.to(() => UserProfileScreen());
              },
              widget: CachedNetworkImageShare(
                  baseImageUrl +
                      profileController.getProfileData.value.profile[0].image,
                  35.h,
                  35.w,
                  0.r),
              title:
                  profileController.getProfileData.value.profile[0].name ?? "",
            ),
            DrawerItem(
              onTap: () {
                //   PrivacyPolicyApis.privacyPolicyApis.getAboutUs();
                //   PrivacyPolicyApis.privacyPolicyApis.getTerms();
                //   PrivacyPolicyApis.privacyPolicyApis.getPrivacy();
                //
                // return  Get.to(() => PrivacyPolicyScreen());
              },
              widget: CustomSvgImage(
                imageName: "security",
                height: 24.h,
                width: 24.w,
              ),
              title: "سياسة الخصوصية",
            ),
            DrawerItem(
              onTap: () {},
              widget: CustomSvgImage(
                imageName: "term",
                height: 24.h,
                width: 24.w,
              ),
              title: "شروط الاستخدام ",
            ),
            DrawerItem(
              onTap: () {
                // Get.to(() => HelpAndSupportScreen());
              },
              widget: CustomSvgImage(
                imageName: "help",
                height: 24.h,
                width: 24.w,
              ),
              title: "مساعدة",
            ),
            DrawerItem(
              onTap: () {
                // Get.to(() => HelpAndSupportScreen());
              },
              widget: CustomSvgImage(
                imageName: "trackOrder",
                height: 24.h,
                width: 24.w,
              ),
              title: "تتبع الطلب",
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
