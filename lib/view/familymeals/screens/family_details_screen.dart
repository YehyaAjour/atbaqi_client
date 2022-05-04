import 'package:atbaqi_client/core/utils/constants.dart';
import 'package:atbaqi_client/view/familymeals/widget/top_screen_part.dart';
import 'package:atbaqi_client/view/meal_by_category/widget/meal_item.dart';
import '../../../controllers/home_controller.dart';
import '../../../core/utils/app_imports.dart';
import '../../../core/utils/helper.dart';
import '../../meal_by_category/screens/meal_detail_screen.dart';
import '../widget/meal_item.dart';

class FamilyDetailsScreen extends StatelessWidget {
  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => Column(
              children: [
                homeController.getFamilyById.value.status == null
                    ? CustomText("")
                    : TopScreenPart(
                        familyId: homeController
                            .getFamilyById.value.showFamily.id
                            .toString(),
                        familyImage: homeController
                                .getFamilyById.value.showFamily.image ??
                            "",
                        familyName: homeController
                                .getFamilyById.value.showFamily.name ??
                            "",
                        familyRating: "1.1",
                        familyStatus: homeController
                                .getFamilyById.value.showFamily.status ??
                            ""),
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
                    : homeController
                                .getFamilyById.value.showFamily.meals.length ==
                            0
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
                                var value = homeController.getFamilyById.value
                                    .showFamily.meals[index];
                                return MealsItem(
                                  mealName: value.name,
                                  mealImage: value.image ?? "",
                                  mealPrice: value.price,
                                  onTap: () {
                                    Get.to(MealDetailsScreen(
                                      price: value.price,
                                      mealName: value.name,
                                      numberPerson: value.numberPersons,
                                      image: value.image ?? "",
                                      description: value.description,
                                      mealId: value.id.toString(),
                                    ));
                                  },
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(
                                  width: 5.w,
                                );
                              },
                            ),
                          )),
              ],
            )));
  }
}
