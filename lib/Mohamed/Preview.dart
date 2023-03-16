// ignore_for_file: file_names, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Preview extends StatelessWidget {
          static const String route_Preview = 'Preview';
  const Preview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text('Preview'),
          leading:  IconButton(icon: Icon(
            Icons.arrow_back,
            size: 35.sp,
          ),
          onPressed: (){},
          ),
          backgroundColor: const Color(0xffff4928),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.black87,
          child: Stack(
            children: [
              // Image.network(
              //   "https://images.pexels.com/photos/1122639/pexels-photo-1122639.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
              //   height: double.infinity,
              // ),
              Positioned(
                bottom: 20,
                right: MediaQuery.of(context).size.width / 3,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
                        side:  BorderSide(
                          width: 2.w,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text("Set Wellpaper"),
                ),
              )
            ],
          ),
        ),
      );
  }
}
