// ignore_for_file: constant_identifier_names, prefer_const_literals_to_create_immutables, file_names, prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/Home_Screen_Messenger/boutonnavigationbar.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/TextForm/Myform.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/my_theme.dart';

class Chat extends StatefulWidget {
  static const String route_Chat = 'rout_Chat';
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TabController tabcontroller = TabController(length: 3, vsync: this);
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: Padding(
            padding: REdgeInsets.only(top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: REdgeInsets.only(left: 20, right: 10, bottom: 5),
                      child: Text("Contacts", style: MyThemeData.TextContacts),
                    ),
                    Expanded(
                      child: Container(
                          margin: REdgeInsets.only(right: 10, top: 2),
                          height: 35.h,
                          width: 20.w,
                          child: Search_chat()),
                    )
                  ],
                ),
                Container(
                  margin: REdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(36, 36, 36, 1.0),
                      borderRadius: BorderRadius.circular(5.r)),
                  child: Column(
                    children: [
                      Padding(
                        padding: REdgeInsets.all(5),
                        child: TabBar(
                          unselectedLabelColor: Colors.white,
                          labelColor: Colors.white,
                          indicatorColor: Colors.red,
                          indicatorWeight: 5,
                          indicator: BoxDecoration(
                              color: const Color.fromRGBO(255, 75, 38, 1.0),
                              borderRadius: BorderRadius.circular(5.r)),
                          controller: tabcontroller,
                          tabs: [
                            const Tab(
                              text: "All",
                            ),
                            const Tab(
                              text: "Favorites",
                            ),
                            const Tab(
                              text: "Recents",
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
