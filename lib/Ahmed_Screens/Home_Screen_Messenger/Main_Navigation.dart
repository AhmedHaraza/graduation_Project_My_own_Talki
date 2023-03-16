// ignore_for_file: dead_code, camel_case_types, override_on_non_overriding_member, implementation_imports, unnecessary_import, unused_import, use_key_in_widget_constructors, annotate_overrides, file_names, constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project_my_own_talki/Abdo_Screen/SideMenu/side_menu.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/Home_Screen_Messenger/Chat.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/Home_Screen_Messenger/Group.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/Home_Screen_Messenger/Home_Screen_Messenger.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/Home_Screen_Messenger/boutonnavigationbar.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/Navigator.dart';
import 'package:graduation_project_my_own_talki/main.dart';

  int currentIndex = 0;
class my_main extends StatefulWidget {
  static const String route_my_main = 'my_mainState';
  @override
  State<my_main> createState() => _my_mainState();
}

class _my_mainState extends State<my_main> {
  @override
  Icon Iconchat = Icon(
    Icons.maps_ugc,
    size: 25.sp,
  );
  Icon Iconadd = Icon(
    Icons.add,
    size: 40.sp,
  );
  Icon Iconphone = Icon(
    Icons.call,
    size: 30.sp,
  );
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromRGBO(255, 75, 38, 1.0),
          onPressed: () {
            if (currentIndex == 0) {
              addstatus(context);
            } else if (currentIndex == 1) 
            {
              CallSomePeople(context);
            } else if (currentIndex == 2) {
              addyourgroup(context);
            }
          },
          child: currentIndex == 2
              ? Iconadd
              : (currentIndex == 1)
                  ? Iconphone
                  : Iconchat),
      endDrawer: SideMenu(),
      key: _key,
      body: tabs[currentIndex],
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xff1C1C1C),
        notchMargin: 5.r,
        shape: const CircularNotchedRectangle(),
        child: BottomNavigationBar(
            selectedIconTheme: const IconThemeData(color: Color(0xffFF4B26)),
            fixedColor: Colors.white,
            unselectedItemColor: Colors.white,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                if (index < 3) {
                  currentIndex = index;
                  _key.currentState!.closeDrawer();
                } else {
                  _key.currentState!.openEndDrawer();
                }
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.chat,
                  size: 30.sp,
                ),
                label: "Chat",
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.call,
                    size: 30.sp,
                  ),
                  label: "Call"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.groups,
                    size: 30.sp,
                  ),
                  label: "Groups"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.menu,
                    size: 30.sp,
                  ),
                  label: "Menu"),
            ]),
      ),
    );
  }

  List<Widget> tabs = [
    Home_Screen_Messenger(),
    const Chat(),
    const Group(),
  ];
}
