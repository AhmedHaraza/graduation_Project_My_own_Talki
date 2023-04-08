// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors_in_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project_my_own_talki/Abdo_Screen/EditProfileScreen/edit_profile_screen.dart';
import 'package:graduation_project_my_own_talki/Abdo_Screen/SideMenu/navigation_control_tabs.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/create%20an%20account.dart';
import 'package:graduation_project_my_own_talki/provider/myprovider.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatefulWidget {
  SideMenu({super.key});
  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  bool lightmode = false;
  bool notifications = false;
  bool _Editprofilevisiblty = true;
  Color orange = const Color(0xffFF4B26);
  String? firstName;
  String? lastName;
  String? email;
  var userRef = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    var user = FirebaseAuth.instance.currentUser;
    List<UserInfo> providerData = user!.providerData;
    for (UserInfo userInfo in providerData) {
      if (userInfo.providerId == "google.com") {
        // The user is signed in with Google.
        getGoogleUserInfo();
        EditproFileVisiblty();
      } else if (userInfo.providerId == "facebook.com") {
        // The user is signed in with FaceBook.
        getFaceBookUserInfo();
        EditproFileVisiblty();
      } else {
        getUserInfo();
      }
    }
  }

  getUserInfo() async {
    var user = await FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user?.uid)
        .snapshots()
        .listen((event) {
      setState(() {
        firstName = event['First Name'];
        lastName = event['Last Name'];
        email = event['Email'];
      });
    });
  }

  getGoogleUserInfo() async {
    var user = await FirebaseAuth.instance.currentUser;
    setState(() {
      firstName = user?.displayName;
      lastName = '';
      email = user?.email;
    });
  }

  getFaceBookUserInfo() async {
    var user = await FirebaseAuth.instance.currentUser;
    setState(() {
      firstName = user?.displayName;
      lastName = '';
      email = user?.email;
    });
  }

  EditproFileVisiblty() {
    setState(() {
      _Editprofilevisiblty = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    myprovider provider = Provider.of<myprovider>(context);

    return Drawer(
      width: MediaQuery.of(context).size.width / 1.2,
      backgroundColor: const Color(0xff161616),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          bottomLeft: const Radius.circular(16),
        ),
      ),
      child: ListView(
        children: [
          Container(
            color: Color(0xffff4b26),
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 5.5,
            child: Stack(
              children: [
                // Image.network(
                //   profilePicture,
                //   fit: BoxFit.fitWidth,
                // ),
                LayoutBuilder(
                  builder: (context, constrains) => Container(
                    width: constrains.maxWidth,
                    height: constrains.maxHeight / 1.5,
                    // color: Colors.red,
                    child: Padding(
                      padding: REdgeInsets.all(10),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 70.w,
                            height: 70.h,
                            child: CircleAvatar(
                              backgroundColor: Color(0xff4D5151),
                              backgroundImage: (userRef?.photoURL == null ||
                                      userRef?.photoURL == '')
                                  ? null
                                  : NetworkImage('${userRef?.photoURL}'),
                              child: (userRef?.photoURL == null ||
                                      userRef?.photoURL == '')
                                  ? Icon(
                                      Icons.person,
                                      size: 50.sp,
                                    )
                                  : Container(),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                margin: REdgeInsets.only(left: 10),
                                child: Text(
                                  (firstName == 'null' && lastName == 'null') ||
                                          (firstName == null &&
                                              lastName == null)
                                      ? ''
                                      : '$firstName $lastName',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                margin: REdgeInsets.only(left: 10),
                                width: 190.w,
                                child: Text(
                                  email == 'null' || email == null
                                      ? ''
                                      : email.toString(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.sp),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.white,
            thickness: 2,
          ),
          //1
          Visibility(
            visible: _Editprofilevisiblty,
            child: NavControllers(
              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: Icon(
                  Icons.manage_accounts,
                  color: Colors.white,
                  size: 16.sp,
                ),
              ),
              'Edit profile information',
              Icon(
                Icons.arrow_forward_ios,
                size: 16.sp,
                color: Colors.white,
              ),
            ),
          ),
          //2
          NavControllers(
            Padding(
              padding: const EdgeInsets.only(top: 3),
              child: Icon(
                Icons.light_mode,
                color: Colors.white,
                size: 16.sp,
              ),
            ),
            'Light Mode',
            Switch(
              onChanged: (bool value) {
                setState(() {
                  lightmode = value;
                });
                lightmode
                    ? provider.changeTheme('light')
                    : provider.changeTheme('dark');
              },
              value: lightmode,
              activeTrackColor: orange,
              thumbColor: MaterialStateProperty.all(Colors.white),
            ),
          ),
          //3
          NavControllers(
            Padding(
              padding: const EdgeInsets.only(top: 3),
              child: Icon(
                Icons.notifications,
                color: Colors.white,
                size: 16.sp,
              ),
            ),
            'Notifications',
            Switch(
              onChanged: (bool value) {
                setState(() {
                  notifications = value;
                });
              },
              value: notifications,
              activeTrackColor: orange,
              thumbColor: MaterialStateProperty.all(Colors.white),
            ),
          ),
          //4
          NavControllers(
            Padding(
              padding: const EdgeInsets.only(top: 3),
              child: Icon(
                Icons.translate,
                color: Colors.white,
                size: 16.sp,
              ),
            ),
            'language',
            Text(
              'English',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
              ),
            ),
          ),
          //5
          Visibility(
            visible: _Editprofilevisiblty,
            child: NavControllers(
              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: Icon(
                  Icons.lock,
                  color: Colors.white,
                  size: 16.sp,
                ),
              ),
              'Change password',
              Icon(
                Icons.arrow_forward_ios,
                size: 16.sp,
                color: Colors.white,
              ),
            ),
          ),
          //6
          NavControllers(
            Padding(
              padding: const EdgeInsets.only(top: 3),
              child: Icon(
                Icons.maps_ugc,
                color: Colors.white,
                size: 16.sp,
              ),
            ),
            'Broadcast Message',
            Icon(
              Icons.arrow_forward_ios,
              size: 16.sp,
              color: Colors.white,
            ),
          ),
          //7
          NavControllers(
            Padding(
              padding: const EdgeInsets.only(top: 3),
              child: Icon(
                Icons.logout,
                color: Colors.white,
                size: 16.sp,
              ),
            ),
            'Log Out',
            Icon(
              Icons.arrow_forward_ios,
              size: 16.sp,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
