

import '../../../apis/contact_us_apis.dart';
import '../../../controllers/contact_us_controller.dart';
import '../../../core/utils/app_imports.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_form_field.dart';

class HelpAndSupportScreen extends StatelessWidget {
  GlobalKey<FormState> formStateContactsUs = GlobalKey<FormState>();
  ContactUsController contactUsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(18.0.h),
          child: Column(
            children: [
              Row(
                children: [
                  BackButton(
                    onPressed: () {
                      Get.back();
                    },
                    color: AppColors.primaryColor,
                  )
                ],
              ),
              CustomText(
                'الدعم والمساعدة',
                fontSize: 20.sp,
                color: AppColors.primaryColor,
              ),
              SizedBox(
                height: 60,
              ),
              Row(
                children: [
                  CustomText(
                    'تواصل معنا عن طريق الإيميل',
                    fontSize: 20.sp,
                  ),
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
              Form(
                key: formStateContactsUs,
                child: Column(
                  children: [
                    CustomTextFormField(
                        topTitle: 'عنوان الرسالة',
                        textInputType: TextInputType.text,
                      onSaved: contactUsController.setTitle,
                      validator: contactUsController.validationTitle,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    CustomTextFormField(
                        topTitle: 'الرسالة',
                        textInputType: TextInputType.multiline,
                      maxLines: 4,
                      onSaved: contactUsController.setMessage,
                      validator: contactUsController.validationMessage,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 95.h),
              CustomButton(
                  title: 'إرسال',
                  onTap: () {
                    if (formStateContactsUs.currentState.validate()) {
                      formStateContactsUs.currentState.save();
                      ContactUsApis.contactUsApis.contactUs(
                          contactUsController.title,
                          contactUsController.message);
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}