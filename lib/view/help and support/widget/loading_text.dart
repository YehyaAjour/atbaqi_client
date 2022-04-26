import 'package:skeleton_text/skeleton_text.dart';

import '../../../core/utils/app_imports.dart';

class LoadingText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SkeletonAnimation(
          borderRadius: BorderRadius.circular(10.0.r),
          shimmerColor: Colors.white,
          child: Container(
              height: 15.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                // color: Colors.grey[300]
              )),
        ),
        SizedBox(
          height: 5.h,
        ),
        SkeletonAnimation(
          borderRadius: BorderRadius.circular(10.0.r),
          shimmerColor: Colors.white,
          child: Container(
              height: 15.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                // color: Colors.grey[300]
              )),
        ),
        SizedBox(
          height: 5.h,
        ),
        SkeletonAnimation(
          borderRadius: BorderRadius.circular(10.0.r),
          shimmerColor: Colors.white,
          child: Container(
              height: 15.h,
              width: 80.w,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                // color: Colors.grey[300]
              )),
        ),
      ],
    );
  }
}
