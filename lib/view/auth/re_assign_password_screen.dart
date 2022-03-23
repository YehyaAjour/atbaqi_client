
import '../../../apis/auth_apis.dart';
import '../../../controllers/auth_controller.dart';
import '../../core/utils/app_imports.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_image.dart';
import '../../core/widgets/custom_text.dart';
import '../../core/widgets/custom_text_form_field.dart';
import 'login_screen.dart';

class ReAssignPasswordScreen extends StatelessWidget {
  int code;
  ReAssignPasswordScreen({@required this.code});
  GlobalKey<FormState> reAssignPasswordStateLogin = GlobalKey<FormState>();
  AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomPngImage(
              height: 200,
              width: MediaQuery.of(context).size.width,
              imageName: 'login',
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  'إعادة تعيين كلمة المرور',
                  fontSize: 20,
                  fontFamily: 'din',
                ),
              ],
            ),
            SizedBox(
              height: 46,
            ),
            Form(
              key: reAssignPasswordStateLogin,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    CustomTextFormField(
                      onSaved: authController.setPasswordRa,
                      validator: authController.validationPasswordRa,
                        textInputType: TextInputType.visiblePassword,
                        topTitle: 'كلمة المرور',
                       isPassword: true,

                        ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTextFormField(
                      onSaved: authController.setConfirmPasswordRa,
                      validator: authController.validationConfirmPasswordRa,
                      textInputType: TextInputType.visiblePassword,
                      topTitle: 'تأكيد كلمة المرور',
                      isPassword: true,
                        ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 121,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w),
              child: CustomButton(
                title: 'حفظ',
                onTap: () {

                  if (reAssignPasswordStateLogin.currentState.validate()) {
                    reAssignPasswordStateLogin.currentState.save();
                    AuthApis.authApis.reAssignPassword(
                        code.toString(),authController.passwordRa,authController.confirmPasswordRa);
                    // Get.offAll(LoginScreen());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
