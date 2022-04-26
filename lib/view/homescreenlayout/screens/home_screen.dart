import 'package:atbaqi_client/apis/home_apis.dart';
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
import 'package:flutter/material.dart';

import '../../../apis/auth_apis.dart';
import '../../../models/family_by_id_model.dart';
import '../../familymeals/screens/family_details_screen.dart';
import '../../meal_by_category/widget/category_item.dart';
import '../widget/drawer_widget.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: AppColors.whiteColor,
          leading: GestureDetector(
            onTap: () {
              _scaffoldKey.currentState.openDrawer();
            },
            child: Center(
              child: CustomSvgImage(
                imageName: "menu",
                width: 24.w,
                height: 18.h,
              ),
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications,
                  color: AppColors.primaryColor,
                )),
          ]),
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 15.h,
            ),
            Container(
              width: Get.width,
              height: 40.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: AppColors.grey.withOpacity(0.23))),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: AppColors.grey.withOpacity(0.23),
                    ),
                    CustomText(
                      "قم بالبحث عن وجبتك المفضلة",
                      fontSize: 14.sp,
                      color: AppColors.grey.withOpacity(0.23),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                CustomText(
                  "جميع التصنيفات",
                  fontSize: 16.sp,
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Obx(() => homeController.getAllCategories.value.status == null
                ? Helper.loading()
                : homeController.getAllCategories.value.categories.length == 0
                    ? CustomText(
                        "لا يوجد تصنيفات لعرضها",
                        fontSize: 14.sp,
                      )
                    : SizedBox(
                        height: 45.h,
                        child: ListView.separated(
                          itemCount: homeController
                              .getAllCategories.value.categories.length,
                          physics: ClampingScrollPhysics(),
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
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              width: 5.w,
                            );
                          },
                        ),
                      )),
            SizedBox(
              height: 30.h,
            ),
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
                          color: Colors.orange,
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
            SizedBox(
              height: 15.h,
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
                              homeController.getFamilyById.value = FamilyByIdModel.fromJson({});
                              HomeApis.homeApis
                                  .getFamilyById(model.id.toString());
                              Get.to(FamilyDetailsScreen(
                                familyId: model.id,
                                familyImage: model.image,
                                familyName: model.name,
                                familyRating: model.rating,
                                familyStatus: model.status,
                              ));
                            },
                          );
                        },
                        itemCount:
                            homeController.getHomeData.value.familyHome.length,
                      )),
            SizedBox(
              height: 10.h,
            ),
          ]),
        ),
      ),
    );
  }
}
