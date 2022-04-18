import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../core/value/colors.dart';
import '../models/forget_password_model.dart';

class AuthController extends GetxController {
  Rx<ForgetPasswordModel> getForgetPasswordData = ForgetPasswordModel().obs;

  //============Login=============
  String phoneNumber, password;
  File profilePicture;

  // var image = File('').obs;
  ImagePicker picker = ImagePicker();

  setPhoneNumber(String value) => this.phoneNumber = value;
  setPassword(String value) => this.password = value;

  validationPhoneNumber(String value) {
    if (GetUtils.isNull(value) || value.isEmpty) {
      return "الرجاء ادخال رقم الهاتف";
    }
  }

  validationPassword(String value) {
    if (GetUtils.isNull(value) || value.isEmpty) {
      return "الرجاء ادخال كلمة المرور";
    }
  }

  //============ReAssignPassword=============
  String passwordRa, confirmPasswordRa;
  setPasswordRa(String value) {
    this.passwordRa = value;
  }

  setConfirmPasswordRa(String value) {
    this.confirmPasswordRa = value;
  }

  validationPasswordRa(String value) {
    if (GetUtils.isNull(value) || value.isEmpty) {
      return "الرجاء ادخال كلمة المرور";
    }
    if (value.length < 8) {
      return 'يجب ان يكون اكثر من 8 خانات';
    }
  }

  validationConfirmPasswordRa(String value) {
    if (GetUtils.isNull(value) || value.isEmpty) {
      return "الرجاء ادخال تأكيد كلمة المرور";
    }
    // if (value != this.passwordRa) {
    //   return 'كلمتان المرور غير متطابقتان';
    // }
  }

  //============Register=============
  String phone, email, name, passwordR, confirmPassword;

  setPhone(String value) {
    this.phone = value;
  }

  setEmail(String value) {
    this.email = value;
  }

  setName(String value) {
    this.name = value;
  }

  setPasswordR(String value) {
    this.passwordR = value;
  }

  setConfirmPassword(String value) {
    this.confirmPassword = value;
  }

  validationPhoneNumberR(String value) {
    if (GetUtils.isNull(value) || value.isEmpty) {
      return "الرجاء ادخال رقم الهاتف";
    }
  }

  validationEmail(String value) {
    if (GetUtils.isNull(value) || value.isEmpty) {
      return "الرجاء ادخال بريد الكتروني";
    }
    if (!GetUtils.isEmail(value)) {
      return 'البريد المدخل غير صحيح';
    }
  }

  validationName(String value) {
    if (GetUtils.isNull(value) || value.isEmpty) {
      return "الرجاء ادخال الاسم";
    }
  }

  validationPasswordR(String value) {
    if (GetUtils.isNull(value) || value.isEmpty) {
      return "الرجاء ادخال كلمة المرور";
    }
    if (value.length < 8) {
      return 'يجب ان يكون اكثر من 8 خانات';
    }
  }

  validationConfirmPassword(String value) {
    if (GetUtils.isNull(value) || value.isEmpty) {
      return "الرجاء ادخال تأكيد كلمة المرور";
    }
    // if (value != this.passwordR) {
    //   return 'كلمتان المرور غير متطابقتان';
    // }
  }

  Future<File> imagePickerExample() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    try {
      File croppedFile = await ImageCropper().cropImage(
          sourcePath: pickedFile.path,
          aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
          aspectRatioPresets: Platform.isAndroid
              ? [
                  CropAspectRatioPreset.square,
                  CropAspectRatioPreset.ratio3x2,
                  CropAspectRatioPreset.original,
                  CropAspectRatioPreset.ratio4x3,
                  CropAspectRatioPreset.ratio16x9
                ]
              : [
                  CropAspectRatioPreset.original,
                  CropAspectRatioPreset.square,
                  CropAspectRatioPreset.ratio3x2,
                  CropAspectRatioPreset.ratio4x3,
                  CropAspectRatioPreset.ratio5x3,
                  CropAspectRatioPreset.ratio5x4,
                  CropAspectRatioPreset.ratio7x5,
                  CropAspectRatioPreset.ratio16x9
                ],
          androidUiSettings: const AndroidUiSettings(
              toolbarTitle: 'اقتصاص الصورة',
              toolbarColor: AppColors.primaryColor,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          iosUiSettings: const IOSUiSettings(
            title: 'اقتصاص الصورة',
          ));
      return croppedFile;
    } catch (e) {
      return null;
    }
  }

  addImage() async {
    try {
      File croppedFile = await imagePickerExample();

      if (croppedFile != null) {
        profilePicture = croppedFile;
        update(['image']);
      }
    } catch (e) {}
  }
}
