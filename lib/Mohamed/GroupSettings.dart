// ignore_for_file: file_names, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GroupSettings extends StatefulWidget {
  static const String route_GroupSettings = 'GroupSettings';
  const GroupSettings({Key? key}) : super(key: key);

  @override
  State<GroupSettings> createState() => _GroupSettingsState();
}

class _GroupSettingsState extends State<GroupSettings> {
  bool? All_participants = false;
  bool? Only_admins = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Group Settings', style: TextStyle(fontSize: 25.sp)),
        leading: Container(
          margin: REdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60.r),
              boxShadow: [
                BoxShadow(
                    color: const Color.fromRGBO(255, 75, 38, 1.0),
                    spreadRadius: 3.r,
                    blurRadius: 5.r,
                    offset: const Offset(0.0, 0.0))
              ]),
          child: InkWell(
            onTap: () {},
            child: CircleAvatar(
              backgroundColor: Colors.deepOrange,
              child: Icon(
                Icons.arrow_back,
                size: 25.sp,
                color: Colors.white,
              ),
            ),
          ),
        ),
        backgroundColor: const Color(0xff1C1C1C),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            InkWell(
              onTap: () {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) => StatefulBuilder(
                      builder: (BuildContext context, void Function(void Function()) setState) =>AlertDialog(
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Color(0xffFF4B26), width: 3)),
                            backgroundColor: Color(0xff0E0E0E),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Edit Group Info',
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(height: 12.h),
                                Row(
                                  children: [
                                    Flexible(
                                        child: Text(
                                      'Choose who can change this group’s subject,icon, description and disappearing messages setting.',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color: Colors.white.withOpacity(0.5)),
                                    ))
                                  ],
                                ),
                                Theme(
                                  data: ThemeData(
                                    unselectedWidgetColor: Colors.white
                                  ),
                                  child: CheckboxListTile(
                                    selected: All_participants!,
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    title: Text(
                                      "All participants",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    value: All_participants,
                                    onChanged: (val) {
                                      All_participants = val;
                                      setState(() {});
                                    },
                                    activeColor: Color(0xffFF4B26),
                                    checkColor: Colors.white,
                                  ),
                                ),
                                Theme(
                                  data: ThemeData(
                                    unselectedWidgetColor: Colors.white
                                  ),
                                  child: CheckboxListTile(
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    title: Text(
                                      "Only Admins",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    value: Only_admins,
                                    onChanged: (val) {
                                      Only_admins = val;
                                      setState(() {});
                                    },
                                    activeColor: Color(0xffFF4B26),
                                    checkColor: Colors.white,
                                  ),
                                )
                              ],
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () => Navigator.pop(context, false),
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                        color: Color(0xffFF4B26),
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold),
                                  )),
                              TextButton(
                                onPressed: () => Navigator.pop(context, true),
                                child: Text('Ok',
                                    style: TextStyle(
                                        color: Color(0xffFF4B26),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.sp)),
                              ),
                            ],
                          ),
                    ));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: REdgeInsets.only(top: 20),
                padding: REdgeInsets.all(15),
                color: const Color(0xff1C1C1C),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: REdgeInsets.all(5.0),
                      child: Text(
                        "Edit Group info",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Padding(
                      padding: REdgeInsets.all(5.0),
                      child: Text(
                        "All Participants",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) => StatefulBuilder(
                      builder: (context, setState) => AlertDialog(
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Color(0xffFF4B26), width: 3)),
                            backgroundColor: Color(0xff0E0E0E),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Send messages',
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(height: 12.h),
                                Row(
                                  children: [
                                    Flexible(
                                        child: Text(
                                      'Choose who can send messages to this group',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color: Colors.white.withOpacity(0.5)),
                                    ))
                                  ],
                                ),
                                Theme(
                                  data: ThemeData(
                                    unselectedWidgetColor: Colors.white
                                  ),
                                  child: CheckboxListTile(
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    title: Text(
                                      "All participants",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    value: All_participants,
                                    onChanged: (val) {
                                      setState(() {
                                        All_participants = val;
                                      });
                                    },
                                    activeColor: Color(0xffFF4B26),
                                    checkColor: Colors.white,
                                  ),
                                ),
                                Theme(
                                  data: ThemeData(
                                    unselectedWidgetColor: Colors.white
                                  ),
                                  child: CheckboxListTile(
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    title: Text(
                                      "Only Admins",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    value: Only_admins,
                                    onChanged: (val) {
                                      setState(() {
                                        Only_admins = val;
                                      });
                                    },
                                    activeColor: Color(0xffFF4B26),
                                    checkColor: Colors.white,
                                  ),
                                )
                              ],
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () => Navigator.pop(context, false),
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                        color: Color(0xffFF4B26),
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold),
                                  )),
                              TextButton(
                                onPressed: () => Navigator.pop(context, true),
                                child: Text('Ok',
                                    style: TextStyle(
                                        color: Color(0xffFF4B26),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.sp)),
                              ),
                            ],
                          ),
                    ));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: REdgeInsets.only(top: 20),
                padding: REdgeInsets.all(15),
                color: const Color(0xff1C1C1C),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: REdgeInsets.all(5.0),
                      child: Text(
                        "Send messages",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Padding(
                      padding: REdgeInsets.all(5.0),
                      child: Text(
                        "All Participants",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: 100.h,
                width: MediaQuery.of(context).size.width,
                margin: REdgeInsets.only(top: 20),
                padding: REdgeInsets.all(15),
                color: const Color(0xff1C1C1C),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: REdgeInsets.all(5.0),
                      child: Text(
                        "Edit group admin",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
