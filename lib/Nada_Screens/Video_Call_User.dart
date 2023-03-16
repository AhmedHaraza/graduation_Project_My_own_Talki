// ignore_for_file: camel_case_types, file_names, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Video_Call_User extends StatefulWidget {
                static const String route_Video_Call_User = 'Video_Call_User';
  const Video_Call_User({super.key});
  @override
  State<Video_Call_User> createState() => _Video_Call_UserState();
}
class _Video_Call_UserState extends State<Video_Call_User> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(        
        body:
        SingleChildScrollView(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
          Container(
          height: 90.h,
          width: 360.w,
          decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(15.0.r),
          color: const Color(0xff262626),
          ),
          child: Row(
            children: [
             SizedBox(width: 30.w,),
              Container(
              width: 35.w,
              height: 30.h,
              decoration: BoxDecoration(
              border: Border.all(color: const Color(0xff4A5767),),
              color: const Color(0xff4A5767),
              borderRadius: BorderRadius.circular(10.0.r),
              ),
              child: InkWell(
              onTap: () {},
              child: Padding(
              padding: REdgeInsets.all(5.0),
              child: const Icon(Icons.arrow_back_ios_outlined,size: 20.0, color: Colors.white),
                ),
              ),
              ),
          SizedBox(width: 15.w,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            FittedBox(
            child:
            Text('Person Name',style: TextStyle(color: const Color(0xfffffdfd), fontSize: 18.sp,fontWeight: FontWeight.bold),),),
            FittedBox( 
            child: Text('• Online', style: TextStyle(color: const Color(0xffff4b26), fontSize: 15.sp,fontWeight: FontWeight.bold),),
              ),
            ],
          ),
          Expanded(child: 
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(width: 45.w),
              Ink(
              decoration: BoxDecoration(
              border: Border.all(width: 4.w),
              color: const Color(0xff262626)),
              child: InkWell(
              onTap: () {},
              child: Padding(
              padding: REdgeInsets.all(5.0),
              child: const Icon(Icons.person_add,size: 25.0, color: Colors.white),
                ),
                  ),
                      ),
              Ink(
              decoration: BoxDecoration(
              border: Border.all(width: 4.w),
              color: const Color(0xff262626)),
              child: InkWell(
              onTap: () {},
              child: Padding(
              padding: REdgeInsets.all(5.0),
              child: const Icon(Icons.chat,size: 25.0, color: Colors.white),
                ),
                  ),
                      ),
              Ink(
              decoration: BoxDecoration(
              border: Border.all(width: 4.w),
              color: const Color(0xff262626)),
              child: InkWell(
              onTap: () {},
              child: Padding(
              padding: REdgeInsets.all(5.0),
              child: const Icon( Icons.format_list_bulleted,size: 25.0, color: Colors.white),
                ),
                  ),
                      ),],),
          ),
            ],),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 500.h,),
                Container(
                  height: 90.h,
          width: 320.w,
          decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(15.0.r),
          color: const Color(0xff262626),
          ),
          child: Row(
           mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
              radius: 20.r,
              backgroundColor: Colors.black45,
              child:IconButton(
              onPressed: (){},
              icon: const Icon( Icons.volume_up,size: 25.0, color: Colors.white),
                ),
              ),
              SizedBox(width: 20.w),
              CircleAvatar(
              radius: 20.r,
              backgroundColor: Colors.black45,
              child:IconButton(
              onPressed: (){},
              icon: const Icon( Icons.videocam,size: 25.0, color: Colors.white),
                ),
              ),
              SizedBox(width: 20.w),
              CircleAvatar(
              radius: 25.r,
              backgroundColor: const Color(0xffF8000F),
              child:IconButton(
              onPressed: (){},
              icon: const Icon( Icons.phone_outlined,size: 25.0, color: Colors.white),
                ),
              ),
              SizedBox(width: 20.w),
              CircleAvatar(
              radius: 20.r,
              backgroundColor: Colors.black45,
              child:IconButton(
              onPressed: (){},
              icon: const Icon( Icons.mic,size: 25.0, color: Colors.white),
                ),
              ),
              SizedBox(width: 20.w),
              CircleAvatar(
              radius: 20.r,
              backgroundColor: Colors.black45,
              child:IconButton(
              onPressed: (){},
              icon: const Icon( Icons.fiber_manual_record,size: 25.0, color: Color(0xffFF0000)),
                ),
              ),
              ],),
                      ),
            ],
          ),
        ],),
          ),
      );
  }
}