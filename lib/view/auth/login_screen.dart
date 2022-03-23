import 'package:atbaqi_client/view/auth/register_screen.dart';

import '../../apis/auth_apis.dart';
import '../../controllers/auth_controller.dart';
import '../../core/utils/app_imports.dart';
import '../../core/value/colors.dart';
import '../../core/widgets/custom_image.dart';
import '../../core/widgets/custom_text.dart';
import '../../core/widgets/custom_text_form_field.dart';
import 'forget_password_screen.dart';

class LoginScreen extends StatelessWidget {
  GlobalKey<FormState> formStateLogin = GlobalKey<FormState>();
  AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0,backgroundColor: AppColors.primaryColor,),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 90.h,
                  ),
                  CustomSvgImage(
                    height: 181.h,
                    width: 227.w,
                    imageName: 'signin',
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        'تسجيل الدخول',
                        fontSize: 20.sp,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Form(
                      key: formStateLogin,
                      child: Column(
                        children: [
                          CustomTextFormField(
                            textInputType: TextInputType.phone,
                            topTitle: 'رقم الهاتف',
                            onSaved: authController.setPhoneNumber,
                            validator: authController.validationPhoneNumber,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          CustomTextFormField(
                            onSaved: authController.setPassword,
                            validator: authController.validationPassword,
                            topTitle: 'كلمة المرور',
                            isPassword: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 9.h,
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                               Get.to(()=>ForgetPasswordScreen());
                            },
                            child: CustomText(
                              'نسيت كلمة المرور؟',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.normal,
                              color: AppColors.primaryColor,
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        'ليس لديك حساب',
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      ),
                      TextButton(
                          onPressed: () {
                             Get.to(()=>RegisterScreen());
                          },
                          child: CustomText(
                            'تسجيل حساب',
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: AppColors.primaryColor,
                            underline: true,
                          )),
                    ],
                  ),

                ],
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: SizedBox(
              height: 48.h,
              width: 126.w,
              child: MaterialButton(
                onPressed: () {
                  if (formStateLogin.currentState.validate()) {
                    formStateLogin.currentState.save();
                    AuthApis.authApis.login(
                        authController.phoneNumber, authController.password);
                  }
                },
                color: AppColors.primaryColor,
                shape: const RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.only(topRight: Radius.circular(20)),
                ),
                child: Row(
                  children:const [
                    Icon(Icons.arrow_back_outlined,color: Colors.white,size: 30,),
                    Spacer(),
                    Text(
                      'دخول',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),


    );
  }
}
