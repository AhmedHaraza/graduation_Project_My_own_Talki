// ignore_for_file: constant_identifier_names, file_names, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/Home_Screen_Messenger/boutonnavigationbar.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/Navigator.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/TextForm/Myform.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/my_theme.dart';

class Addfrinds extends StatelessWidget {
  static const String route_Add_frinds = 'rout_Add_frinds';

  const Addfrinds({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: WillPopScope(
          onWillPop: () async{
            Backandsubmitineditprofile(context);
            return true;
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Padding(
              padding: REdgeInsets.only(top: 50, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Add friends",
                    style: MyThemeData.Addfriends,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                      height: 40.h,
                      margin: REdgeInsets.only(right: 20),
                      child: const Search()),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Contact",
                    style: MyThemeData.Addfriends,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
