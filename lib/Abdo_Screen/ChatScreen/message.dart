import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path/path.dart';
import 'package:url_launcher/url_launcher.dart';

class SenderMessage extends StatelessWidget {
  SenderMessage({super.key, this.messageContent, this.messageType});

  var messageContent;
  var messageType;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: messageType == 'Link' ? 200.w : null,
      decoration: BoxDecoration(
        color:
            (messageType == 'Photo') ? Colors.transparent : Color(0xffFF4B26),
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(10.r),
          bottomStart: Radius.circular(10.r),
          bottomEnd: Radius.circular(10.r),
        ),
      ),
      margin: REdgeInsets.all(10),
      padding: REdgeInsets.all(10),
      child: (messageType == 'Photo')
          ? Image.network(
              '${messageContent.toString().trim()}',
              width: 150.w,
              height: 150.h,
            )
          : (messageType == 'Link')
              ? Linkify(
                  text: messageContent,
                  onOpen: _onOpen,
                  textScaleFactor: 2,
                  style: TextStyle(
                    fontSize: 8.sp,
                  ),
                  linkStyle: TextStyle(
                    color: Colors.white
                  ),
                )
              : Text(
                  messageContent,
                  style: TextStyle(color: Colors.white),
                ),
    );
  }

  Future<void> _onOpen(LinkableElement link) async {
    final url = Uri.parse(messageContent);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }
}

class ReceiverMessage extends StatelessWidget {
  ReceiverMessage({super.key, this.messageContent, this.messageType});

  var messageContent;
  var messageType;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Container(
        width: messageType == 'Link' ? 200.w : null,
        margin: REdgeInsets.all(10),
        padding: REdgeInsets.all(10),
        decoration: BoxDecoration(
          color: (messageType == 'Photo') ? Colors.transparent : Colors.black,
          borderRadius: BorderRadiusDirectional.only(
            topEnd: Radius.circular(10.r),
            bottomStart: Radius.circular(10.r),
            bottomEnd: Radius.circular(10.r),
          ),
        ),
        child: (messageType == 'Photo')
            ? Image.network(
                '${messageContent.toString().trim()}',
                width: 150.w,
                height: 150.h,
              )
            : (messageType == 'Link')
                ? Linkify(
                  text: messageContent,
                  onOpen: _onOpen,
                  textScaleFactor: 2,
                  style: TextStyle(
                    fontSize: 8.sp,
                  ),
                  linkStyle: TextStyle(
                    color: Colors.white
                  ),
                )
                : Text(
                    messageContent,
                    style: TextStyle(color: Colors.white),
                  ),
      ),
    );
  }

    Future<void> _onOpen(LinkableElement link) async {
    final url = Uri.parse(messageContent);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }
}
