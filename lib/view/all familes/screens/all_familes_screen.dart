import 'package:atbaqi_client/controllers/home_controller.dart';
import 'package:atbaqi_client/core/utils/app_imports.dart';
import 'package:atbaqi_client/core/utils/helper.dart';
import 'package:atbaqi_client/view/homescreenlayout/widget/home_item.dart';

class AllFamiliesScreen extends StatelessWidget {
  HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: Get.width,
            height: 113.h,
            decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(25.r))),
            child: Row(children: [
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back, color: AppColors.whiteColor)),
              CustomText(
                "الاسر المنتجة",
                color: AppColors.whiteColor,
                fontSize: 16.sp,
              )
            ]),
          ),
          Obx(() => homeController.getAllFamiles.value.status == null
              ? Helper.loading()
              : homeController.getAllFamiles.value.families.length == 0
                  ? CustomText(
                      "لا توجد اسر منتجة",
                      fontSize: 14.sp,
                    )
                  : Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemBuilder: (context, index) {
                            var model = homeController
                                .getAllFamiles.value.families[index];
                            return HomeItemAll(
                              model: model,
                            );
                          },
                          itemCount: homeController
                              .getAllFamiles.value.families.length,
                        ),
                      ),
                    ))
        ],
      ),
    );
  }
}
