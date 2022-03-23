import 'package:flutter/cupertino.dart';

import '../../apis/auth_apis.dart';
import '../../controllers/auth_controller.dart';
import '../../core/utils/app_imports.dart';
import '../../core/value/colors.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_image.dart';
import '../../core/widgets/custom_text.dart';
import '../../core/widgets/custom_text_form_field.dart';
import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  GlobalKey<FormState> formStateRegister = GlobalKey<FormState>();
  AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        body: SingleChildScrollView(
          child: GetBuilder<AuthController>(
              init: AuthController(),
              id: "image",
              builder: (controller) {
                return Form(
                  key: formStateRegister,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomPngImage(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        imageName: 'register',
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            'تسجيل حساب',
                            fontSize: 20,
                            fontFamily: 'din',
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      TabBar(
                        isScrollable: true,
                        onTap: (index) {},
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        indicatorColor: const Color(0xffFFCB00),
                        tabs: [
                          Tab(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.w),
                              child: CustomText(
                                'مستخدم جديد',
                                color: AppColors.primaryColor,
                                fontSize: 22.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            CustomTextFormField(
                              topTitle: 'رقم الهاتف',
                              textInputType: TextInputType.phone,
                              onSaved: authController.setPhone,
                              validator: authController.validationPhoneNumberR,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            CustomTextFormField(
                              topTitle: 'البريد الإلكتروني',
                              onSaved: authController.setEmail,
                              validator: authController.validationEmail,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            CustomTextFormField(
                              topTitle: 'الإسم',
                              onSaved: authController.setName,
                              validator: authController.validationName,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            CustomText(
                              'الصورة/الشعار',
                              fontSize: 18.sp,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            GestureDetector(
                              onTap: () {
                                print("EEE");
                                controller.addImage();
                              },
                              child: controller.profilePicture == null
                                  ? Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.borderColor),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                width: 97,
                                height: 62,
                                child: Center(child: Icon(Icons.image)),
                              )
                                  : Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.borderColor),
                                    borderRadius:
                                    BorderRadius.circular(8),
                                    image: DecorationImage(
                                        image: FileImage(
                                          controller.profilePicture,
                                        ))),
                                width: 97,
                                height: 62,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            CustomTextFormField(
                              topTitle: "كلمة المرور",
                              onSaved: authController.setPasswordR,
                              validator: authController.validationPasswordR,

                              // textInputType: TextInputType.visiblePassword,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            CustomTextFormField(
                              topTitle: "تأكيد كلمة المرور",
                              onSaved: authController.setConfirmPassword,
                              validator:
                                  authController.validationConfirmPassword,
                              // textInputType: TextInputType.visiblePassword,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomButton(
                                  title: 'تسجيل',
                                  onTap: () {
                                    if (formStateRegister.currentState
                                        .validate()) {
                                      formStateRegister.currentState.save();
                                      AuthApis.authApis.register(
                                        authController.phone,
                                        authController.email,
                                        authController.name,
                                        authController.profilePicture,
                                        authController.passwordR,
                                        authController.confirmPassword,
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            'لديك حساب',
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                          ),
                          TextButton(
                              onPressed: () {
                                Get.to(() => LoginScreen());
                              },
                              child: CustomText(
                                'تسجيل دخول',
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: const Color(0xffFFCB00),
                                underline: true,
                              )),
                        ],
                      )
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
