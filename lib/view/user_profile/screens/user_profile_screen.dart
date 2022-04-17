import 'package:atbaqi_client/core/value/colors.dart';
import 'package:atbaqi_client/core/widgets/custom_image.dart';
import 'package:atbaqi_client/view/update%20profile/screens/update_profile_screen.dart';

import '../../../controllers/profile_controller.dart';
import '../../../core/utils/app_imports.dart';
import '../../../core/utils/constants.dart';
import '../../../core/utils/helper.dart';
import '../../../core/widgets/cached_network_image.dart';
import '../widgets/profile_item.dart';

class UserProfileScreen extends StatelessWidget {
  ProfileController profileController = Get.find();
  @override
  Widget build(BuildContext context) {
    var value = profileController.getProfileData.value;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 183.0.h,
              child: Stack(
                children: <Widget>[
                  Container(
                    color: AppColors.primaryColor,
                    width: MediaQuery.of(context).size.width,
                    height: 132.0.h,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () => Get.back(),
                                child: Icon(
                                  Icons.arrow_back,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                              Center(
                                  child: CustomText(
                                'الحساب الشخصي',
                                fontSize: 20.sp,
                                fontFamily: 'din',
                                color: Colors.white,
                              )),
                              Container(),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.0.w),
                          child: Row(
                            children: [
                              CustomSvgImage(
                                  imageName: 'chat', width: 29.w, height: 29.h),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 90.0.h,
                    left: 0.0,
                    right: 0.0,
                    child: Column(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            GestureDetector(
                              onTap: () => Get.to(() => UpdateProfileScreen()),
                              child: CachedNetworkImageShare(
                                  baseImageUrl +
                                      profileController.getProfileData.value
                                          .profile[0].image,
                                  80,
                                  80,
                                  0
                                  // "$baseImageUrl" + "${value.profile[0].image}" ?? "", 80, 80, 0
                                  ),
                            ),
                            Positioned(
                              right: -10,
                              top: 10.h,
                              child: Container(
                                width: 36.w,
                                height: 18.h,
                                decoration: BoxDecoration(
                                  borderRadius: Helper.appRaduis,
                                  color: AppColors.whiteColor,
                                ),
                                child: Center(
                                  child: CustomText(
                                    "تعديل",
                                    fontSize: 12.sp,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomText(
                          value.profile[0].name ?? "",
                          fontSize: 18.sp,
                          color: AppColors.whiteColor,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomText(
                          value.profile[0].phone ?? "",
                          fontSize: 18.sp,
                          color: AppColors.whiteColor,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: Get.width,
                height: Get.height,
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                        topRight: Radius.circular(20.r))),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50.h,
                    ),
                    ProfileItem(
                      onTap: () {
                        // Get.to(() => ClientCommentScreen());
                      },
                      title: "طلباتي ",
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    // ProfileItem(
                    //   onTap: () {
                    //     // Get.to(() => ClientCommentScreen());
                    //   },
                    //   title: "إدارة الحساب/العنوان ",
                    // ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
