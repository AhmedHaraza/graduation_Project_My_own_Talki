import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SenderMessage extends StatelessWidget {
  SenderMessage({super.key,this.messageContent,this.messageType});

  var messageContent;
  var messageType;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:(messageType == 'Photo')? Colors.transparent: Color(0xffFF4B26),
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(10.r),
          bottomStart: Radius.circular(10.r),
          bottomEnd: Radius.circular(10.r),
        ),
      ),
      margin: REdgeInsets.all(10),
      padding: REdgeInsets.all(10),
      child: (messageType == 'Photo')? Image.network('${messageContent.toString().trim()}',width: 150.w,height: 150.h,fit:BoxFit.cover ,):Text(messageContent.toString(),style: TextStyle(color: Colors.white),),
    );
  }
}


class ReceiverMessage extends StatelessWidget {
  ReceiverMessage({super.key,this.messageContent,this.messageType});

  var messageContent;
  var messageType;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Container(
        margin: REdgeInsets.all(10),
        padding: REdgeInsets.all(10),
        decoration: BoxDecoration(
        color:(messageType == 'Photo')? Colors.transparent :Colors.black,
        borderRadius: BorderRadiusDirectional.only(
          topEnd: Radius.circular(10.r),
          bottomStart: Radius.circular(10.r),
          bottomEnd: Radius.circular(10.r),
        ),
      ),
        child: (messageType == 'Photo')? Image.network('${messageContent.toString().trim()}',width: 150.w,height: 150.h,):Text(messageContent,style: TextStyle(color: Colors.white),),
      ),
    );
  }
}