import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'media_select.dart';

class ChatBox extends StatelessWidget {
  ChatBox({super.key, this.recieverId, this.recieverName});

  TextEditingController messageController = new TextEditingController();
  var recieverId;
  var recieverName;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: messageController,
      minLines: 1,
      maxLines: 5,
      decoration: InputDecoration(
        constraints: const BoxConstraints(),
        hintText: "write a messge",
        hintStyle: const TextStyle(
          color: Colors.white,
        ),
        prefixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.add_reaction_outlined,
            color: Color(0xFFFF4B26),
          ),
        ),
        suffixIcon: Container(
          margin: const EdgeInsets.only(right: 2),
          width: MediaQuery.of(context).size.width / 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                constraints: const BoxConstraints(),
                onPressed: () {},
                icon: const Icon(
                  Icons.mic,
                  color: Color(0xFFFF4B26),
                ),
              ),
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
                onPressed: () async {
                  await sendMessage();
                },
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
    );
  }

  sendMessage() async {
    var currentUser = await FirebaseAuth.instance.currentUser;
    //save messages data for sender
    await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser?.uid)
        .collection('Chats')
        .doc(recieverId.toString().trim())
        .collection('Messages')
        .add({
      'Sender ID': currentUser?.uid,
      'Reciever ID': recieverId,
      'Sender Name': currentUser?.displayName,
      'Reciever Name': recieverName,
      'Message Content': messageController.text,
      'Date and Time' : DateTime.now(),
    });

    //save messages data for reciever
    await FirebaseFirestore.instance
        .collection('users')
        .doc(recieverId.toString().trim())
        .collection('Chats')
        .doc(currentUser?.uid)
        .collection('Messages')
        .add({
      'Sender ID': currentUser?.uid,
      'Reciever ID': recieverId,
      'Sender Name': currentUser?.displayName,
      'Reciever Name': recieverName,
      'Message Content': messageController.text,
      'Date and Time' : DateTime.now(),
    });

    messageController.clear();
  }
}
