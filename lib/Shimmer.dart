import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/Navigator.dart';
import 'package:graduation_project_my_own_talki/main.dart';
import 'package:shimmer/shimmer.dart';

class MyHomepage extends StatelessWidget {
  static const String route_MyHomepage = 'MyHomepage';
  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(
          seconds: 5,
        ),
        () {
          if(isLogin == false){
            CircleAvatar_go_to_sin_in(context);
          }
          else{
            Backandsubmitineditprofile(context);
          }
        });
    return Scaffold(
      body: Center(
        child: Container(
            height: 250.h,
            width: 250.w,
            child: Shimmer.fromColors(
              baseColor: const Color.fromRGBO(255, 75, 38, 1.0),
              highlightColor: Colors.white,
              child: Image.asset(
                "assets/image/icontest.png",
              ),
            )
            ),
      ),
      bottomNavigationBar: Container(
          height: 70.h,
          width: 70.w,
          child: Shimmer.fromColors(
            baseColor: Colors.white,
            highlightColor:  const Color.fromRGBO(255, 75, 38, 1.0),
            child: Padding(
              padding: REdgeInsets.only(bottom: 20),
              child: Image.asset(
                "assets/image/icontext.png"
              ),
            ),
          )
          )
    );
  }
}