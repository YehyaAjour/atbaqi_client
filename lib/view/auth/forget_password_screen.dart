
import 'package:atbaqi_client/core/widgets/custom_image.dart';

import '../../apis/auth_apis.dart';
import '../../controllers/auth_controller.dart';
import '../../core/utils/app_imports.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_text.dart';
import '../../core/widgets/custom_text_form_field.dart';
import 'confirm_forget_password_screen.dart';

class ForgetPasswordScreen extends StatelessWidget {
  GlobalKey<FormState> formStateForgetPassword = GlobalKey<FormState>();
  AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 100.h,),
            CustomSvgImage(
              height: 200,
              width: MediaQuery.of(context).size.width,
              imageName: 'signin',
            ),
            SizedBox(
              height: 34.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  'نسيت كلمة المرور',
                  fontSize: 20.sp,
                ),
              ],
            ),
            SizedBox(
              height: 46,
            ),
            Form(
              key: formStateForgetPassword,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: CustomTextFormField(
                  textInputType: TextInputType.emailAddress,
                  topTitle: 'البريد الإلكتروني',
                  onSaved: authController.setEmail,
                  validator: authController.validationEmail,
                ),
              ),
            ),
            SizedBox(
              height: 93,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              CustomButton(
                      title: 'إرسال',
                      onTap: () {
                        if (formStateForgetPassword.currentState.validate()) {
                          formStateForgetPassword.currentState.save();
                          AuthApis.authApis
                              .forgetPassword(authController.email);
                          Get.to(() => Obx(
                            () {
                              return ConfirmForgetPasswordScreen(
                                code: authController
                                    .getForgetPasswordData.value.code,
                              );
                            },
                          ));
                        }
                      },
                    )


              ],
            ),
          ],
        ),
      ),
    );
  }
}
