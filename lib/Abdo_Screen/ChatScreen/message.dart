import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SenderMessage extends StatelessWidget {
  SenderMessage({super.key,this.messageContent});

  var messageContent;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffFF4B26),
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(10.r),
          bottomStart: Radius.circular(10.r),
          bottomEnd: Radius.circular(10.r),
        ),
      ),
      margin: REdgeInsets.all(10),
      padding: REdgeInsets.all(10),
      child: Text(messageContent,style: TextStyle(color: Colors.white),),
    );
  }
}


class ReceiverMessage extends StatelessWidget {
  ReceiverMessage({super.key,this.messageContent});

  var messageContent;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Container(
        margin: REdgeInsets.all(10),
        padding: REdgeInsets.all(10),
        decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadiusDirectional.only(
          topEnd: Radius.circular(10.r),
          bottomStart: Radius.circular(10.r),
          bottomEnd: Radius.circular(10.r),
        ),
      ),
        child: Text(messageContent,style: TextStyle(color: Colors.white),),
      ),
    );
  }
}