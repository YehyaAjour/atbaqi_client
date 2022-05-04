import 'package:atbaqi_client/core/utils/app_imports.dart';
import 'package:atbaqi_client/core/widgets/custom_image.dart';

customError() {
  ErrorWidget.builder = (FlutterErrorDetails error) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomSvgImage(imageName: "error_image", height: 200.h, width: 200.w),
          SizedBox(
            height: 20.h,
          ),
          CustomText(
            "نأسف لهذا الخطأ",
            fontSize: 16.sp,
          )
        ]),
      ),
    );
  };
}
