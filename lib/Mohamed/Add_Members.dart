// ignore_for_file: non_constant_identifier_names, must_be_immutable, file_names, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddMembers extends StatelessWidget {
    static const String route_AddMembers = 'AddMemberss';
  AddMembers({Key? key}) : super(key: key);

  var o = const Color(0xffff4928);

  var bb = Colors.black;

  var BOOXC = const Color(0xff262626);

  var TextC = const Color(0xff5F5A5A);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding:  REdgeInsets.only(top: 20,left: 20,right: 20),
          color: bb,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  <Widget>[
                  const SizedBox(),
                  const Text(
                    "Add",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      //fontWeight: FontWeight.w700
                    ),
                  ),
                  Text(" Members",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36.sp,
                      // fontWeight: FontWeight.w700
                    ),
                  ),
                ],
              ),
              Container(
                margin:  REdgeInsets.only(top: 30, right: 20, left: 20),
                height: 40,
                child: TextFormField(
                  style: const TextStyle(
                      color: Color.fromRGBO(255, 75, 38, 1.0)),
                  decoration: InputDecoration(
                      contentPadding:  REdgeInsets.only(left: 20),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Search for contents",
                      hintStyle: const TextStyle(
                        color: Color.fromRGBO(255, 75, 38, 1.0),
                        fontWeight: FontWeight.w800,
                      ),
                      hintMaxLines: 1,
                      suffixIcon: const Padding(
                        padding: EdgeInsets.only(right: 7),
                        child: Icon(
                          Icons.search,
                          color: Color.fromRGBO(255, 75, 38, 1.0),
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Container(
          margin: const EdgeInsets.only(bottom: 10),
          width: 45,
          height: 45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              boxShadow: const [
                BoxShadow(
                    color: Color(0xffFF4B26),
                    spreadRadius: 3,
                    blurRadius: 8,
                    offset: Offset(0, 0)),
              ]),
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: const Color(0xffFF4B26),
            child: const Icon(
              Icons.done,
              size: 25,
              color: Colors.white,
            ),
          ),
        ),
        ),
    );
  }
}
