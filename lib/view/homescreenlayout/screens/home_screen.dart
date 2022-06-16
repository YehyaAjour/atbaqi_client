import 'package:atbaqi_client/apis/home_apis.dart';
import 'package:atbaqi_client/apis/notification_apies.dart';
import 'package:atbaqi_client/controllers/home_controller.dart';
import 'package:atbaqi_client/core/utils/app_imports.dart';
import 'package:atbaqi_client/core/utils/helper.dart';
import 'package:atbaqi_client/core/value/colors.dart';
import 'package:atbaqi_client/core/widgets/custom_image.dart';
import 'package:atbaqi_client/core/widgets/custom_text.dart';
import 'package:atbaqi_client/models/home_model.dart';
import 'package:atbaqi_client/models/meal_by_category_model.dart';
import 'package:atbaqi_client/view/all%20familes/screens/all_familes_screen.dart';
import 'package:atbaqi_client/view/homescreenlayout/widget/home_item.dart';
import 'package:atbaqi_client/view/meal_by_category/screens/meal_by_category_screen.dart';

import '../../../core/widgets/custom_app_bar.dart';
import '../../../models/family_by_id_model.dart';
import '../../familymeals/screens/family_details_screen.dart';
import '../../meal_by_category/widget/category_item.dart';
import '../../notification/screens/notifications_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CustomAppBar(
          title: 'الرئيسية',
        ),
        SizedBox(
          height: 15.h,
        ),

        SizedBox(
          height: 20.h,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0.w),
              child: Row(
                children: [
                  CustomText(
                    "جميع التصنيفات",
                    fontSize: 16.sp,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Obx(() => homeController.getAllCategories.value.status == null
                ? Helper.loading()
                : homeController.getAllCategories.value.categories.length == 0
                    ? CustomText(
                        "لا يوجد تصنيفات لعرضها",
                        fontSize: 14.sp,
                      )
                    : SizedBox(
                        height: 50.h,
                        child: ListView.builder(
                          itemCount: homeController
                              .getAllCategories.value.categories.length,
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          primary: false,
                          itemBuilder: (context, index) {
                            return CategoryItem(
                              name: homeController.getAllCategories.value
                                  .categories[index].name,
                              onTap: () {
                                homeController.getMealByCategory.value =
                                    MealByCategoryModel.fromJson({});
                                HomeApis.homeApis.getMealByCategory(
                                    homeController.getAllCategories.value
                                        .categories[index].id
                                        .toString());
                                Get.to(MealByCategoryScreen(
                                    title: homeController.getAllCategories.value
                                        .categories[index].name));
                              },
                            );
                          },
                        ),
                      )),
          ],
        ),
        SizedBox(
          height: 30.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: Column(
            children: [
              Row(
                children: [
                  CustomText(
                    "الأسر المنتجة",
                    fontSize: 16.sp,
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      HomeApis.homeApis.getAllFamiles();
                      Get.to(() => AllFamiliesScreen());
                    },
                    child: Container(
                      width: 71.w,
                      height: 24.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(
                            color: AppColors.primaryColor,
                          )),
                      child: Center(
                          child: CustomText(
                        "عرض الكل",
                        fontSize: 14.sp,
                        color: AppColors.grey,
                      )),
                    ),
                  )
                ],
              ),
              Obx(() => homeController.getHomeData.value.status == null
                  ? Helper.loading()
                  : homeController.getHomeData.value.familyHome.length == 0
                      ? CustomText(
                          "لا توجد اسر منتجة",
                          fontSize: 14.sp,
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          primary: false,
                          itemBuilder: (context, index) {
                            var model = homeController
                                .getHomeData.value.familyHome[index];
                            return HomeItem(
                              model: model,
                              onTap: () {
                                homeController.getFamilyById.value =
                                    FamilyByIdModel.fromJson({});
                                HomeApis.homeApis
                                    .getFamilyById(model.id.toString());
                                Get.to(FamilyDetailsScreen(
                                    // familyId: model.id.toString(),
                                    ));
                              },
                            );
                          },
                          itemCount: homeController
                              .getHomeData.value.familyHome.length,
                        )),
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
      ]),
    );
  }
}
