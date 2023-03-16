// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:graduation_project_my_own_talki/Abdo_Screen/SideMenu/changelanguage.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/Navigator.dart';

class NavControllers extends StatelessWidget {
  Widget Leading;
  String Title;
  Widget Ending;

  NavControllers(this.Leading, this.Title, this.Ending, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: REdgeInsets.only(left: 20, right: 25),
      onTap: () async {
        if (Title == "Edit profile information") {
          Editprofile(context);
        } else if (Title == "Change password") {
          changepassword(context);
        } else if (Title == "Broadcast Message") {
          Broadcastmessage(context);
        } else if (Title == "Log Out") {
          await GoogleSignIn().signOut();
          await FirebaseAuth.instance.signOut();
          Select_Screen_Sin_In(context);
        } else if (Title == "language") {
          showModalBottomSheet(
              context: context,
              builder: (context) => mylanguage(),
              backgroundColor: Colors.transparent,
              constraints: BoxConstraints());
        }
      },
      leading: Leading,
      title: Text(
        Title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.sp,
        ),
      ),
      trailing: Ending,
    );
  }
}
