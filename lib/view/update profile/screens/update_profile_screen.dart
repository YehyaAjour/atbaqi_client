import 'package:atbaqi_client/apis/profile_apis.dart';
import 'package:atbaqi_client/controllers/profile_controller.dart';
import 'package:atbaqi_client/core/utils/app_imports.dart';
import 'package:atbaqi_client/core/utils/constants.dart';
import 'package:atbaqi_client/core/widgets/cached_network_image.dart';
import 'package:atbaqi_client/core/widgets/custom_button.dart';
import 'package:atbaqi_client/core/widgets/custom_text_form_field.dart';

class UpdateProfileScreen extends StatelessWidget {
  ProfileController profileController = Get.find();
  GlobalKey<FormState> formStateEdit = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      child: SafeArea(
        child: Form(
          key: formStateEdit,
          child: Scaffold(
            backgroundColor: AppColors.primaryColor,
            body: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 15.w),
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ],
                ),
                CustomText(
                  "تعديل الملف الشخصي",
                  color: AppColors.whiteColor,
                  fontSize: 20.sp,
                ),
                SizedBox(
                  height: 25.h,
                ),
                Expanded(
                  child: Container(
                    width: Get.width,
                    height: Get.height,
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.r),
                            topRight: Radius.circular(15.r))),
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Obx(
                        () => profileController.getProfileData == null
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  GestureDetector(
                                    onTap: () => profileController.addImage(),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CachedNetworkImageShare(
                                            baseImageUrl +
                                                    profileController
                                                        .getProfileData
                                                        .value
                                                        .profile[0]
                                                        .image ??
                                                "",
                                            50,
                                            50,
                                            0),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        CustomText(
                                          "تغير الشعار ",
                                          fontSize: 16.sp,
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25.h,
                                  ),
                                  CustomTextFormField(
                                      topTitle: "الاسم ",
                                      hint: profileController.getProfileData
                                              .value.profile[0].name ??
                                          "",
                                      onSaved: profileController.setName),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  CustomTextFormField(
                                    topTitle: "رقم الجوال",
                                    hint: profileController.getProfileData.value
                                            .profile[0].phone ??
                                        "",
                                    onSaved: profileController.setPhoneNumber,
                                  ),
                                  SizedBox(height: 100.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomButton(
                                        title: "حفظ",
                                        onTap: () {
                                          formStateEdit.currentState.save();
                                          ProfileApis.profileApis.updateProfile(
                                            profileController.phone,
                                            profileController.name,
                                            // profileController.profilePicture
                                          );
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
