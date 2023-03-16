// ignore_for_file: constant_identifier_names, camel_case_types, unused_import
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/CircleAvatar/CircleAvatar_trun_right.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/Home_Screen_Messenger/boutonnavigationbar.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/Navigator.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/TextForm/Myform.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/my_theme.dart';

class contectsmessegegroup extends StatelessWidget {
  static const String route_contectsmessegegroup = 'contectsmessegegroup';
  const contectsmessegegroup({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () async {
          Backandsubmitineditprofile(context);
          return true;
        } ,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: REdgeInsets.only(top: 50, left: 20),
                  child: Text(
                    "People who added",
                    style: MyThemeData.Addfriends,
                  ),
                ),
                SizedBox(height: 60.h),
                Padding(
                  padding: REdgeInsets.only(left: 20, right: 20),
                  child: Container(
                      margin: REdgeInsets.only(right: 20),
                      child: const Searchforcontents()),
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: REdgeInsets.only(left: 20),
                  child: Text(
                    "Select Contact",
                    style: MyThemeData.Addfriends,
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom,),
            child: SizedBox(
              height: 210.h,
              child: Column(
                children: [
                  Padding(
                    padding: REdgeInsets.only(right: 20, left: 20),
                    child: Container(
                        height: 130.h,
                        color: Colors.white,
                        child: Center(
                          child: Padding(
                            padding: REdgeInsets.only(left: 40, right: 40),
                            child: Center(
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                    hintText: "Write a Text",
                                    hintStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w800),
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.transparent)),
                                    enabledBorder: const UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.transparent))),
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                minLines: null,
                              ),
                            ),
                          ),
                        )),
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: REdgeInsets.only(right: 20, left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Send the massage ",
                          style: MyThemeData.Send_the_massage,
                        ),
                        InkWell(
                          child: const CircleAvatar_turn_right(),
                          onTap: () => Backandsubmitineditprofile(context),
                          ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
