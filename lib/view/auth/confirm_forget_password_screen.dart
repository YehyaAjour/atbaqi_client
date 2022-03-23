
import 'package:atbaqi_client/view/auth/re_assign_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';

import '../../controllers/otp_controller.dart';
import '../../core/utils/app_imports.dart';
import '../../core/utils/helper.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_image.dart';
import '../../core/widgets/custom_text.dart';

class ConfirmForgetPasswordScreen extends StatelessWidget {
  int code;

  ConfirmForgetPasswordScreen({@required this.code});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder<OTPController>(
            init: OTPController(),
          builder: (controller) {
            return  Column(
              children: [
                CustomPngImage(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  imageName: 'register',
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      'نسيت كلمة المرور',
                      fontSize: 20,
                      fontFamily: 'din',
                    ),
                  ],
                ),
                SizedBox(
                  height: 28,
                ),
                Container(
                  width: 136,
                  child: CustomText(
                    'الرجاء إدخال الرمز الذي تلقيته على البريد',
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'din',
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 28,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PinEntryTextField(

                      showFieldAsBox: true,
                      onSubmit: (String pin) {
                        // controller.changeIsFinish();
                       if(code==int.parse(pin)){
                         Get.to(()=>ReAssignPasswordScreen(code: code,));
                       }else{
                         Helper.getSheetError(code.toString()+'الكود الذي أدخلته غير صحيح');
                       }

                      }, // end onSubmit
                    ), // end PinEntryTextField()
                  ), // end Padding()
                ),
                SizedBox(
                  height: 26,
                ),
                CustomText(
                  'لم تتلقى رمز؟',
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'din',
                ),
                TextButton(
                  onPressed: () {},
                  child: CustomText(
                    'إعادة إرسال',
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    underline: true,
                    color: Color(0xffFFCB00),
                    fontFamily: 'din',
                  ),
                ),
                SizedBox(
                  height: 93,
                ),
                controller.isFinish
                    ? CustomButton(
                  title: 'إرسال',
                  onTap: () {
                    Get.to(()=>ReAssignPasswordScreen(code: code,));
                  },
                )
                    : Container(),
              ],
            );
          },
        ),
      ),
    );
  }
}
