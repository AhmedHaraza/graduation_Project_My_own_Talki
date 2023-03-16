import 'package:flutter/material.dart';
import 'package:graduation_project_my_own_talki/Abdo_Screen/GroupChatScreen/main_group_chat_screen.dart';
import 'media_select.dart';

class ChatBox extends StatefulWidget {
  const ChatBox({super.key});

  @override
  State<ChatBox> createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 13),
      child: TextField(
        onTap: () {
          if (showEmoji) {
            setState(() {
              showEmoji = !showEmoji;
            });
          }
        },
        controller: textEditingController,
        minLines: 1,
        maxLines: 5,
        decoration: InputDecoration(
          constraints: const BoxConstraints(),
          hintText: "write a messge",
          hintStyle: const TextStyle(
            color: Colors.white,
          ),
          prefixIcon: IconButton(
            onPressed: () {
              setState(() {
                showEmoji = !showEmoji;
                Navigator.pop;
              });
              if (showEmoji) {
              } else {}
              FocusScope.of(context).unfocus();
            },
            icon: const Icon(
              Icons.add_reaction_outlined,
              color: Color(0xFFFF4B26),
            ),
          ),
          suffixIcon: Container(
            margin: const EdgeInsets.only(right: 2),
            width: MediaQuery.of(context).size.width / 4.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  constraints: const BoxConstraints(),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: ((context) =>
                          media_select(MediaQuery.of(context).size.width)),
                    );
                  },
                  icon: const Icon(
                    Icons.add_circle,
                    color: Color(0xFFFF4B26),
                  ),
                ),
                IconButton(
                  constraints: const BoxConstraints(),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.send,
                    color: Color(0xFFFF4B26),
                  ),
                ),
              ],
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 1.5,
              color: Color(0xFFFF4B26),
            ),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
        style: const TextStyle(
          color: Colors.white,
        ),
        keyboardType: TextInputType.text,
      ),
    );
  }
}
