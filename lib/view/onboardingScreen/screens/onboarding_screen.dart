import 'package:atbaqi_client/core/utils/app_imports.dart';
import 'package:atbaqi_client/core/widgets/custom_image.dart';
import 'package:atbaqi_client/core/widgets/custom_text.dart';
import 'package:atbaqi_client/view/auth/login_screen.dart';
import 'package:flutter/material.dart';
import '../../../core/value/colors.dart';
import '../widget/onboarding_content.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0 ;
  PageController _pageController;
  @override
  void initState() {
    // TODO: implement initState
    _pageController = PageController(initialPage: 0);
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: content.length,
             onPageChanged: (value) {
             setState(() {
               currentIndex = value;
             });
             },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      CustomSvgImage(
                        imageName:  content[index].image,
                        width: 238.w,
                        height: 345.93.h,
                      ),

                      SizedBox(
                        height: 30,
                      ),
                      CustomText(content[index].title,textAlign: TextAlign.center,fontSize: 20,),

                    ],
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              content.length,
              (index) => buildSmallDots(index,),
            ),

          ),
          SizedBox(
            height: 40,
          ),
          Container(
            width: double.infinity,
            height: 48,
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: MaterialButton(
              elevation: 2,
              onPressed: () {
                if(currentIndex==content.length - 1 ){
                Get.to(LoginScreen());
                }else{
                  _pageController.nextPage(duration: Duration(milliseconds: 100), curve: Curves.easeIn);
                }
              },
              child: CustomText(currentIndex == content.length-1?'ابدأ':'التالي',color: Colors.white,fontSize: 20,),
              textColor: Colors.white,
              color: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.only(bottom: 40),
              child: TextButton(
                  onPressed: () {Get.to(LoginScreen());},
                  child: CustomText( 'تخطي',color: AppColors.primaryColor,fontSize: 20,)
                 ))
        ],
      ),
    );
  }

  Container buildSmallDots(int index,) {
    return Container(
      decoration: BoxDecoration(
          color: currentIndex==index?AppColors.primaryColor:Colors.grey[200],
          borderRadius: BorderRadius.circular(20.r)),
              width: currentIndex==index ? 30.w : 20.w,
              height: 7.h,
              margin: EdgeInsets.symmetric(horizontal: 1.w),

            );
  }
}
