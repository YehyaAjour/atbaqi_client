import 'package:atbaqi_client/apis/favourite_apis.dart';
import 'package:atbaqi_client/view/familymeals/screens/family_details_screen.dart';

import '../../../controllers/favourite_controller.dart';
import '../../../core/utils/app_imports.dart';
import '../../../core/utils/helper.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../widget/favourite_item.dart';

class FavouriteScreen extends StatelessWidget {
  FavouriteController favouriteController = Get.find();

  // FavouriteScreen({Key key, this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          title: 'المفضلة',
        ),
        SizedBox(
          height: 40.h,
        ),
        Obx(() =>
            favouriteController.getAllFavouriteData.value.favoriteList == null
                ? Helper.loading()
                : favouriteController
                            .getAllFavouriteData.value.favoriteList.length ==
                        0
                    ? CustomText(
                        "لم تقم باضافة اي أسرة الى المفضلة",
                        fontSize: 14.sp,
                      )
                    : Expanded(
                        child: ListView.separated(
                          itemCount: favouriteController
                              .getAllFavouriteData.value.favoriteList.length,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            var value = favouriteController
                                .getAllFavouriteData.value.favoriteList[index];
                            return GestureDetector(
                              onTap: () {
                                Get.to(FamilyDetailsScreen(
                                  // familyId: favouriteController
                                  //     .getAllFavouriteData
                                  //     .value
                                  //     .favoriteList[index]
                                  //     .id
                                  //     .toString(),
                                  // value :value
                                  // familyId: value.id,
                                  // familyImage: "",
                                  // familyName: value.name,
                                  // familyRating: value.rating,
                                  // familyStatus: "",
                                ));
                              },
                              child: FavouriteItem(
                                familyName: value.name,
                                familyRate: int.parse(value.rating),
                                onTapRemove: () {
                                  favouriteController.isFavorite = false;
                                  FavouriteApis.favouriteApis
                                      .removeFromFavourite(value.id);
                                },
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              width: 5.w,
                            );
                          },
                        ),
                      )),
      ],
    );
  }
}
