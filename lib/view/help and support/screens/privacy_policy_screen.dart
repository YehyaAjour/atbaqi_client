import 'package:atbaqi_client/view/help%20and%20support/widget/loading_text.dart';
import '../../../controllers/privacy_policy_controller.dart';
import '../../../core/utils/app_imports.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  PrivacyPolicyController privacyPolicyController = Get.find();
  int index = 0;
  List<BoxShadow> shadowList = [
    BoxShadow(color: Colors.grey[300], blurRadius: 30, offset: Offset(0, 10))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(18.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30.h,
              ),
              BackButton(
                onPressed: () {
                  Get.back();
                },
                color: Color(0xffFFCB00),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    'سياسة الخصوصية',
                    fontSize: 20,
                    fontFamily: 'din',
                    color: Color(0xffFFCB00),
                  ),
                ],
              ),
              SizedBox(
                height: 60,
              ),
              CustomText('عن تطبيق أطباقي', fontSize: 20, fontFamily: 'din'),
              SizedBox(
                height: 15,
              ),
              Obx(
                () {
                  if (privacyPolicyController.getAboutUsData.value.aboutUs ==
                      null) {
                    return LoadingText();
                  } else {
                    return CustomText(
                      privacyPolicyController
                          .getAboutUsData.value.aboutUs[0].aboutUs
                          .toString(),
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    );
                  }
                },
              ),
              SizedBox(
                height: 26,
              ),
              CustomText('شروط الإستخدام', fontSize: 20, fontFamily: 'din'),
              SizedBox(
                height: 15,
              ),
              Obx(
                () {
                  if (privacyPolicyController.getTermsData.value.terms ==
                      null) {
                    return LoadingText();
                  } else {
                    return CustomText(
                      privacyPolicyController.getTermsData.value.terms[0].terms
                          .toString(),
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    );
                  }
                },
              ),
              SizedBox(
                height: 26,
              ),
              CustomText('سياسة الخصوصية', fontSize: 20, fontFamily: 'din'),
              SizedBox(
                height: 15,
              ),
              Obx(
                () {
                  if (privacyPolicyController.getPrivacyData.value.privacy ==
                      null) {
                    return LoadingText();
                  } else {
                    return CustomText(
                      privacyPolicyController
                          .getPrivacyData.value.privacy[0].privacy
                          .toString(),
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    );
                  }
                },
              ),
              SizedBox(
                height: 26,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
