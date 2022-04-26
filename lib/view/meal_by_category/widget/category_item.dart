import '../../../core/utils/app_imports.dart';

class CategoryItem extends StatelessWidget {
final String name;
final Function onTap;


  const CategoryItem({Key key, this.name,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 109.w,
        height: 45.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0.r),
          border: Border.all(
              width: 1.5, color: AppColors.primaryColor),

        ),

        child: Center(child: CustomText(name,fontSize: 14.sp,)),
      ),
    );
  }
}
// isSelected?AppColors.primaryColor: Color(0xffffffff),