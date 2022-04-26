import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../models/about_us_model.dart';
import '../models/privacy_model.dart';
import '../models/terms_model.dart';

class PrivacyPolicyController extends GetxController{
  Rx<TermsModel> getTermsData = TermsModel().obs;
  Rx<PrivacyModel> getPrivacyData = PrivacyModel().obs;
  Rx<AboutUsModel> getAboutUsData = AboutUsModel().obs;

}