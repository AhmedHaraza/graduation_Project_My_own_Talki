// ignore_for_file: unnecessary_import, camel_case_types, use_key_in_widget_constructors, sized_box_for_whitespace, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/Navigator.dart';

class mystatus extends StatefulWidget {
  static const String route_mystatus = 'mystatus,';
  @override
  State<mystatus> createState() => _mystatusstate();
}

class _mystatusstate extends State<mystatus> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        addstatus(context);
        return false;
      } ,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70.h,
          elevation: 0.0,
          backgroundColor: const Color(0xff26282C),
          leading: IconButton(
              onPressed: () => addstatus(context),
              icon: Icon(
                Icons.arrow_back,
                size: 30.sp,
                color: const Color.fromRGBO(255, 75, 38, 1),
              )),
          title: Text(
            'My status',
            style: TextStyle(fontSize: 20.sp),
          ),
        ),
        body: Container(),
      ),
    );
  }
}
