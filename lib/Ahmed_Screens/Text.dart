// ignore: unnecessary_import
// ignore_for_file: avoid_unnecessary_containers, unnecessary_import, duplicate_ignore, file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class New extends StatelessWidget {
  const New({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          // Stroked text as border.
          Text(
            'Talki',
            style: TextStyle(
              fontSize: 32.sp,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 16
                ..color = Colors.white,
            ),
          ),
          // Solid text as fill.
          Text(
            'Talki',
            style: TextStyle(
              fontSize: 32.sp,
              color: Colors.orange,
            ),
          ),
        ],
      ),
    );
  }
}
