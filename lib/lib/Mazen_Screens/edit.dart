// ignore_for_file: unnecessary_import, constant_identifier_names, camel_case_types, use_key_in_widget_constructors, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class edit extends StatefulWidget {
  static const String route_edit = 'edit,';
  @override
  State<edit> createState() => _editstate();
}

bool name = false;
bool name1 = false;

class _editstate extends State<edit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(28, 28, 28, 1),
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back, color: Color.fromRGBO(255, 75, 38, 1),
          ),
          ),
          title: const Text('Edit group admin'),
        ),
        body: Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              margin: REdgeInsets.only(top: 70),
              child: Row(
                children: const [],
              ),
            ),
            Container(
              height: 12.h,
              child: Divider(
                height: 60.h,
                thickness: 2,
                color: const Color.fromRGBO(255, 75, 38, 1),
              ),
            ),
            Container(
              margin: REdgeInsets.only(left: 20, top: 5),
              child: Row(
                children: [
                  Text(
                    'Participants',
                    style: TextStyle(fontSize: 16.sp, color: Colors.white),
                  ),
                ],
              ),
            ),
          ]),
        ),
        floatingActionButton: Container(
          margin: const EdgeInsets.only(bottom: 10, right: 20),
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
        ));
  }
}
