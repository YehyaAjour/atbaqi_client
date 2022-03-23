import 'package:atbaqi_client/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../apis/auth_apis.dart';
import '../widget/drawer_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(),
      body: Center(
          child: GestureDetector(
        onTap: () {
          AuthApis.authApis.logOut();
        },
        child: Container(
          child: CustomText('Logout'),
        ),
      )),
    );
  }
}
