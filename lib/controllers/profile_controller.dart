import 'dart:io';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../core/utils/app_imports.dart';
import '../core/value/colors.dart';
import '../models/profile_model.dart';

class ProfileController extends GetxController {
  Rx<ProfileModel> getProfileData = ProfileModel().obs;
  String name, phone;
  File profilePicture;

  // var image = File('').obs;
  ImagePicker picker = ImagePicker();
  setPhoneNumber(String value) => this.phone = value;
  setName(String value) => this.name = value;
  Future<File> imagePickerExample() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);

    try {
      File croppedFile = await ImageCropper.cropImage(
          sourcePath: pickedFile.path,
          aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
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
          androidUiSettings: AndroidUiSettings(
              toolbarTitle: 'اقتصاص الصورة',
              toolbarColor: AppColors.primaryColor,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          iosUiSettings: IOSUiSettings(
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
