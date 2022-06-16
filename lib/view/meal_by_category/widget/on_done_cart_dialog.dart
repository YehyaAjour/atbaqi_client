import 'package:atbaqi_client/controllers/app_controller.dart';

import '../../../core/utils/app_imports.dart';
import '../../familymeals/screens/family_details_screen.dart';
import '../../main screen/Screens/main_screen.dart';

class OnDoneCartDialog {
  OnDoneCartDialog._();

  static OnDoneCartDialog cartApis = OnDoneCartDialog._();
  showCartDialog () {
    Get.defaultDialog(
      titleStyle: TextStyle(fontSize: 0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                GestureDetector(onTap: (){Get.back();},child: Icon(Icons.close),),
              ],
            ),
          ),
          SizedBox(height: 20,),

          CustomText(
            "تمت إضافة المنتج إلى السلة",fontSize: 16,color: Colors.green,),
          SizedBox(height: 20,),

          Divider(height: 20,thickness: 2,),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Get.to(FamilyDetailsScreen());
                  },
                  child: CustomText(
                    "متابعة الشراء",
                    fontSize: 14.sp,
                  ),
                ),
                VerticalDivider(width: 20,thickness: 2),
                GetBuilder<AppController>(
                  init: AppController(),
                  builder: (controller){
                    return  TextButton(
                      onPressed: () {
                        controller.setIndexScreen(1);
                        Get.to(MainScreen());
                      },
                      child: CustomText(
                        "الذهاب للسلة",
                        fontSize: 14.sp,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}