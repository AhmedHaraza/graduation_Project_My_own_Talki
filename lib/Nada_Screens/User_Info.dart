// ignore_for_file: camel_case_types, file_names, constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class User_Info extends StatefulWidget {
  static const String route_User_Info = 'User_Info';
  User_Info(
      {super.key, this.recieverId, this.recieverPhoto, this.recieverName});
  var recieverId;
  var recieverPhoto;
  var recieverName;
  @override
  State<User_Info> createState() => _User_InfoState();
}

class _User_InfoState extends State<User_Info> {
  int index = -1;
  Color enabledColor = const Color(0xffff4b26);
  Color disableColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop();
        return true;
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(right: 10,left: 10),
          child: Column(
            children: <Widget>[
              SizedBox(height: 40.h),
              Center(
                child: CircleAvatar(
                  radius: 75.r,
                  backgroundColor: Color(0xff4D5151),
                  backgroundImage:
                      (widget.recieverPhoto == null || widget.recieverPhoto == '')
                          ? null
                          : NetworkImage('${widget.recieverPhoto}'),
                  child:
                      (widget.recieverPhoto == null || widget.recieverPhoto == '')
                          ? Icon(
                              Icons.person,
                              size: 30.sp,
                            )
                          : Container(),
                ),
              ),
              SizedBox(height: 20.h),
              FittedBox(
                child: Text(
                  widget.recieverName,
                  style: TextStyle(
                    color: const Color(0xfffffdfd),
                    fontSize: 20.sp,
                  ),
                ),
              ),
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(widget.recieverId)
                    .snapshots(),
                builder: (context, snapshot) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                      child: Icon(
                        Icons.circle,
                        color: snapshot.hasData
                            ? snapshot.data!['Status'] == 'online'
                                ? Color(0xffFF4B26)
                                : Color.fromRGBO(95, 90, 90, 1.0)
                            : null,
                        size: 18.sp,
                      ),
                    ),
                    Text(
                      snapshot.hasData ? '${snapshot.data!['Status']}' : '',
                      style: TextStyle(
                        color: snapshot.hasData
                            ? snapshot.data!['Status'] == 'online'
                                ? Color(0xffFF4B26)
                                : Color.fromRGBO(95, 90, 90, 1.0)
                            : null,
                        fontSize: 18.sp,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Ink(
                    decoration: BoxDecoration(
                        color: const Color(0xff262626)),
                    child: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: REdgeInsets.all(5.0),
                        child: const Icon(Icons.notifications,
                            size: 25.0, color: Color(0xffff4b26)),
                      ),
                    ),
                  ),
                  SizedBox(width: 40.w),
                  Ink(
                    decoration: BoxDecoration(
                        color: const Color(0xff262626)),
                    child: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: REdgeInsets.all(5.0),
                        child: const Icon(Icons.phone,
                            size: 25.0, color: Color(0xffff4b26)),
                      ),
                    ),
                  ),
                  SizedBox(width: 40.w),
                  Ink(
                    decoration: BoxDecoration(
                        color: const Color(0xff262626)),
                    child: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: REdgeInsets.all(5.0),
                        child: const Icon(Icons.videocam,
                            size: 25.0, color: Color(0xffff4b26)),
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
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            index = 0;
                          });
                        },
                        style: TextButton.styleFrom(
                          alignment: Alignment.center,
                          backgroundColor: const Color(0xff262626),
                        ),
                        child: Text(
                          'Photos',
                          style: TextStyle(
                            color: index == 0 ? enabledColor : disableColor,
                            fontSize: 15.sp,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15.w),
                    Expanded(
                      child: TextButton(
                          onPressed: () {
                            setState(() {
                              index = 1;
                            });
                          },
                          style: TextButton.styleFrom(
                            alignment: Alignment.center,
                            backgroundColor: const Color(0xff262626),
                          ),
                          child: Text(
                            'Videos',
                            style: TextStyle(
                                color: index == 1 ? enabledColor : disableColor,
                                fontSize: 15.sp),
                          )),
                    ),
                    SizedBox(width: 15.w),
                    Expanded(
                      child: TextButton(
                          onPressed: () {
                            setState(() {
                              index = 2;
                            });
                          },
                          style: TextButton.styleFrom(
                            alignment: Alignment.center,
                            backgroundColor: const Color(0xff262626),
                          ),
                          child: Text(
                            'Files',
                            style: TextStyle(
                                color: index == 2 ? enabledColor : disableColor,
                                fontSize: 15.sp),
                          )),
                    ),
                    SizedBox(width: 15.w),
                    Expanded(
                      child: TextButton(
                          onPressed: () {
                            setState(() {
                              index = 3;
                            });
                          },
                          style: TextButton.styleFrom(
                            alignment: Alignment.center,
                            backgroundColor: const Color(0xff262626),
                          ),
                          child: Text(
                            'Links',
                            style: TextStyle(
                                color: index == 3 ? enabledColor : disableColor,
                                fontSize: 15.sp),
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
