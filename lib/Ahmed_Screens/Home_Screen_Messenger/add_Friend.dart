// ignore_for_file: constant_identifier_names, file_names, unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/Home_Screen_Messenger/boutonnavigationbar.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/Navigator.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/TextForm/Myform.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/my_theme.dart';

class Addfrinds extends StatefulWidget {
  static const String route_Add_frinds = 'rout_Add_frinds';

  const Addfrinds({Key? key}) : super(key: key);

  @override
  State<Addfrinds> createState() => _AddfrindsState();
}

class _AddfrindsState extends State<Addfrinds> {
  var userList = [];

  getAllUsers() async {
    var user = FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance
        .collection('users')
        .snapshots()
        .listen((event) {
      setState(() {
        userList = event.docs;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: WillPopScope(
          onWillPop: () async {
            Backandsubmitineditprofile(context);
            return true;
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Padding(
              padding: REdgeInsets.only(top: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: REdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      "Add friends",
                      style: MyThemeData.Addfriends,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: REdgeInsets.only(left: 20, right: 20, bottom: 10),
                    child: Container(height: 40.h, child: const Search()),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: REdgeInsets.only(left: 20, right: 20, bottom: 10),
                    child: Text(
                      "People you might know",
                      style: MyThemeData.Addfriends,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: ListView.builder(
                        padding: REdgeInsets.all(0),
                        itemCount: userList.length,
                        itemBuilder: (context, index) {
                          var user = FirebaseAuth.instance.currentUser;
                          if (user?.email != userList[index]['Email']) {
                            return ListTile(
                              onTap: null,
                              leading: CircleAvatar(
                                radius: 25.r,
                                backgroundColor: Color(0xff4D5151),
                                backgroundImage:
                                    (userList[index]['Photo Url'] == null ||
                                            userList[index]['Photo Url'] == '')
                                        ? null
                                        : NetworkImage(
                                            '${userList[index]['Photo Url']}'),
                                child: (userList[index]['Photo Url'] == null ||
                                        userList[index]['Photo Url'] == '')
                                    ? Icon(
                                        Icons.person,
                                        size: 30.sp,
                                      )
                                    : Container(),
                              ),
                              title: Text(
                                '${userList[index]['First Name']} ${userList[index]['Last Name']}',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              subtitle: Text(
                                'Hello there!',
                                style: TextStyle(
                                    color:
                                        const Color.fromRGBO(255, 75, 38, 1.0)),
                              ),
                              trailing: InkWell(
                                onTap: () async {
                                  await addFriend(index);
                                  final snackBar = SnackBar(
                                    backgroundColor: Color(0xff1C1C1C),
                                      content: Text(
                                        'Friend has been successfully added',
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      duration: Duration(seconds: 2));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                                child: CircleAvatar(
                                  radius: 18.r,
                                  backgroundColor:
                                      const Color.fromRGBO(255, 75, 38, 1.0),
                                  child: Icon(
                                    Icons.add,
                                    size: 35.sp,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return Container();
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  addFriend(Index) async {
    var user = await FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user?.uid)
        .collection('Friends')
        .doc('${userList[Index]['id']}')
        .set({
      'id': '${userList[Index]['id']}',
      'First Name': '${userList[Index]['First Name']}',
      'Last Name': '${userList[Index]['Last Name']}',
      'Email': '${userList[Index]['Email']}',
      'Photo Url': userList[Index]['Photo Url'],
    });
  }
}
