// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

import 'app_bar_content.dart';
import 'chat_box.dart';


class MainChatScreen extends StatelessWidget {
    static const String route_MainChatScreen = 'rout_MainChatScreen';
  const MainChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: appBarLeading,
          title: appBarTitle,
          actions: appBarActions,
          backgroundColor: const Color(0xff1C1C1C),
        ),
        body: ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            width: double.infinity,
            color: const Color(0xff1C1C1C),
            margin: const EdgeInsets.all(10),
            child: const ChatBox(),
          ),
        ),
      ),
    );
  }
}
