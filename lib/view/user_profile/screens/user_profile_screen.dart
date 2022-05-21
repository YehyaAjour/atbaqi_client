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
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
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
                                'الحساب الشخصي',
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
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 15.w,
                              ),
                              CustomSvgImage(
                                  imageName: 'chat', width: 29.w, height: 29.h),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -15,
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
                                              .profiles[0].image ??
                                      '',
                                  80,
                                  80,
                                  0),
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
                        GestureDetector(
                          onTap: () {
                            print(value.profiles[0].name);
                          },
                          child: CustomText(
                            value.profiles[0].name ?? "",
                            fontSize: 18.sp,
                            color: AppColors.red,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Center(
                          child: CustomText(
                            value.profiles[0].phone ?? "",
                            fontSize: 18.sp,
                            color: AppColors.primaryColor,
                          ),
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
            // Column(
            //   children: [
            //     SizedBox(
            //       height: 50.h,
            //     ),
            //     ProfileItem(
            //       onTap: () {
            //         // Get.to(() => ClientCommentScreen());
            //       },
            //       title: "طلباتي ",
            //     ),
            //     SizedBox(
            //       height: 20.h,
            //     ),
            //     // ProfileItem(
            //     //   onTap: () {
            //     //     // Get.to(() => ClientCommentScreen());
            //     //   },
            //     //   title: "إدارة الحساب/العنوان ",
            //     // ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
