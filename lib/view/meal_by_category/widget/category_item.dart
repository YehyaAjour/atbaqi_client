import '../../../core/utils/app_imports.dart';

class CategoryItem extends StatelessWidget {
final String name;
final Function onTap;


  const CategoryItem({Key key, this.name,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SizedBox(width: 10,),
          Container(
            width: 109.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18.0.r),
              border: Border.all(
                  width: 1.5, color: AppColors.primaryColor),

            ),

            child: Center(child: CustomText(name,fontSize: 14.sp,textAlign: TextAlign.center,)),
          ),
          SizedBox(width: 5,),
        ],
      ),
    );
  }
}
