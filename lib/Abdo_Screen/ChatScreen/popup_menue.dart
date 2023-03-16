// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'search_bar_delegat.dart';

class PopUpMenu extends StatelessWidget {
  PopUpMenu({super.key});

  List<String> items = ['Search', 'Wallpaper', 'Block', 'Clear chat'];

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (BuildContext context) {
        return items.map((item) {
          return PopupMenuItem(
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
      onSelected: (value) {
        if (value == 'Search') {
          showSearch(context: context, delegate: CustomSearchDelegate());
        }
      },
    );
  }
}
