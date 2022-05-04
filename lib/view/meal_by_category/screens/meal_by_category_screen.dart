 import 'package:atbaqi_client/view/meal_by_category/widget/meal_item.dart';
import 'package:atbaqi_client/view/meal_by_category/screens/meal_detail_screen.dart';

import '../../../controllers/home_controller.dart';
import '../../../core/utils/app_imports.dart';
import '../../../core/utils/helper.dart';

class MealByCategoryScreen extends StatelessWidget {
  final String title;
  HomeController homeController = Get.find();

  MealByCategoryScreen({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        toolbarHeight: 70.h,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 60.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: Row(
              children: [
                CustomText(
                  title,
                  fontSize: 20.sp,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Obx(() => homeController.getMealByCategory.value.status == null
              ? Helper.loading()
              : homeController.getMealByCategory.value.status == false
                  ? Expanded(
                      child: Center(
                        child: CustomText(
                          "لا تتوفر وجبات",
                          fontSize: 20.sp,
                        ),
                      ),
                    )
                  : ListView.separated(
                      itemCount: homeController
                          .getMealByCategory.value.mealsByCategory.length,
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        var value = homeController
                            .getMealByCategory.value.mealsByCategory[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                          child: MealItem(
                            productName: value.name,
                            price: value.price,
                            description: value.description,
                            imgUrl: value.image,

                            //on tap on meal item
                            onTap: () {
                              // await HomeApis.homeApis.getMealById(homeController.getMealByCategory.value.mealsByCategory[index].id.toString());
                              Get.to(MealDetailsScreen(
                                mealId:value.id.toString(),
                                categoryName: title,
                                price: value.price,
                                description: value.description,
                                image: value.image,
                                mealName: value.name,
                                numberPerson: value.numberPersons,
                              ));
                            },
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 5.w,
                        );
                      },
                    )),
        ],
      ),
    );
  }
}
