
import '../utils/app_imports.dart';
import '../utils/helper.dart';
import '../value/colors.dart';
import 'custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final String topTitle;
  final String hint;
  final Function onSaved;
  final Function validator;
  final TextInputType textInputType;
  final bool isPassword;
  CustomTextFormField({
    this.topTitle,
    this.hint,
    this.onSaved,
    this.validator,
    this.textInputType,
    this.isPassword = false,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          topTitle ?? "",
          fontSize: 18.sp,
          fontWeight: FontWeight.w400,
        ),
        SizedBox(
          height: 10.h,
        ),
        TextFormField(
          onSaved: (value) => onSaved(value),
          validator: (newValue) => validator(newValue),
          obscureText: isPassword,
          maxLines: 1,
          minLines: 1,
          keyboardType: textInputType ?? TextInputType.text,
          initialValue: hint ?? "",
          decoration: InputDecoration(
            errorStyle: TextStyle(fontSize: 12.0, fontFamily: "din"),
            // hintText: hint ?? "",
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: Helper.appRaduis,
              borderSide: BorderSide(),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: Helper.appRaduis,
              borderSide: BorderSide(color: AppColors.borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: Helper.appRaduis,
              borderSide: BorderSide(color: AppColors.borderColor),
            ),
          ),
          style: TextStyle(fontFamily: "din", fontSize: 16.sp),
        )
      ],
    );
  }
}
