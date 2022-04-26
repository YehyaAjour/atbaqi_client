import 'package:atbaqi_client/apis/favourite_apis.dart';

import '../../../core/utils/app_imports.dart';
import '../../../core/widgets/cached_network_image.dart';
import '../../user_profile/widgets/custom_rate.dart';

class TopScreenPart extends StatelessWidget {
  final String familyName;
  final String familyImage;
  final String familyStatus;
  final String familyRating;
  final int familyId;

  const TopScreenPart(
      {this.familyName,
      this.familyImage,
      this.familyStatus,
      this.familyRating,
      this.familyId});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CachedNetworkImageShare(familyImage, 200, Get.width, 1),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 40.h,
              ),
              Row(
                children: [
                  BackButton(
                    onPressed: () {
                      Get.back();
                    },
                    color: AppColors.primaryColor,
                  )
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: -90,
          child: Container(
            width: Get.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 339.w,
                      height: 126.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: const Color(0xffffffff),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0x29000000),
                            offset: Offset(0, 3),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: 20.h,
                              ),
                              CustomText(
                                familyName,
                                fontSize: 18.sp,
                              ),
                              SizedBox(
                                height: 51.h,
                              ),
                              CustomRateRead(
                                rate: double.parse(familyRating),
                                size: 20,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0.h,
                      left: 0,
                      child: Container(
                        width: 96.w,
                        height: 41.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            bottomLeft: Radius.circular(10.0),
                          ),
                          color: familyStatus == 'active'
                              ? AppColors.green
                              : AppColors.red,
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x29000000),
                              offset: Offset(0, 3),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: Center(
                          child: CustomText(
                            familyStatus == 'active' ? "مفتوح" : 'مغلق',
                            fontSize: 16.sp,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: -20.h,
                      right: 10.w,
                      child: GestureDetector(
                        onTap: (){
                          FavouriteApis.favouriteApis
                              .addToFavourite(familyId);
                        },
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 25.r,
                              backgroundColor: AppColors.whiteColor,
                                child: Icon(
                              Icons.favorite,
                              color: AppColors.primaryColor,
                              size: 30,
                            )),

                            CustomText(
                              'أضف الى المفضلة',
                              fontSize: 10.sp,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.normal,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
