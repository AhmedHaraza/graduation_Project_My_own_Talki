// ignore_for_file: file_names, camel_case_types, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
void main() {
  runApp(const Video_Screen());
}

class Video_Screen extends StatelessWidget {
                  static const String route_Video_Screen = 'Video_Screen';
  const Video_Screen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffff4b26),
          leading: const Icon(Icons.arrow_back_sharp),
          centerTitle: true,
          titleTextStyle: TextStyle(fontSize: 20.sp, color: Colors.white),
          title: const Text("Videos"),
          actions: const [
            Icon(Icons.domain_verification_outlined, size: 30),
          ],
        ),
        body: Container(
        color: Colors.black,
        ),
      );
  }
}

