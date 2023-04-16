// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/Navigator.dart';

import 'search_bar_delegat.dart';

class PopUpMenu extends StatelessWidget {
  PopUpMenu({super.key, this.recieverId});

  List<String> items = ['Search', 'Wallpaper', 'Block', 'Clear chat'];
  var recieverId;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (BuildContext context) {
        return items.map((item) {
          return PopupMenuItem(
            onTap: () async {
              if (item == 'Clear chat') {
                await deleteChat();
              }
            },
            value: item,
            child: Text(
              item,
              style: const TextStyle(
                color: Color(0xFFFF4B26),
              ),
            ),
          );
        }).toList();
      },
      offset: const Offset(0, 60),
      icon: const Icon(
        Icons.more_vert,
        color: Color(0xFFFF4B26),
      ),
      color: const Color(0xff1C1C1C),
      onSelected: (value) async {
        if (value == 'Search') {
          showSearch(context: context, delegate: CustomSearchDelegate());
        }
        if (value == 'Wallpaper') {
          IconBacinCoustomWall(context);
        }
      },
    );
  }

  deleteChat() async {
    try {
      print('reciverid: ${recieverId}');
      var currentUser = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser?.uid)
          .collection('Chats')
          .doc(recieverId)
          .collection('Messages')
          .get()
          .then((snapshot) {
        for (DocumentSnapshot ds in snapshot.docs) {
          ds.reference.delete();
        }
        ;
      });
    } catch (e) {
      print('error: $e');
    }
  }
}
