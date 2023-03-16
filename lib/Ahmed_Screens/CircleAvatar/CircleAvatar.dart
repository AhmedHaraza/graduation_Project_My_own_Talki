// ignore_for_file: constant_identifier_names, use_key_in_widget_constructors, camel_case_types, file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class My_CircleAvatar extends StatelessWidget {
  static const String RouteName_CircleAvatar = 'routenameCircleAvatar';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 53.w,
          height: 53.h,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 75, 38, 1.0),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: const Color.fromRGBO(255, 75, 38, 1.0),
                    spreadRadius: 3.r,
                    blurRadius: 5.r,
                    offset: const Offset(0.0, 0.0))
              ]),
          child: Icon(
            Icons.east,
            color: Colors.white,
            size: 30.sp,
          ),
        ),
      ],
    );
  }
}
