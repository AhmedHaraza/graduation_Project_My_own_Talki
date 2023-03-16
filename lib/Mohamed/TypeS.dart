// ignore: file_names
// ignore_for_file: must_be_immutable, unused_import, file_names, duplicate_ignore, constant_identifier_names, prefer_const_constructors

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/Navigator.dart';

class TypeS extends StatefulWidget {
  static const String route_TypeS = 'TypeS';
  TypeS({Key? key}) : super(key: key);

  @override
  State<TypeS> createState() => _TypeSState();
}

class _TypeSState extends State<TypeS> {
  var o = const Color(0xffff4928);

  var bb = Colors.black;

  var b = const Color(0xff5d5958);

  var w = Colors.white;
  List<Color> listcolors = [
    Colors.blue,
    Colors.grey,
    Colors.yellow,
    Colors.green,
    Colors.red,
    Colors.purple,
    Colors.brown,
    Colors.deepPurple,
    Colors.black,
    Colors.blueAccent,
    Colors.amber,
    Colors.orange,
    Colors.cyan,
    Colors.indigo,
  ];
  Icon mood = Icon(
    Icons.mood,
    size: 30.sp,
  );
  Icon keyboard = Icon(
    Icons.keyboard,
    size: 30.sp,
  );
  bool _showEmoji = false;
  TextEditingController textEditingController = TextEditingController();
  int fontindex = 1;
  int indexcolor = 0;
  Color DynamicColor = Colors.blue;
  Color funcolor(int index) {
    for (int i = 0; i <= index; i++) {
      DynamicColor = listcolors[index];
    }
    return DynamicColor;
  }

  String tetxfont = 'Gloock';
  List<String> fontlist = [
    'Gloock',
    'Pacifico',
    'RobotoCondensed',
    'Cairo-VariableFont_slnt',
  ];
  String Fontchange(int index) {
    {
      tetxfont = fontlist[index];
      return tetxfont;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        addstatus(context);
        return true;
      },
      child: Scaffold(
        backgroundColor: DynamicColor,
        appBar: AppBar(
          toolbarHeight: 50.h,
          backgroundColor: DynamicColor,
          leading: IconButton(
            padding: REdgeInsets.only(left: 20),
            onPressed: () => addstatus(context),
            icon: Icon(
              Icons.cancel_outlined,
              size: 30.sp,
              color: Colors.white,
            ),
          ),
          actions: [
             IconButton(
              padding: REdgeInsets.only(right: 30),
              onPressed: () {
                setState(() {
                  _showEmoji = !_showEmoji;
                  Navigator.pop;
                });
                if (_showEmoji) {
                } else {}
                FocusScope.of(context).unfocus();
              },
              icon: _showEmoji == false ? mood : keyboard,
            ),
            IconButton(
                padding: REdgeInsets.only(right: 30),
                onPressed: () {
                  Fontchange(fontindex);
                  fontindex++;
                  if (fontindex == fontlist.length) {
                    fontindex = 1;
                  }
                  print(tetxfont);
                  setState(() {});
                },
                icon: Icon(
                  Icons.text_fields,
                  size: 30.sp,
                  color: Colors.white,
                )),
            IconButton(
                padding: REdgeInsets.only(right: 30),
                onPressed: () {
                  funcolor(indexcolor);
                  indexcolor++;
                  if (indexcolor == listcolors.length) {
                    indexcolor = 0;
                  }
                  setState(() {});
                },
                icon: Icon(
                  Icons.cookie_outlined,
                  size: 30.sp,
                  color: Colors.white,
                ))
          ],
        ),
        body: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height,
          padding: REdgeInsets.fromLTRB(20, 5, 10, 20),
          child: TextFormField(
            controller: textEditingController,
            maxLines: null,
            minLines: null,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                hintText: "Type a Status",
                hintStyle:
                    TextStyle(color: Colors.white, fontFamily: tetxfont),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent))),
            style: TextStyle(
                color: Colors.white,
                fontSize: 32.sp,
                fontWeight: FontWeight.w700,
                fontFamily: tetxfont),
          ),
        ),
         bottomNavigationBar: Visibility(
          visible: _showEmoji,
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 2.9,
            child: EmojiPicker(
              onEmojiSelected: (category, emoji) {
                textEditingController.text =
                    textEditingController.text + emoji.emoji;
              },
              config: Config(
                columns: 7,
                emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 1.0),
              ),
            ),
          ),
        ),
        floatingActionButton: Container(
          margin: REdgeInsets.only(bottom: 10),
          width: 53.w,
          height: 53.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.r),
          ),
          child: FloatingActionButton(
            onPressed: () => addstatus(context),
            backgroundColor: Colors.white,
            child: Padding(
              padding: REdgeInsets.only(left: 4),
              child: Icon(
                Icons.send,
                size: 30.sp,
                color: DynamicColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}