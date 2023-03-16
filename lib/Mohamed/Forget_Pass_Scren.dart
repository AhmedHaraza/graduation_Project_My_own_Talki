// ignore_for_file: non_constant_identifier_names, file_names, must_be_immutable, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/Navigator.dart';

class ForgetPassScren extends StatelessWidget {
  static const String route_ForgetPassScren = 'ForgetPassScren';
  ForgetPassScren({Key? key}) : super(key: key);
  final _formState = GlobalKey<FormState>();
  var o = const Color(0xffff4928);

  var bb = Colors.black;

  var BOOXC = const Color(0xff262626);

  var TextC = const Color(0xff5F5A5A);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () async {
          textbackforgetpass(context);
          return true;
        },
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height / 1.8,
              width: MediaQuery.of(context).size.width,
              padding: REdgeInsets.fromLTRB(20, 5, 20, 20),
              child: Theme(
                data: ThemeData(
                  errorColor: Color.fromRGBO(255, 75, 38, 1.0),
                ),
                child: Form(
                  key: _formState,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "Forget",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 32.sp,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "Password?",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 32.sp,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      // ignore: avoid_unnecessary_containers
                      Container(
                        child: TextFormField(
                          validator: (value) {
                            if (value == '') {
                              return 'This Value is Required';
                            } else if (!value!.contains('@')) {
                              return 'You Should Enter A Vaild Email';
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
                              // labelText: (" Enter your Email or phone number"),
                              labelStyle: TextStyle(
                                  fontSize: 15.sp, color: (Colors.white)),
                              hintText: "Enter your Email or phone number",
                              hintStyle:
                                  TextStyle(fontSize: 14.sp, color: TextC),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Icon(
                                  Icons.email,
                                  color: TextC,
                                ),
                              )),
                          style: TextStyle(fontSize: 18.sp, color: TextC),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        // borderRadius: BorderRadius.circular(4),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            "We Will send you a",
                            style: TextStyle(color: TextC, fontSize: 16.sp),
                            //0xff5F5A5A
                          ),
                          Text(
                            " message ",
                            style: TextStyle(
                                color: const Color(0xffff4928),
                                fontSize: 16.sp),
                          ),
                          Text(
                            "to set or reset",
                            style: TextStyle(color: TextC, fontSize: 16.sp),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Column(
                            children: <Widget>[
                              Text(
                                "your new password",
                                style: TextStyle(color: TextC, fontSize: 16.sp),
                              ),
                              Text(
                                "   ",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30.sp),
                              ),
                              // Text(
                              //   " Send Code                          ",
                              //   style: TextStyle(
                              //     color: Colors.white,
                              //     fontSize: 35,
                              //   ),
                              // ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Send Code",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              if (_formState.currentState!.validate()) {
                                circleforgetpasswithotp(context);
                              } else {}
                            },
                            child: Container(
                              width: 53.w,
                              height: 53.h,
                              decoration: BoxDecoration(
                                  color: const Color.fromRGBO(255, 75, 38, 1.0),
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        color: const Color.fromRGBO(
                                            255, 75, 38, 1.0),
                                        spreadRadius: 3.r,
                                        blurRadius: 5.r,
                                        offset: const Offset(0.0, 0.0))
                                  ]),
                              child: Icon(
                                Icons.east,
                                color: Colors.white,
                                size: 30.sp,
                              ),
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
          bottomNavigationBar: Container(
            padding: REdgeInsets.only(bottom: 20),
            color: const Color(0xff161616),
            child: InkWell(
              child: Text(
                "Back",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: TextC,
                  fontSize: 16.sp,
                ),
              ),
              onTap: () => textbackforgetpass(context),
            ),
          ),
        ),
      ),
    );
  }
}
