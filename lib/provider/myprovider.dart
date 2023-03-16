import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project_my_own_talki/Abdo_Screen/GroupChatScreen/popup_menue.dart';
class myprovider extends ChangeNotifier {
  ThemeMode theme = ThemeMode.dark;

  void changeTheme(String theme) {
    if (theme == "light") {
      this.theme = ThemeMode.light;
    } else if (theme == 'dark') {
      this.theme = ThemeMode.dark;
    } else {
      this.theme = ThemeMode.system;
    }
    notifyListeners();
  }

  bool IsSearch = false;
  Widget Searchapp = SizedBox(
    height: 35.h,
    child: TextField(
      style: TextStyle(color: Colors.white.withOpacity(0.5)),
      decoration: InputDecoration(
          fillColor: Color(0xff1C1C1C),
          filled: true,
          hintText: 'Search',
          contentPadding: REdgeInsets.only(top: 15, left: 10),
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: Colors.transparent)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(
                color: Colors.transparent,
              ))),
    ),
  );
  void Searchmethod() {
    IsSearch = !IsSearch;
    notifyListeners();
  }

  //appbar group
  PreferredSizeWidget appbar = AppBar(
    backgroundColor: Color(0xff1C1C1C),
    leading: Container(
      margin: const EdgeInsets.all(7),
      child: InkWell(onTap: () {}, child: const CircleAvatar()),
    ),
    title: InkWell(
      onTap: () {},
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: const Text(
              'Group Name',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Text(
            'member 1 , member 2 , and 11 more',
            style: TextStyle(
              color: Color(0xffFF4B26),
              fontSize: 16,
            ),
          ),
        ],
      ),
    ),
    actions: [
      IconButton(
        constraints: const BoxConstraints(),
        onPressed: () {},
        icon: const Icon(
          Icons.videocam_outlined,
          color: Color(0xFFFF4B26),
          size: 34,
        ),
      ),
      Container(
        margin: const EdgeInsets.only(left: 10),
        child: IconButton(
          constraints: const BoxConstraints(),
          onPressed: () {},
          icon: const Icon(
            Icons.add_call,
            color: Color(0xFFFF4B26),
            size: 25,
          ),
        ),
      ),
      Container(constraints: const BoxConstraints(), child: PopUpMenu()),
    ],
  );
  PreferredSizeWidget appbar1 = AppBar(
    backgroundColor: Color(0xff1C1C1C),
    leading: Container(
      margin: const EdgeInsets.all(7),
      child: InkWell(onTap: () {}, child: const CircleAvatar()),
    ),
    title: InkWell(
      onTap: () {},
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: const Text(
              'Connor Frazier',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                child: const Icon(
                  Icons.circle,
                  color: Color(0xffFF4B26),
                  size: 12,
                ),
              ),
              const Text(
                'Online',
                style: TextStyle(
                  color: Color(0xffFF4B26),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
    actions: [
      IconButton(
        constraints: const BoxConstraints(),
        onPressed: () {},
        icon: const Icon(
          Icons.videocam_outlined,
          color: Color(0xFFFF4B26),
          size: 34,
        ),
      ),
      Container(
        margin: const EdgeInsets.only(left: 10),
        child: IconButton(
          constraints: const BoxConstraints(),
          onPressed: () {},
          icon: const Icon(
            Icons.add_call,
            color: Color(0xFFFF4B26),
            size: 25,
          ),
        ),
      ),
      Container(constraints: const BoxConstraints(), child: PopUpMenu()),
    ],
  );
  PreferredSizeWidget appbar2 = AppBar(
    backgroundColor: Color(0xff1C1C1C),
    leading: arrowabck,
    title: SizedBox(
      height: 35.h,
      child: TextField(
        style: TextStyle(color: Colors.white.withOpacity(0.5)),
        decoration: InputDecoration(
            fillColor: Color(0xff1C1C1C),
            filled: true,
            hintText: 'Search',
            contentPadding: REdgeInsets.only(top: 15, left: 10),
            hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(color: Color(0xff000000))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(
                  color: Color(0xff000000),
                ))),
      ),
    ),
    actions: [
      IconButton(
        constraints: BoxConstraints(),
        onPressed: () {},
        icon: Icon(
          Icons.close,
          size: 20,
        ),
        color: Color(0xFFFF4B26),
      ),
      IconButton(
        constraints: BoxConstraints(),
        onPressed: () {},
        icon: Icon(Icons.arrow_drop_down),
        color: Color(0xFFFF4B26),
      ),
      IconButton(
        constraints: BoxConstraints(),
        onPressed: () {},
        icon: Icon(Icons.arrow_drop_up),
        color: Color(0xFFFF4B26),
      ),
    ],
  );

  void switch_app_scearch() {
    appbar = appbar2;
    notifyListeners();
  }

  void switch_app2() {
    appbar = appbar1;
    notifyListeners();
  }
}
Widget arrowabck = IconButton(
      constraints: BoxConstraints(),
      onPressed: () {
      },
      icon: Icon(
        Icons.arrow_back,
      ),
      color: Color(0xFFFF4B26),
    );