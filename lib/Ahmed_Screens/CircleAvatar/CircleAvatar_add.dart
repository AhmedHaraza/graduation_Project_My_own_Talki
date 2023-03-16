// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircleAvatar_add extends StatelessWidget {
  const CircleAvatar_add({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20.r,
      backgroundColor: const Color.fromRGBO(255, 75, 38, 1.0),
      child: Icon(
        Icons.add,
        size: 40.sp,
        color: Colors.black,
      ),
    );
  }
}
