import 'package:atbaqi_client/controllers/app_controller.dart';
import 'package:atbaqi_client/core/widgets/custom_bottom_navigation.dart';
import 'package:atbaqi_client/view/homescreenlayout/screens/home_screen.dart';
import 'package:atbaqi_client/view/user_profile/screens/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_imports.dart';
import '../../cart/screens/my_cart_screen.dart';
import '../../favourite/screens/favourite_screen.dart';
import '../../homescreenlayout/widget/drawer_widget.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: DrawerWidget(),
        // backgroundColor: Colors.white,
        body: GetBuilder<AppController>(
          init: AppController(),
          builder: (controller) {
            return PageNav.widgetOptions[controller.indexScreen];
          },
        ),
        bottomNavigationBar: CustomNavBottom());
  }
}

class PageNav {
  static List<Widget> widgetOptions = <Widget>[
    HomeScreen(),
    MyCartScreen(),
    FavouriteScreen(),
    UserProfileScreen(),
  ];
}
