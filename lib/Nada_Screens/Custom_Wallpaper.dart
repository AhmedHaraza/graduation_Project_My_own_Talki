// ignore_for_file: file_names, camel_case_types, avoid_unnecessary_containers, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/Navigator.dart';
class Custom_Wallpaper extends StatefulWidget {
    static const String route_Custom_Wallpaper = 'Custom_Wallpaper';
  const Custom_Wallpaper({super.key});
  @override
  State<Custom_Wallpaper> createState() => _Custom_WallpaperState();
}

class _Custom_WallpaperState extends State<Custom_Wallpaper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 50.h,
          backgroundColor: const Color(0xff121212),
          leading:  InkWell(
            onTap: () => IconBacinCoustomWall(context),
            child: Icon(
              Icons.arrow_back_sharp,
              size: 25.sp,
               color:const Color(0xffff4b26)
               )
               ),
          titleTextStyle: TextStyle(fontSize: 20.sp, color: Colors.white),
          title: const Text("Custom Wallpaper"),
        ),
        body: Padding(
          padding:  REdgeInsets.all(8.0),
          child: Column(
          children: [
          SizedBox(height: 10.h),
            Container(
            child:
            Row(
              children:[
                SizedBox(width: 8.w),
            Column(
              children: [
              SizedBox(width: 5.h),
              Material(
              borderRadius: BorderRadius.circular(15.r),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child:InkWell(
              onTap:() =>ImageBrightincustomwallpaper(context),
             child: Ink.image(
              padding: REdgeInsets.all(30.0),
              image: const AssetImage('assets/image/4.jpg'),
              height: 100.h,
              width: 160.w,
              fit: BoxFit.cover,
            ),
            ),
            ),
            ],),
            SizedBox(width: 5.w),
            Expanded(child: Row(
            children: [
             SizedBox(width: 8.w),
              Material(
              borderRadius: BorderRadius.circular(15.r),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child:InkWell(
              onTap:() =>ImageDarkincustomwallpaper(context),
             child: Ink.image(
              padding: REdgeInsets.all(30.0),
              image: const AssetImage('assets/image/5.jpg'),
              height: 100.h,
              width: 160.w,
              fit: BoxFit.cover,
            ),
            ),
            ),
            ],),),
          ],),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                SizedBox(width: 7.w),
                 TextButton(
            child:
            Text('Bright', style: TextStyle(color: const Color(0xfffffdfd), fontSize: 18.sp, fontWeight: FontWeight.normal),),
            onPressed: () {},
            ), 
            SizedBox(width: 100.w),
            TextButton(
            child:
            Text('Dark', style: TextStyle(color: const Color(0xfffffdfd), fontSize: 18.sp, fontWeight: FontWeight.normal),),
            onPressed: () {
            },
            ), 
          ],),
               SizedBox(height: 10.h),
          Container( 
          child: Row(
            children: [
             SizedBox(width: 8.w),
              Material(
              borderRadius: BorderRadius.circular(15.r),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child:InkWell(
              onTap:()=>ImageSolidincustomwallpaper(context),
             child: Ink.image(
              padding: REdgeInsets.all(30.0),
              image: const AssetImage('assets/image/6.jpg'),
              height: 100.h,
              width: 160.w,
              fit: BoxFit.cover,
            ),
            ),
            ),
            SizedBox(width: 5.w),
            Expanded(child: Row(
            children: [
             SizedBox(width: 8.w),
              Material(
              borderRadius: BorderRadius.circular(15.r),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child:InkWell(
              onTap:() {},
             child: Ink.image(
              padding: REdgeInsets.all(30.0),
              image: const AssetImage('assets/image/3.jpg'),
              height: 100.h,
              width: 160.w,
              fit: BoxFit.cover,
            ),
            ),
            ),
            ],),),
            ],),
          ),
              Row(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                SizedBox(width: 7.w),
                 TextButton(
            child:
            Text('Solid Color', style: TextStyle(color: const Color(0xfffffdfd), fontSize: 18.sp,fontWeight: FontWeight.normal),),
            onPressed: () {
            },
            ), 
            SizedBox(width: 70.w),
            TextButton(
            child:
            Text('My Photos', style: TextStyle(color: const Color(0xfffffdfd), fontSize: 18.sp,fontWeight: FontWeight.normal),),
            onPressed: () {
            },
            ), 
          ],),
          SizedBox(height: 40.h),
          Container(
          child: 
          Row(children: [
          SizedBox(width: 10.w),
           Icon(Icons.image_outlined,size: 25.0.sp, color: Colors.white,),  
          SizedBox(width: 10.w),
          FittedBox(
            child:
            Text('Default Wallpaper', style: TextStyle(color: const Color(0xfffffdfd), fontSize: 20.sp,),),
          ),
          ],),
          ),
          ],),
        ),
       );
  }
}
