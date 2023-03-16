// ignore_for_file: constant_identifier_names, camel_case_types, sized_box_for_whitespace, file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/TextForm/Myform.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/my_theme.dart';

class Add_Members extends StatelessWidget {
  const Add_Members({Key? key}) : super(key: key);
  static const String route_Add_Members = 'rout_Add_Members';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Padding(
          padding: REdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Add Members", style: MyThemeData.Add_Members),
              SizedBox(
                height: 15.h,
              ),
              Text("Members who added", style: MyThemeData.Members_who_added),
              SizedBox(
                height: 30.h,
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(width: 500.w, child: const Searchforcontents()),
              SizedBox(
                height: 15.h,
              ),
              Text(
                "Select Contact",
                style: MyThemeData.Select_Contact,
              ),
            ],
          ),
        ),
        floatingActionButton: Container(
          margin: const EdgeInsets.only(bottom: 10),
          width: 45,
          height: 45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              boxShadow: const [
                BoxShadow(
                    color: Color(0xffFF4B26),
                    spreadRadius: 3,
                    blurRadius: 8,
                    offset: Offset(0, 0)),
              ]),
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: const Color(0xffFF4B26),
            child: const Icon(
              Icons.done,
              size: 25,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
