// ignore_for_file: camel_case_types, file_names, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Group_Info extends StatefulWidget {
      static const String route_Group_Info = 'Group_Info';
  const Group_Info({super.key});
  @override
  State<Group_Info> createState() => _Group_InfoState();
}
class _Group_InfoState extends State<Group_Info> {
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
        backgroundImage: const AssetImage("assets/image/2.jpg"),
        radius: 70.r,
          ),), 
        SizedBox(height: 20.h),
        FittedBox(
          child:
          Text('Group Name', style: TextStyle(color: const Color(0xfffffdfd), fontSize: 20.sp,),),
        ),
          SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget> [ Ink(
              decoration: BoxDecoration(
              border: Border.all(width: 4.w),
              color: const Color(0xff262626)),
              child: InkWell(
              onTap: () {},
              child: Padding(
              padding: REdgeInsets.all(5.0),
              child:   Icon(Icons.add,size: 25.0.sp, color:const Color(0xffff4b26)),
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
              child:  Icon(Icons.videocam,size: 25.0.sp, color: const Color(0xffff4b26)),
                ),
                  ),
                      ),
                    ],
                      ),
     SizedBox(height: 20.h),
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
        child: Text('Media',style: TextStyle(color: index ==0 ? enabledColor:disableColor, fontSize: 15.sp,
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
        child: Text('Files',style: TextStyle(color: index ==1 ? enabledColor:disableColor, fontSize: 15.sp),)),),
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
        child: Text('Music',style: TextStyle(color: index ==2 ? enabledColor:disableColor, fontSize: 15.sp),)),),
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
        SizedBox(width: 15.w),
        Expanded(child: TextButton(onPressed: (){
          setState(() {
                index =4;
        }); 
        }, 
        style: TextButton.styleFrom(
          alignment: Alignment.center,
          backgroundColor: const Color(0xff262626),
        ),
        child: Text('Voice',style: TextStyle(color: index ==4 ? enabledColor:disableColor, fontSize: 15.sp),)),),
          ],
        ),
        ),
      Row(
      mainAxisAlignment: MainAxisAlignment.end,
        children: [ 
      TextButton(onPressed: (){},
          style: TextButton.styleFrom(
            alignment: Alignment.bottomLeft,
          ),
          child: Text('Show All', textAlign: TextAlign.left,
          style: TextStyle(color: const Color(0xffff4b26), fontSize: 15.sp),)),
        ],),      
      SizedBox(height: 40.h),
       Row(
       mainAxisAlignment: MainAxisAlignment.start,
          children: [
        Text('    Members', textAlign: TextAlign.left,
            style: TextStyle(color: const Color(0xfffffdfd), fontSize: 25.sp),),
            Expanded(child: 
      Row(
       mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(onPressed: () {}, 
            icon: const Icon(Icons.search, color: Colors.white)),
          ],
      ),
      ),
          ],
      ),
      
      ],),
       bottomNavigationBar: BottomAppBar(
        color: const Color(0xff5f5a5a),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
        children: [
        SizedBox(width: 10.w, height: 50.h,),
        TextButton.icon(onPressed: (){}, 
        icon: const Icon(Icons.exit_to_app, color:Color(0xffff4b26)),
        label: Text('Exit From Group',style: TextStyle(color:const Color(0xffff4b26), fontSize: 20.sp),),
        ),
        ],
        ),
      ),
      );
  }
}