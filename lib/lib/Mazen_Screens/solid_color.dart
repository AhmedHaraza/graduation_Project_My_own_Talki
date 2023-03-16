// ignore_for_file: unnecessary_import, use_key_in_widget_constructors, constant_identifier_names, camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/Navigator.dart';

class solid_color extends StatefulWidget {
                  static const String route_solid_color = 'solid_color,';
  @override
  State<solid_color> createState() => _solidcolor();
}

class _solidcolor extends State<solid_color> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          toolbarHeight: 50.h,
          backgroundColor: const Color.fromRGBO(28, 28, 28, 1),
          leading: IconButton(
              onPressed: ()=>TextChange(context),
              icon:  Icon(
                Icons.arrow_back,
                size: 25.sp,
                color: const Color.fromRGBO(255, 75, 38, 1),
              )),
          title: Text(
            'Solid Color',
            style: TextStyle(fontSize: 20.sp),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.only(left: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(28, 28, 28, 1),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.r),
                            topRight: Radius.circular(20.r),
                            bottomLeft: Radius.circular(20.r),
                            bottomRight: Radius.circular(20.r))),
                    margin: REdgeInsets.all(10),
                    height: 180.h,
                    width: 85.w,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.r),
                            topRight: Radius.circular(20.r),
                            bottomLeft: Radius.circular(20.r),
                            bottomRight: Radius.circular(20.r))),
                    margin: REdgeInsets.all(10),
                    height: 180.h,
                    width: 85.w,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.r),
                            topRight: Radius.circular(20.r),
                            bottomLeft: Radius.circular(20.r),
                            bottomRight: Radius.circular(20.r))),
                    margin: REdgeInsets.all(10),
                    height: 180.h,
                    width: 85.w,
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.r),
                            topRight: Radius.circular(20.r),
                            bottomLeft: Radius.circular(20.r),
                            bottomRight: Radius.circular(20.r))),
                    margin: REdgeInsets.all(10),
                    height: 180.h,
                    width: 85.w,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.r),
                            topRight: Radius.circular(20.r),
                            bottomLeft: Radius.circular(20.r),
                            bottomRight: Radius.circular(20.r))),
                    margin: REdgeInsets.all(10),
                    height: 180.h,
                    width: 85.w,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.r),
                            topRight: Radius.circular(20.r),
                            bottomLeft: Radius.circular(20.r),
                            bottomRight: Radius.circular(20.r))),
                    margin: REdgeInsets.all(10),
                    height: 180.h,
                    width: 85.w,
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.r),
                            topRight: Radius.circular(20.r),
                            bottomLeft: Radius.circular(20.r),
                            bottomRight: Radius.circular(20.r))),
                    margin: REdgeInsets.all(10),
                    height: 180.h,
                    width: 85.w,
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.r),
                                topRight: Radius.circular(20.r),
                                bottomLeft: Radius.circular(20.r),
                                bottomRight: Radius.circular(20.r))),
                        margin: REdgeInsets.all(10),
                        height: 180.h,
                        width: 85.w,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.r),
                                topRight: Radius.circular(20.r),
                                bottomLeft: Radius.circular(20.r),
                                bottomRight: Radius.circular(20.r))),
                        margin: REdgeInsets.all(10),
                        height: 180.h,
                        width: 85.w,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
  }
}
