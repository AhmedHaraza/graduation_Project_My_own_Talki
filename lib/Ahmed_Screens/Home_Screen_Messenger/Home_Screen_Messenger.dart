// ignore_for_file: unused_local_variable, use_key_in_widget_constructors, camel_case_types, constant_identifier_names, file_names, unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project_my_own_talki/Abdo_Screen/ChatScreen/main_chat_screen.dart';
import 'package:graduation_project_my_own_talki/Abdo_Screen/SideMenu/side_menu.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/CircleAvatar/CircleAvatar_add.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/Home_Screen_Messenger/boutonnavigationbar.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/Navigator.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/TextForm/Myform.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/my_theme.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:overlay_support/overlay_support.dart';

class Home_Screen_Messenger extends StatefulWidget {
  static const String route_Home_Messenger = 'rout_messnger';

  @override
  State<Home_Screen_Messenger> createState() => _Home_Screen_MessengerState();
}

bool isConnected = false;

class _Home_Screen_MessengerState extends State<Home_Screen_Messenger> {
  @override
  void initState() {
    super.initState();
    getAllFriends();
    InternetConnectionChecker().onStatusChange.listen((event) {
      setState(() {
        isConnected = event == InternetConnectionStatus.connected;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        endDrawer: SideMenu(),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: isConnected ? false : true,
                child: Container(
                  alignment: Alignment.center,
                  padding: REdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width,
                  color: Color.fromRGBO(255, 75, 38, 1.0),
                  child: Text(
                    'Check Your Connectivity',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: REdgeInsets.only(top: 20, left: 20),
                child: Text(
                  " Your friends",
                  style: MyThemeData.Addfriends,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: REdgeInsets.only(left: 20),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 85.h,
                  child: Row(children: [
                    Column(
                      children: [
                        InkWell(
                            onTap: () => addfriend(context),
                            child: const CircleAvatar_add()),
                        SizedBox(height: 10.h),
                        Text(
                          "Add",
                          style:
                              TextStyle(fontSize: 12.sp, color: Colors.white),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        padding: REdgeInsets.only(right: 10, left: 10),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: REdgeInsets.all(0),
                          itemCount: friendList.length,
                          itemBuilder: (context, index) {
                            var user = FirebaseAuth.instance.currentUser;
                            if (user?.email != friendList[index]['Email']) {
                              return Container(
                                width: 52.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: REdgeInsets.only(right: 10),
                                      child: InkWell(
                                        onTap: () async {
                                          Navigator.of(context)
                                              .pushReplacementNamed(
                                                  MainChatScreen
                                                      .route_MainChatScreen,
                                                  arguments: {
                                                'id':
                                                    '${friendList[index]['id']}',
                                                'First Name':
                                                    '${friendList[index]['First Name']}',
                                                'Last Name':
                                                    '${friendList[index]['Last Name']}',
                                                'Photo Url': friendList[index]
                                                    ['Photo Url'],
                                              });
                                        },
                                        child: CircleAvatar(
                                          radius: 20.r,
                                          backgroundColor: Color(0xff4D5151),
                                          backgroundImage: (friendList[index]
                                                          ['Photo Url'] ==
                                                      null ||
                                                  friendList[index]
                                                          ['Photo Url'] ==
                                                      '')
                                              ? null
                                              : NetworkImage(
                                                  '${friendList[index]['Photo Url']}'),
                                          child: (friendList[index]
                                                          ['Photo Url'] ==
                                                      null ||
                                                  friendList[index]
                                                          ['Photo Url'] ==
                                                      '')
                                              ? Icon(
                                                  Icons.person,
                                                  size: 27.sp,
                                                )
                                              : Container(),
                                        ),
                                        onLongPress: () {
                                          deletefriend(index);
                                        },
                                      ),
                                    ),
                                    Container(
                                      // width: 45.h,
                                      child: Padding(
                                        padding: REdgeInsets.only(top: 10),
                                        child: Text(
                                          '${friendList[index]['First Name']} ${friendList[index]['Last Name']}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12.sp),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            } else {
                              return Container();
                            }
                          },
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
              SizedBox(
                height: 13.h,
              ),
              Padding(
                  padding: REdgeInsets.only(left: 20, right: 20),
                  child: const Searchforcontents()),
              SizedBox(
                height: 13.h,
              ),
              Padding(
                padding: REdgeInsets.only(left: 20, bottom: 15),
                child: Text(
                  "Your Message",
                  style: MyThemeData.Addfriends,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  var friendList = [];

  getAllFriends() async {
    var user = FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user?.uid)
        .collection('Friends')
        .snapshots()
        .listen((event) {
      setState(() {
        friendList = event.docs;
      });
    });
  }

  deletefriend(Index) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Color(0xff161616),
              title: Text(
                'Are You Sure You Want To Delete This Friend  ?',
                style: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.white,
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Color.fromRGBO(255, 75, 38, 1.0)),
                    )),
                TextButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    var user = await FirebaseAuth.instance.currentUser;
                    await FirebaseFirestore.instance
                        .collection('users')
                        .doc(user?.uid)
                        .collection('Friends')
                        .doc('${friendList[Index]['id']}')
                        .delete();
                  },
                  child: Text('Yes',
                      style:
                          TextStyle(color: Color.fromRGBO(255, 75, 38, 1.0))),
                ),
              ],
            ));
  }
}
