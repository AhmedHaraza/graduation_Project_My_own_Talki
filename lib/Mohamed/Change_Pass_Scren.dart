// ignore_for_file: non_constant_identifier_names, file_names, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/Navigator.dart';

class ChangePassScren extends StatefulWidget {
  static const String route_ChangePassScren = 'ChangePassScren';
  const ChangePassScren({Key? key}) : super(key: key);

  @override
  State<ChangePassScren> createState() => _ChangePassScrenState();
}

class _ChangePassScrenState extends State<ChangePassScren> {
  final _formstate = GlobalKey<FormState>();
  var o = const Color(0xffff4928);

  var bb = Color(0xff161616);

  var BOOXC = const Color(0xff262626);

  var TextC = const Color(0xff5F5A5A);

  bool visState1 = true;
  bool visState2 = true;
  bool visState3 = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () async {
          Backandsubmitineditprofile(context);
          return true;
        },
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: REdgeInsets.fromLTRB(20, 40, 20, 5),
              color: bb,
              child: Theme(
                data: ThemeData(errorColor: Color(0xffFF4B26)),
                child: Form(
                  key: _formstate,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        " Change",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 32.sp,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        " Password?",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 32.sp,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "",
                        style: TextStyle(color: Colors.white, fontSize: 32.sp),
                      ),
                      Container(
                        margin: REdgeInsets.all(5),
                        child: TextFormField(
                          validator: (value) {
                            if (value == '') {
                              return 'This Value is Required';
                            } else if (value!.length < 8) {
                              return 'The Password Should be At Least 8 Character ';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            fillColor: BOOXC,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0.r)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0.r)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0.r)),
                            ),
                            labelStyle: TextStyle(
                                fontSize: 15.sp, color: (Colors.white)),
                            hintText: "Old Password",
                            hintStyle: TextStyle(fontSize: 14.sp, color: TextC),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: TextC,
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    visState1 = !visState1;
                                  });
                                },
                                icon: Icon(
                                  visState1
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: TextC,
                                ),
                              ),
                            ),
                          ),
                          style: TextStyle(fontSize: 18.sp, color: TextC),
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: visState1,
                        ),
                      ),
                      Container(
                        margin: REdgeInsets.all(5),
                        child: TextFormField(
                          validator: (value) {
                            if (value == '') {
                              return 'This Value is Required';
                            } else if (value!.length < 8) {
                              return 'The Password Should be At Least 8 Character ';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            fillColor: BOOXC,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0.r)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0.r)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0.r)),
                            ),
                            labelStyle: TextStyle(
                                fontSize: 15.sp, color: (Colors.white)),
                            hintText: "New Password",
                            hintStyle: TextStyle(fontSize: 14.sp, color: TextC),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: TextC,
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    visState2 = !visState2;
                                  });
                                },
                                icon: Icon(
                                  visState2
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: TextC,
                                ),
                              ),
                            ),
                          ),
                          style: TextStyle(fontSize: 18.sp, color: TextC),
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: visState2,
                        ),
                      ),
                      Container(
                        margin: REdgeInsets.all(5),
                        child: TextFormField(
                          validator: (value) {
                            if (value == '') {
                              return 'This Value is Required';
                            } else if (value!.length < 8) {
                              return 'The Password Should be At Least 8 Character ';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            fillColor: BOOXC,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0.r)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0.r)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0.r)),
                            ),
                            labelStyle: TextStyle(
                                fontSize: 15.sp, color: (Colors.white)),
                            hintText: "Confirm Password",
                            hintStyle: TextStyle(fontSize: 14.sp, color: TextC),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: TextC,
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    visState3 = !visState3;
                                  });
                                },
                                icon: Icon(
                                  visState3
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: TextC,
                                ),
                              ),
                            ),
                          ),
                          style: TextStyle(fontSize: 18.sp, color: TextC),
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: visState3,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        alignment: Alignment.centerRight,
                        width: MediaQuery.of(context).size.width,
                        child: Container(
                          width: 53.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(255, 75, 38, 1.0),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    color:
                                        const Color.fromRGBO(255, 75, 38, 1.0),
                                    spreadRadius: 3.r,
                                    blurRadius: 5.r,
                                    offset: const Offset(0.0, 0.0))
                              ]),
                          child: InkWell(
                            onTap: () {
                              if (_formstate.currentState!.validate()) {
                                circleAvatarinchangepassword(context);
                              }
                              else{}
                            },
                            child: Icon(
                              Icons.east,
                              color: Colors.white,
                              size: 35.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          bottomNavigationBar: Container(
            padding: REdgeInsets.only(bottom: 20),
            color: bb,
            child: TextButton(
              onPressed: () => Backandsubmitineditprofile(context),
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(BOOXC),
              ),
              child: Text(
                "Back",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: TextC,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
