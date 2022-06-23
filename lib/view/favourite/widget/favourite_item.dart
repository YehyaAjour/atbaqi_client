import 'package:atbaqi_client/controllers/favourite_controller.dart';

import '../../../core/utils/app_imports.dart';
import '../../profile/widgets/custom_rate.dart';

class FavouriteItem extends StatelessWidget {
  final String familyName;
  final int familyRate;
  final Function onTapRemove;

  const FavouriteItem({this.familyName, this.familyRate, this.onTapRemove});

  @override
  Widget build(BuildContext context) {
    FavouriteController favouriteController = Get.find();
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(10.0.r),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x29000000),
                  offset: Offset(0, 3),
                  blurRadius: 6,
                ),
              ],
            ),
            child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 15.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(),
                    Column(
                      children: [
                        CustomText(
                          familyName,
                          fontSize: 18.sp,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomRateRead(
                          rate: familyRate,
                          size: 20,
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: onTapRemove,
                      child: Column(
                        children: [
                          Icon(
                            favouriteController.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: AppColors.primaryColor,
                            size: 30,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          CustomText(
                            'إزالة\nمن\nالمفضلة',
                            fontSize: 12.sp,
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    )
                  ],
                )),
          ),
        ),
        SizedBox(
          height: 10.sp,
        ),
        Divider()
      ],
    );
  }
}
