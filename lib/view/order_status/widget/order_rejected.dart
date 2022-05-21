import '../../../core/utils/app_imports.dart';
import '../../../core/widgets/custom_image.dart';

class OrderRejected extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSvgImage(imageName:'rejected',color: Colors.red,width: 250.w,height: 150.h,),
        SizedBox(height: 20.h,)
      ],
    );
  }
}
