import 'package:atbaqi_client/core/utils/constants.dart';
import 'package:atbaqi_client/view/familymeals/widget/top_screen_part.dart';
import 'package:atbaqi_client/view/meal_by_category/widget/meal_item.dart';
import '../../../controllers/home_controller.dart';
import '../../../core/utils/app_imports.dart';
import '../../../core/utils/helper.dart';
import '../widget/meal_item.dart';

class FamilyDetailsScreen extends StatelessWidget {
  final String familyName;
  final String familyImage;
  final String familyStatus;
  final String familyRating;
  final int familyId;

  HomeController homeController = Get.find();

  FamilyDetailsScreen(
      {this.familyName,
      this.familyImage,
      this.familyStatus,
      this.familyRating,
      this.familyId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        TopScreenPart(
            familyId: familyId,
            familyImage: baseImageUrl + familyImage,
            familyName: familyName,
            familyRating: familyRating,
            familyStatus: familyStatus),
        SizedBox(
          height: 140.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: Row(
            children: [
              CustomText(
                "الوجبات",
                fontSize: 18.sp,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Obx(() => homeController.getFamilyById.value.status == null
            ? Helper.loading()
            : homeController.getFamilyById.value.showFamily.meals.length == 0
                ? CustomText(
                    "لم يتم اضافة وجبات من قبل العائلة",
                    fontSize: 14.sp,
                  )
                : Expanded(
                    child: ListView.separated(
                      itemCount: homeController
                          .getFamilyById.value.showFamily.meals.length,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        var value = homeController
                            .getFamilyById.value.showFamily.meals[index];
                        return MealsItem(
                          mealName: value.name,
                          mealImage: value.image,
                          mealPrice: value.price,
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 5.w,
                        );
                      },
                    ),
                  )),
      ],
    ));
  }
}
