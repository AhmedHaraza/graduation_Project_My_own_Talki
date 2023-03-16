// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/Navigator.dart';

class ChatWallPaperScreen extends StatelessWidget {
      static const String route_ChatWallPaperScreen = 'ChatWallPaperScreen';
  const ChatWallPaperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50.h,
        backgroundColor: const Color(0xff1C1C1C),
        leading: IconButton(
          onPressed: () {},
          icon:  Icon(
            Icons.arrow_back,
            size: 30.sp,
            color: const Color(0xffFF4B26),
          ),
        ),
        title:  Text(
          'Chat Wallpaper',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.translate(
              offset: const Offset(0,-60),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.4,
                height: MediaQuery.of(context).size.height / 1.6,
                child: Image.asset('assets/image/chattingTheme.png',fit: BoxFit.fill,),
              ),
            ),
            Transform.translate(
              offset: const Offset(0,-20),
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                child: InkWell(
                  onTap: ()=>TextChange(context),
                  child:  Text(
                    'Change',
                    style: TextStyle(
                      color: const Color(0xffFF4B26),
                      fontSize: 18.sp,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
