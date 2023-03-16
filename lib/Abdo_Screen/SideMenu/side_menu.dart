// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project_my_own_talki/Abdo_Screen/SideMenu/navigation_control_tabs.dart';
import 'package:graduation_project_my_own_talki/Abdo_Screen/SideMenu/user_info.dart';
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

  Color orange = const Color(0xffFF4B26);

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
            color: Colors.blueGrey,
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
                            child: const CircleAvatar(),
                          ),
                          Padding(
                            padding: REdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Transform.translate(
                                    offset: const Offset(0, -6),
                                    child: Text(
                                      userName,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Transform.translate(
                                  offset: const Offset(0, -4),
                                  child: Text(
                                    userEmail,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16.sp),
                                  ),
                                ),
                              ],
                            ),
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
          NavControllers(
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
                lightmode? provider.changeTheme('light') :provider.changeTheme('dark') ;
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
          NavControllers(
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
