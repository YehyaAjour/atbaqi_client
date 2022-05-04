import 'package:atbaqi_client/core/utils/app_imports.dart';
import 'package:atbaqi_client/core/utils/constants.dart';
import 'package:atbaqi_client/core/widgets/cached_network_image.dart';
import 'package:atbaqi_client/models/all_familes_model.dart';
import 'package:atbaqi_client/models/home_model.dart';

class HomeItem extends StatelessWidget {
  final FamilyHome model;
  final Function onTap;

  const HomeItem({Key key, this.model, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: Get.width,
            height: 100.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: AppColors.grey.withOpacity(0.23))),
            child: Row(children: [
              ClipRRect(
                borderRadius:
                    BorderRadius.horizontal(right: Radius.circular(12.r)),
                child: CachedNetworkImageShare(model.image, Get.height, 100, 1),
              ),
              SizedBox(
                width: 10.w,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 15.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 220.w,
                      child: Row(
                        children: [
                          CustomText(
                            model.name ?? "",
                            fontSize: 14.sp,
                          ),
                          Spacer(),
                          CustomText(
                            model.rating ?? "",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          Icon(
                            Icons.star,
                            color: AppColors.primaryColor,
                            size: 20.r,
                          )
                        ],
                      ),
                    ),
                    CustomText(
                      model.status == "active" ? "مفتوح" : "مغلق",
                      fontSize: 14.sp,
                      color: model.status == "active"
                          ? AppColors.green
                          : AppColors.red,
                    ),
                  ],
                ),
              ),
            ]),
          ),
          SizedBox(
            height: 15.h,
          ),
        ],
      ),
    );
  }
}

class HomeItemAll extends StatelessWidget {
  final Family model;

  const HomeItemAll({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: Get.width,
          height: 100.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: AppColors.grey.withOpacity(0.23))),
          child: Row(children: [
            ClipRRect(
              borderRadius:
                  BorderRadius.horizontal(right: Radius.circular(12.r)),
              child: CachedNetworkImageShare(
                  baseImageUrl + model.image, Get.height, 100, 1),
            ),
            SizedBox(
              width: 10.w,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 15.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 220.w,
                    child: Row(
                      children: [
                        CustomText(
                          model.name ?? "",
                          fontSize: 14.sp,
                        ),
                        Spacer(),
                        CustomText(
                          model.rating ?? "",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        Icon(
                          Icons.star,
                          color: AppColors.primaryColor,
                          size: 20.r,
                        )
                      ],
                    ),
                  ),
                  CustomText(
                    model.status == "active" ? "مفتوح" : "مغلق",
                    fontSize: 14.sp,
                    color: model.status == "active"
                        ? AppColors.green
                        : AppColors.red,
                  ),
                ],
              ),
            ),
          ]),
        ),
        SizedBox(
          height: 15.h,
        ),
      ],
    );
  }
}
