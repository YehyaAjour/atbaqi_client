import 'package:atbaqi_client/apis/order_apis.dart';
import 'package:atbaqi_client/core/services/firebase_chat.dart';
import 'package:atbaqi_client/core/value/colors.dart';
import 'package:atbaqi_client/core/widgets/custom_image.dart';
import 'package:atbaqi_client/view/messageAndChat/screens/messages_screen.dart';
import 'package:atbaqi_client/view/update%20profile/screens/update_profile_screen.dart';

import '../../../controllers/profile_controller.dart';
import '../../../core/utils/app_imports.dart';
import '../../../core/utils/constants.dart';
import '../../../core/utils/helper.dart';
import '../../../core/widgets/cached_network_image.dart';
import '../../my_order/screens/my_order_screen.dart';
import '../widgets/profile_item.dart';

class UserProfileScreen extends StatelessWidget {
  ProfileController profileController = Get.find();

  @override
  Widget build(BuildContext context) {
    var value = profileController.getProfileData.value;

    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => profileController.getProfileData.value.profiles == null
              ? Center(
                  child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ))
              : Column(
                  children: [
                    Container(
                      height: 250.0.h,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                      InkWell(
                                        onTap: () {
                                          FireBaseHelper.fireBaseHelper
                                              .getAllMyChats(
                                                  myId: profileController
                                                          .getProfileData
                                                          .value
                                                          .profiles[0]
                                                          .id
                                                          .toString() ??
                                                      "");
                                          Get.to(() => MyChatsScreen());
                                        },
                                        child: CustomSvgImage(
                                            imageName: 'chat',
                                            width: 29.w,
                                            height: 29.h),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  // Row(
                                  //   children: [
                                  //     SizedBox(
                                  //       width: 15.w,
                                  //     ),
                                  //   ],
                                  // ),
                                ],
                              ),
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
                                      onTap: () =>
                                          Get.to(() => UpdateProfileScreen()),
                                      child: CachedNetworkImageShare(
                                          baseImageUrl +
                                                  profileController
                                                      .getProfileData
                                                      .value
                                                      .profiles[0]
                                                      .image ??
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
                                CustomText(
                                  value.profiles[0].name ?? "",
                                  fontSize: 18.sp,
                                  color: AppColors.primaryColor,
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
                              onTap: () async {
                                OrderApis.orderApis.getAllOrderList();
                                Get.to(() => MyOrderScreen());
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
      ),
    );
  }
}
