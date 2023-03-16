import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class mylanguage extends StatefulWidget {
  const mylanguage({super.key});

  @override
  State<mylanguage> createState() => _mylanguageState();
}

class _mylanguageState extends State<mylanguage> {
   int _value = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        bottom: 0,
        right: 0,
        child: Container(
          width: MediaQuery.of(context).size.width / 1.2,
          decoration: BoxDecoration(
              color: Color(0xff5F5A5A),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r))),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: ()=>Navigator.pop(context),
                    icon: Icon(Icons.arrow_back),
                    color: Colors.white,
                  ),
                  SizedBox(width: 0),
                  Expanded(
                    child: Text(
                      "Language",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.sp
                      ),
                    ),
                  )
                ],
              ),
              Divider(
                color: Color(0xff434343),
                thickness: 2,
              ),
               Container(
              margin: REdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Transform.scale(
                    scale: 1.sp,
                    child: Radio(
                      fillColor: MaterialStateProperty.all(Colors.blue),
                      value: 1,
                      groupValue: _value,
                      onChanged: (value) {
                        setState(
                          () {
                            _value = value!;
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: 10.0.w,
                  ),
                  Container(
                    margin: REdgeInsets.only(left: 5),
                    child: Text(
                      "Arabic",
                      style: TextStyle(color: Colors.white, fontSize: 20.sp),
                    ),
                  )
                ],
              )),
               Container(
              margin: REdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Transform.scale(
                    scale: 1.sp,
                    child: Radio(
                      fillColor: MaterialStateProperty.all(Colors.blue),
                      value: 2,
                      groupValue: _value,
                      onChanged: (value) {
                        setState(
                          () {
                            _value = value!;
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: 10.0.w,
                  ),
                  Container(
                    margin: REdgeInsets.only(left: 5),
                    child: Text(
                      "English",
                      style: TextStyle(color: Colors.white, fontSize: 20.sp),
                    ),
                  )
                ],
              )),
            ],
          ),
        ),
      ),
    ]);
  }
}
