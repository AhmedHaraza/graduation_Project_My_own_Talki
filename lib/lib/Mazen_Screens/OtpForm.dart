// ignore_for_file: unused_import, file_names, use_key_in_widget_constructors, constant_identifier_names, sort_child_properties_last, sized_box_for_whitespace, avoid_unnecessary_containers

import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/Navigator.dart';
import 'package:graduation_project_my_own_talki/Nada_Screens/Reset_Password.dart';

class OtPForm extends StatefulWidget {
  static const String routename_OtPForm = 'route_otp';
  @override
  State<StatefulWidget> createState() => _OtpForm();
}

class _OtpForm extends State<OtPForm> {
  final _formState = GlobalKey<FormState>();
  var black = Colors.black;
  var white = Colors.white;
  var orange = Colors.orange;
  var grey = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () async {
          BackEnterotp(context);
          return true;
        },
        child: Scaffold(
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              child: Padding(
                padding: REdgeInsets.all(20),
                child: Column(
                  children: [
                    Padding(
                      padding: REdgeInsets.all(30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 70.h,
                          ),
                          Icon(Icons.lock_open_outlined,
                              size: 80.sp,
                              color: const Color.fromRGBO(95, 90, 90, 1)),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        Text("Enter OTP",
                            style: TextStyle(
                                fontSize: 50.sp,
                                color: const Color.fromRGBO(255, 253, 253, 1))),
                      ],
                    ),
                    Padding(
                      padding: REdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 20.h,
                          ),
                          Container(
                            child: Text(
                                "An 4 digit code has been sent to your number",
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    color: const Color.fromRGBO(
                                        255, 253, 253, 1))),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: REdgeInsets.all(20.0),
                      child: Theme(
                        data: ThemeData(
                          errorColor: Color.fromRGBO(255, 75, 38, 1.0),
                        ),
                        child: Form(
                          key: _formState,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 70.h,
                                width: 50.w,
                                child: Container(
                                  margin: REdgeInsets.only(right: 5),
                                  child: TextFormField(
                                    validator: (value) =>
                                        (value == '') ? '' : null,
                                    style: TextStyle(color: white),
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor:
                                          const Color.fromRGBO(38, 38, 38, 1),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 3.w,
                                            color: const Color.fromRGBO(
                                                38, 38, 38, 1)),
                                        borderRadius:
                                            BorderRadius.circular(20.0.r),
                                      ),
                                      hintText: "-",
                                      hintStyle: TextStyle(
                                          fontSize: 15.sp, color: grey),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 3.w,
                                            color: const Color.fromRGBO(
                                                38, 38, 38, 1)),
                                        borderRadius:
                                            BorderRadius.circular(20.0.r),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 3.w,
                                            color: const Color.fromRGBO(
                                                38, 38, 38, 1)),
                                        borderRadius:
                                            BorderRadius.circular(20.0.r),
                                      ),
                                    ),
                                    onChanged: (value) {
                                      if (value.length == 1) {
                                        FocusScope.of(context).nextFocus();
                                      }
                                    },
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(1),
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 70.h,
                                width: 50.w,
                                child: Container(
                                  margin: REdgeInsets.only(right: 5),
                                  child: TextFormField(
                                    validator: (value) =>
                                        (value == '') ? '' : null,
                                    style: TextStyle(color: white),
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor:
                                          const Color.fromRGBO(38, 38, 38, 1),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 3.w,
                                            color: const Color.fromRGBO(
                                                38, 38, 38, 1)),
                                        borderRadius:
                                            BorderRadius.circular(20.0.r),
                                      ),
                                      hintText: "-",
                                      hintStyle: TextStyle(
                                          fontSize: 15.sp, color: grey),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 3.w,
                                            color: const Color.fromRGBO(
                                                38, 38, 38, 1)),
                                        borderRadius:
                                            BorderRadius.circular(20.0.r),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 3.w,
                                            color: const Color.fromRGBO(
                                                38, 38, 38, 1)),
                                        borderRadius:
                                            BorderRadius.circular(20.0.r),
                                      ),
                                    ),
                                    onChanged: (value) {
                                      if (value.length == 1) {
                                        FocusScope.of(context).nextFocus();
                                      }
                                    },
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(1),
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 70.h,
                                width: 50.w,
                                child: Container(
                                  margin: REdgeInsets.only(right: 5),
                                  child: TextFormField(
                                    validator: (value) =>
                                        (value == '') ? '' : null,
                                    style: TextStyle(color: white),
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor:
                                          const Color.fromRGBO(38, 38, 38, 1),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 3.w,
                                            color: const Color.fromRGBO(
                                                38, 38, 38, 1)),
                                        borderRadius:
                                            BorderRadius.circular(20.0.r),
                                      ),
                                      hintText: "-",
                                      hintStyle: TextStyle(
                                          fontSize: 15.sp, color: grey),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 3.w,
                                            color: const Color.fromRGBO(
                                                38, 38, 38, 1)),
                                        borderRadius:
                                            BorderRadius.circular(20.0.r),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 3.w,
                                            color: const Color.fromRGBO(
                                                38, 38, 38, 1)),
                                        borderRadius:
                                            BorderRadius.circular(20.0.r),
                                      ),
                                    ),
                                    onChanged: (value) {
                                      if (value.length == 1) {
                                        FocusScope.of(context).nextFocus();
                                      }
                                    },
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(1),
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 70.h,
                                width: 50.w,
                                child: Container(
                                  margin: REdgeInsets.only(right: 5),
                                  child: TextFormField(
                                    validator: (value) =>
                                        (value == '') ? '' : null,
                                    style: TextStyle(color: white),
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor:
                                          const Color.fromRGBO(38, 38, 38, 1),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 3.w,
                                            color: const Color.fromRGBO(
                                                38, 38, 38, 1)),
                                        borderRadius:
                                            BorderRadius.circular(20.0.r),
                                      ),
                                      hintText: "-",
                                      hintStyle: TextStyle(
                                          fontSize: 15.sp, color: grey),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 3.w,
                                            color: const Color.fromRGBO(
                                                38, 38, 38, 1)),
                                        borderRadius:
                                            BorderRadius.circular(20.0.r),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 3.w,
                                            color: const Color.fromRGBO(
                                                38, 38, 38, 1)),
                                        borderRadius:
                                            BorderRadius.circular(20.0.r),
                                      ),
                                    ),
                                    onChanged: (value) {
                                      if (value.length == 1) {
                                        FocusScope.of(context).nextFocus();
                                      }
                                    },
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(1),
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50.h,
                        ),
                        Center(
                          child: Container(
                            width: 250.w,
                            height: 56.h,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formState.currentState!.validate()) {
                                  Submitenterotp(context);
                                } else {}
                              },
                              child: Text(
                                "Submit",
                                style: TextStyle(fontSize: 20.sp),
                                textAlign: TextAlign.center,
                              ),
                              style: ElevatedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  backgroundColor:
                                      const Color.fromRGBO(255, 75, 38, 1)),
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: REdgeInsets.all(12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: _startcountdoun,
                            child: Text(timerleft == 30 ||timerleft == 0 ? "Re-Send Code" :  '${timerleft}',
                                style: TextStyle(fontSize: 16.sp),
                                textAlign: TextAlign.center),
                            style: TextButton.styleFrom(
                              foregroundColor:
                                  const Color.fromRGBO(95, 90, 90, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () => BackEnterotp(context),
                          child: Text(
                            "Back",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16.sp),
                          ),
                          style: TextButton.styleFrom(
                            foregroundColor:
                                const Color.fromRGBO(95, 90, 90, 1),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool showcounter = false;
  int timerleft = 30;

  void _startcountdoun() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (timerleft > 0) {
        setState(() {
          timerleft = timerleft - 1;
          showcounter = true;
        });
      } else {
        timerleft = 30;
        timer.cancel();
      }
    });
  }
}
