// ignore_for_file: unused_local_variable, use_key_in_widget_constructors, camel_case_types, constant_identifier_names, file_names, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project_my_own_talki/Abdo_Screen/SideMenu/side_menu.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/CircleAvatar/CircleAvatar_add.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/Home_Screen_Messenger/boutonnavigationbar.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/Navigator.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/TextForm/Myform.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/my_theme.dart';

class Home_Screen_Messenger extends StatelessWidget {
  static const String route_Home_Messenger = 'rout_messnger';
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
    onTap: () =>  FocusScope.of(context).unfocus(),
      child: Scaffold(
        endDrawer: SideMenu(),
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  REdgeInsets.only(top: 50,left: 20),
              child: Text(
                "Pinned Message",
                style: MyThemeData.Addfriends,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: REdgeInsets.only(left: 20),
              child: Column(
                children: [
                  InkWell(
                    onTap: () => addfriend(context),
                    child: const CircleAvatar_add()
                    ),
                  SizedBox(height: 10.h),
                  Text("Add",style: TextStyle(fontSize: 10.sp,color: Colors.white),),
                ],
              ),
            ),
            SizedBox(
              height: 13.h,
            ),
            Padding(
                padding: REdgeInsets.only(left: 20, right: 20),
                child: const Searchforcontents()),
            SizedBox(
              height: 13.h,
            ),
            Padding(
              padding: REdgeInsets.only(left: 20),
              child: Text(
                "Your Message",
                style: MyThemeData.Addfriends,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
