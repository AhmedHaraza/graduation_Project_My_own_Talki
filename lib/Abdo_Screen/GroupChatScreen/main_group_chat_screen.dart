// ignore_for_file: constant_identifier_names

import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project_my_own_talki/provider/myprovider.dart';
import 'package:provider/provider.dart';
import 'package:social_media_recorder/audio_encoder_type.dart';
import 'package:social_media_recorder/screen/social_media_recorder.dart';
import 'chat_box.dart';
class MainGroupChatScreen extends StatefulWidget {
  static const String route_MainGroupChatScreen = 'MainGroupChatScreen';
  const MainGroupChatScreen({super.key});

  @override
  State<MainGroupChatScreen> createState() => _MainGroupChatScreenState();
}

bool showEmoji = false;
TextEditingController textEditingController = TextEditingController();

class _MainGroupChatScreenState extends State<MainGroupChatScreen> {
  @override
  Widget build(BuildContext context) {
        myprovider provider = Provider.of(context);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: provider.appbar,
        body: ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  SizedBox(
                    child: Stack(
                      children: [
                        SocialMediaRecorder(
                          backGroundColor: Colors.transparent,
                          sendRequestFunction: (soundFile) {},
                          encode: AudioEncoderType.AAC,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    child: const ChatBox(),
                    width: 315.w,
                  ),
                ],
              ),
              Visibility(
                visible: showEmoji,
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
            ],
          ),
        ),
      ),
    );
  }
}
