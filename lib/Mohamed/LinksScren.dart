// ignore_for_file: sized_box_for_whitespace, file_names, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LinksScrens extends StatelessWidget {
  static const String route_LinksScrens = 'LinksScrens';
  const LinksScrens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                size: 35.sp,
              ),
              onPressed: () {}
              ),
          title: Container(
            height: 40.h,
            child: TextField(
              decoration: InputDecoration(
                contentPadding: REdgeInsets.all(8),
                fillColor: const Color(0xffD9D9D9),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 20.w, color: (const Color(0xffD9D9D9))),
                  borderRadius: BorderRadius.all(Radius.circular(50.0.r)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 5.w, color: (const Color(0xffD9D9D9))),
                  borderRadius: BorderRadius.all(Radius.circular(60.0.r)),
                ),
                labelStyle: TextStyle(fontSize: 25.sp, color: (Colors.white)),
                hintText: "Links",
                hintStyle: TextStyle(fontSize: 20.sp, color: Colors.white),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 25.sp,
                ),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: REdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.check_box_outlined,
                  size: 35.sp,
                ),
              ),
            )
          ],
          backgroundColor: const Color(0xffff4928),
        ),
        body: Container(
          color: Colors.black87,
        ),
      ),
    );
  }
}
