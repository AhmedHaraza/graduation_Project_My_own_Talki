// ignore_for_file: camel_case_types, file_names, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class User_Info extends StatefulWidget {
            static const String route_User_Info = 'User_Info';
  const User_Info({super.key});
  @override
  State<User_Info> createState() => _User_InfoState();
}
class _User_InfoState extends State<User_Info> {
   int index = -1;
   Color enabledColor = const Color(0xffff4b26);
   Color disableColor =  Colors.white;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(        
        body:Column(
        children: <Widget> [
        SizedBox(height: 40.h),
        Center(
        child: CircleAvatar(
        backgroundImage: const AssetImage("assets/image/1.jpg"),
        radius: 70.r,
          ),), 
        SizedBox(height: 20.h),
        FittedBox(
          child:
          Text('Conner Frazier', style: TextStyle(color: const Color(0xfffffdfd), fontSize: 20.sp,),),
        ),
         FittedBox(
          child: Text(' • Online', style: TextStyle(color: const Color(0xffff4b26), fontSize: 18.sp,),
            ),),
          SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget> [ Ink(
              decoration: BoxDecoration(
              border: Border.all(width: 4.w),
              color: const Color(0xff262626)),
              child: InkWell(
              onTap: () {},
              child: Padding(
              padding: REdgeInsets.all(5.0),
              child: const Icon(Icons.notifications,size: 25.0, color: Color(0xffff4b26)),
                ),
                  ),
                    ),
              SizedBox(width: 40.w),
              Ink(
              decoration: BoxDecoration(
              border: Border.all(width: 4.w),
              color: const Color(0xff262626)),
              child: InkWell(
              onTap: () {},
              child: Padding(
              padding: REdgeInsets.all(5.0),
              child: const Icon(Icons.phone,size: 25.0, color: Color(0xffff4b26)),
                ),
                  ),
                      ),
              SizedBox(width: 40.w),
              Ink(
              decoration: BoxDecoration(
              border: Border.all(width: 4.w),
              color: const Color(0xff262626)
              ),
              child: InkWell(
              onTap: () {},
              child: Padding(
              padding: REdgeInsets.all(5.0),
              child: const Icon(Icons.videocam,size: 25.0, color: Color(0xffff4b26)),
                ),
                  ),
                      ),
                    ],
                      ),
    SizedBox(height: 30.h),
     Container(
      height: 50.h,
      width: 700.w,
          decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(15.0.r),
          color: const Color(0xff262626),
          ),
          child: Row(
          children: [
            Expanded(child: TextButton(onPressed: (){
              setState(() {
                index =0;
              });
            }, 
        style: TextButton.styleFrom(
          alignment: Alignment.center,
          backgroundColor: const Color(0xff262626),
        ),
        child: Text('Photos',style: TextStyle(color: index ==0 ? enabledColor:disableColor, fontSize: 15.sp,
        ),),
        ),),
        SizedBox(width: 15.w),
        Expanded(child: TextButton(onPressed: (){
          setState(() {
                index =1;
        }); 
        },
        style: TextButton.styleFrom(
          alignment: Alignment.center,
          backgroundColor: const Color(0xff262626),
        ),
        child: Text('Videos',style: TextStyle(color: index ==1 ? enabledColor:disableColor, fontSize: 15.sp),)),),
        SizedBox(width: 15.w),
        Expanded(child: TextButton(onPressed: (){
          setState(() {
                index =2;
        }); 
        }, 
        style: TextButton.styleFrom(
          alignment: Alignment.center,
          backgroundColor: const Color(0xff262626),
        ),
        child: Text('Files',style: TextStyle(color: index ==2 ? enabledColor:disableColor, fontSize: 15.sp),)),),
        SizedBox(width: 15.w),
        Expanded(child: TextButton(onPressed: (){
          setState(() {
                index =3;
        }); 
        }, 
        style: TextButton.styleFrom(
          alignment: Alignment.center,
          backgroundColor: const Color(0xff262626),
        ),
        child: Text('Links',style: TextStyle(color: index ==3 ? enabledColor:disableColor, fontSize: 15.sp),)),),
          ],
        ),
        ),
      ],),
      );
  }
}