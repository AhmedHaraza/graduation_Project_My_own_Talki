// ignore_for_file: file_names, constant_identifier_names, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/CircleAvatar/CircleAvatar_add.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/Home_Screen_Messenger/boutonnavigationbar.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/Navigator.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/TextForm/Myform.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/my_theme.dart';

class Group extends StatelessWidget {
  static const String route_Group = 'rout_Group';
  const Group({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: REdgeInsets.only(top: 50, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Pinned Message",
                style: MyThemeData.Addfriends,
              ),
              SizedBox(
                height: 13.h,
              ),
              Column(
                children: [
                  InkWell(
                    child: const CircleAvatar_add(),
                    onTap: ()=> Addfrinedgroup(context),
                    ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Add",
                    style: TextStyle(color: Colors.white, fontSize: 10.sp),
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(
                margin: REdgeInsets.only(right: 20),
                child: const SearchforGroup(),
              ),
              SizedBox(
                height: 13.h,
              ),
              Text(
                "Your Groups",
                style: MyThemeData.Addfriends,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void fun() {}
}
