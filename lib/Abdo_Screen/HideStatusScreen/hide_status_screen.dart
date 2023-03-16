import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/Navigator.dart';
import 'package:graduation_project_my_own_talki/provider/myprovider.dart';
import 'package:provider/provider.dart';

class HideStatusScreen extends StatelessWidget {
  static const String route_HideStatusScreen = 'HideStatusScreen';
  @override
  Widget build(BuildContext context) {
    myprovider provider = Provider.of(context);
    return WillPopScope(
      onWillPop: () async {
        Statusprivacy(context);
        return true;
      },
      child: Scaffold(
        backgroundColor:Color(0xff161616),
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Color(0xff6E6E6E),
            )
          ),
          toolbarHeight: 70.h,
          elevation: 0.0,
          backgroundColor: Color(0xff161616),
          leading: IconButton(
            onPressed: () => Statusprivacy(context),
            icon: Icon(
              Icons.arrow_back,
              size: 30.sp,
              color: const Color(0xffFF4B26),
            ),
          ),
          title: provider.IsSearch
              ? provider.Searchapp
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Hide status from...',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      '  contacts excluded',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
          actions: [
            IconButton(
              constraints: BoxConstraints(),
              onPressed: () {
                provider.Searchmethod();
              },
              icon: Icon(
                Icons.search,
                size: 30.sp,
                color: const Color(0xffFF4B26),
              ),
            ),
            Padding(
              padding: REdgeInsets.only(right: 10),
              child: IconButton(
                constraints: BoxConstraints(),
                onPressed: () {},
                icon: Icon(
                  Icons.playlist_add_check,
                  size: 35.sp,
                  color: const Color(0xffFF4B26),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
