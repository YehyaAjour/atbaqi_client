import 'package:atbaqi_client/core/utils/app_imports.dart';
import 'package:atbaqi_client/core/utils/constants.dart';
import '../../../core/widgets/cached_network_image.dart';


class MealItem extends StatelessWidget {
  final String imgUrl;
  final String productName;
  final String description;
  final String price;
  final Function onTap;

  MealItem({@required this.imgUrl,@required this.productName,@required this.description,@required this.price,this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                width: 84.w,
                height: 84.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: CachedNetworkImageShare(
                    baseImageUrl + imgUrl, Get.height, 100, 1,fit: BoxFit.cover),
              ),
              SizedBox(
                width: 14.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    productName,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                    fontFamily: 'din',
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Container(
                    width: 170.w,
                    child: CustomText(
                      description,
                      fontWeight: FontWeight.normal,
                      fontSize: 12.sp,
                      fontFamily: 'din',
                      maxLines: 2,

                    ),
                  ),
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomText(
                    price,
                    fontWeight: FontWeight.normal,
                    fontSize: 26.sp,
                    fontFamily: 'din',
                  ),
                  CustomText(
                    'شيكل',
                    fontWeight: FontWeight.normal,
                    fontSize: 12.sp,
                    fontFamily: 'din',
                    color: Color(0xffFF9919),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 5.h,),
          Divider()
        ],
      ),
    );
  }
}
