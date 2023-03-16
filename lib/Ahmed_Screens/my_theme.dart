// ignore_for_file: constant_identifier_names, non_constant_identifier_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyThemeData {
  static const Color colorgray = Color.fromRGBO(44, 44, 44, 1.0);
  static const Color filetextfiled = Color.fromRGBO(95, 90, 90, 1.0);
  static const TextStyle fontSize = TextStyle(fontSize: 25);
  static const TextStyle fontWeight = TextStyle(fontWeight: FontWeight.w700);

  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 32.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold)));

  static ThemeData darktheme = ThemeData(
      scaffoldBackgroundColor: Color(0xff161616),
      textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 32.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold)));

  static TextStyle Register = TextStyle(
      fontSize: 24.sp, fontWeight: FontWeight.w700, color: Colors.white);
  static TextStyle Text_Sin_in = TextStyle(
      fontWeight: FontWeight.w700,
      color: const Color.fromRGBO(95, 90, 90, 1.0),
      fontSize: 16.sp);
  static TextStyle Rich_Text = TextStyle(
    color: const Color.fromRGBO(95, 90, 90, 1.0),
    fontSize: 12.sp,
  );
  static TextStyle Page_Sign_in = TextStyle(
      fontWeight: FontWeight.w700,
      color: const Color.fromRGBO(255, 75, 38, 1.0),
      fontSize: 12.sp);
  static TextStyle Searchforcontents = TextStyle(
      fontSize: 10.sp,
      fontWeight: FontWeight.w800,
      color: const Color.fromRGBO(255, 75, 38, 1.0));
  static TextStyle TextContacts = TextStyle(
      color: Colors.white, fontSize: 40.sp, fontWeight: FontWeight.w400);
  static TextStyle Add_Members = TextStyle(
      color: Colors.white, fontSize: 30.sp, fontWeight: FontWeight.w400);
  static TextStyle Members_who_added = TextStyle(
      color: const Color.fromRGBO(255, 75, 38, 1.0),
      fontSize: 10.sp,
      fontWeight: FontWeight.w800);
  static TextStyle Select_Contact = TextStyle(
      color: Colors.white, fontSize: 12.sp, fontWeight: FontWeight.w800);
  static TextStyle Addfriends = TextStyle(
      color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w800);
  static TextStyle Wirte_a_text = TextStyle(
      color: Colors.black, fontSize: 24.sp, fontWeight: FontWeight.w800);
  static TextStyle Send_the_massage = TextStyle(
      color: const Color.fromRGBO(255, 75, 38, 1.0),
      fontSize: 20.sp,
      fontWeight: FontWeight.w800);
}
