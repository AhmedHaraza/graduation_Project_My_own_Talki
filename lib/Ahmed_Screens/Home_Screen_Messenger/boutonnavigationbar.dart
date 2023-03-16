// // ignore_for_file: camel_case_types, use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_constructors, unused_import

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:graduation_project_my_own_talki/Ahmed_Screens/Home_Screen_Messenger/Chat.dart';
// import 'package:graduation_project_my_own_talki/Ahmed_Screens/Home_Screen_Messenger/Home_Screen_Messenger.dart';

// class bouton_navigation_bar extends StatefulWidget {
//   @override
//   State<bouton_navigation_bar> createState() => _bouton_navigation_barState();
// }

// class _bouton_navigation_barState extends State<bouton_navigation_bar> {
//   int currentIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // padding:  REdgeInsets.only(bottom:22),
//       child: BottomNavigationBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0.0,
//           type: BottomNavigationBarType.fixed,
//           currentIndex: currentIndex,
//           onTap: (index) {
//             currentIndex = index;
//             setState(() {});
//           },
//           items: [
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.chat,
//                 size: 30.sp,
//               ),
//               label: "Chat",
//             ),
//             BottomNavigationBarItem(
//                 icon: Icon(
//                   Icons.call,
//                   size: 30.sp,
//                 ),
//                 label: "Call"),
//             BottomNavigationBarItem(
//                 icon: Icon(
//                   Icons.groups,
//                   size: 30.sp,
//                 ),
//                 label: "Groups"),
//             BottomNavigationBarItem(
//                 icon: Icon(
//                   Icons.menu,
//                   size: 30.sp,
//                 ),
//                 label: "Menu"),
//           ]
//           ),
//     );
//   }
// }
