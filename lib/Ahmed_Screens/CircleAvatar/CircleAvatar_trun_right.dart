// ignore_for_file: prefer_const_constructors, camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircleAvatar_turn_right extends StatelessWidget {
  const CircleAvatar_turn_right({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 53.w,
          height: 50.h,
          decoration: BoxDecoration(
              color: Color.fromRGBO(255, 75, 38, 1.0),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(255, 75, 38, 1.0),
                    spreadRadius: 3.r,
                    blurRadius: 5.r,
                    offset: Offset(0.0, 0.0))
              ]),
          child: Icon(
            Icons.east,
            color: Colors.white,
            size: 35.sp,
          ),
        ),
      ],
    );
  }
}
