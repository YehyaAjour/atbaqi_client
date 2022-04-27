
import 'package:atbaqi_client/core/utils/constants.dart';

import '../../../controllers/home_controller.dart';
import '../../../core/utils/app_imports.dart';
import '../../../core/utils/helper.dart';
import '../../../core/widgets/cached_network_image.dart';
import '../../../core/widgets/custom_button.dart';

class MealDetailsScreen extends StatelessWidget {
 final String categoryName;
 final String mealName;
 final String numberPerson;
 final String description;
 final String image;
 final String price;
 HomeController homeController = Get.find();

 MealDetailsScreen({this.categoryName, this.mealName, this.numberPerson, this.description, this.image, this.price});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => Get.back(), child: Icon(Icons.arrow_back)),
        backgroundColor: AppColors.primaryColor,
        elevation: 0.0,
        centerTitle: true,
        title: CustomText(
          "تفاصيل الطبق",
          color: AppColors.whiteColor,
          fontSize: 18.sp,
        ),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 34.h,
              ),
              Row(
                children: [
                  CachedNetworkImageShare(
                     baseImageUrl+image,
                      98,
                      135,
                      1),
                  SizedBox(
                    width: 14.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        mealName,
                        fontSize: 18.sp,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      CustomText(
                        'التصنيف: '+categoryName,
                        fontSize: 18.sp,
                        color: AppColors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          CustomText(
                            "يكفي ل ",
                            fontSize: 18.sp,
                            color: AppColors.grey,
                            fontWeight: FontWeight.w400,
                          ),
                          CustomText(
                            numberPerson,
                            fontSize: 18.sp,
                            color: AppColors.grey,
                            fontWeight: FontWeight.w400,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          CustomText(
                            "أشخاص",
                            fontSize: 18.sp,
                            color: AppColors.grey,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          CustomText(
                                price,
                            fontSize: 18.sp,
                            color: AppColors.primaryColor,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          CustomText(
                            "شيكل",
                            fontSize: 18.sp,
                            color: AppColors.primaryColor,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 60.h,
              ),
              CustomText(
                "وصف الطبق ",
                fontSize: 20.sp,
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(
                constraints: BoxConstraints(maxWidth: 331.w),
                child: CustomText(
                      description,
                  fontSize: 14.sp,
                  color: AppColors.grey,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 120.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    onTap: () {

                    },
                    title: "اضف الى السلة",
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),

            ],
          )),
    );
  }
}
