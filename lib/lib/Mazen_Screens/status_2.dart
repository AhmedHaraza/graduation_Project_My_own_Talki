// ignore_for_file: constant_identifier_names, prefer_const_constructors, sized_box_for_whitespace, must_be_immutable

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/Navigator.dart';
import 'package:image_picker/image_picker.dart';

class StatusScreen extends StatefulWidget {
  static const String route_StatusScreen = 'StatusScreen,';
  StatusScreen({super.key});

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  List<String> items = [
    'Status privacy',
    'Settings',
  ];
 File? _image;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        Backandsubmitineditprofile(context);
        return  false;
      },
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: REdgeInsets.only(top: 45, left: 22, right: 22),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFFF4B26), width: 5.w),
                        borderRadius: BorderRadius.circular(50.r)),
                    margin: REdgeInsets.only(right: 16),
                    height: 70,
                    width: 70,
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        'My status',
                        style: TextStyle(fontSize: 20.sp, color: Colors.white),
                      ),
                      SizedBox(height: 7.h),
                      Text(
                        'Time a  go',
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    width: MediaQuery.of(context).size.width / 2.6,
                    child: PopupMenuButton(
                      onSelected: (value) {
                        if (value == 'Status privacy') {
                          Statusprivacy(context);
                        } else if (value == 'Settings') {
                          SttingMystatus(context);
                        }
                      },
                      color: Color.fromRGBO(30, 30, 30, 1),
                      itemBuilder: (BuildContext context) {
                        return items.map((item) {
                          return PopupMenuItem(
                            value: item,
                            child: Padding(
                              padding: REdgeInsets.all(10.0),
                              child: Text(
                                item,
                                style: TextStyle(
                                    color: Color(0xFFFF4B26), fontSize: 16.sp),
                              ),
                            ),
                          );
                        }).toList();
                      },
                      icon: Icon(
                        Icons.tune,
                        size: 35.sp,
                        color: Color(0xFFFF4B26),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: REdgeInsets.only(top: 30),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3.5,
                child: Column(children: [
                  Text(
                    'Recent updates',
                    style: TextStyle(color: Colors.white, fontSize: 14.sp),
                  ),
                ]),
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3.5,
                child: Column(
                  children: [
                    Text(
                      'Viewed updates ',
                      style: TextStyle(color: Colors.white, fontSize: 14.sp),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Container(
          height: 190.h,
          child: Column(children: [
            Padding(
              padding: REdgeInsets.all(10.0),
              child: CircleAvatar(
                radius: 20.r,
                backgroundColor: Color.fromRGBO(30, 30, 30, 1),
                child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed:() async {
                    final result = await FilePicker.platform.pickFiles(
                      allowMultiple: true,
                      type: FileType.image,
                    );
                    if (result == null) return;
                  },
                    icon: Icon(
                      Icons.image,
                      color: Color.fromRGBO(255, 75, 38, 1),
                      size: 25.sp,
                    )),
              ),
            ),
            Padding(
              padding: REdgeInsets.all(10.0),
              child: CircleAvatar(
                radius: 20.r,
                backgroundColor: Color.fromRGBO(30, 30, 30, 1),
                child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: ()=> iconEdit(context),
                    icon: Icon(
                      Icons.edit,
                      size: 25.sp,
                      color: Color.fromRGBO(255, 75, 38, 1),
                    )),
              ),
            ),
            Padding(
              padding: REdgeInsets.all(10.0),
              child: CircleAvatar(
                radius: 20.r,
                backgroundColor: Color.fromRGBO(30, 30, 30, 1),
                child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed:pickImage ,
                    icon: Icon(
                      Icons.photo_camera,
                      size: 25.sp,
                      color: Color.fromRGBO(255, 75, 38, 1),
                    )),
              ),
            ),
          ]),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }

  void pickImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      _image = File(image!.path);
       Navigator.of(context, rootNavigator: true).pop('dialog');
    });
  }
}
