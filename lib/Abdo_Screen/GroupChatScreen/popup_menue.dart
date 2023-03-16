// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/Navigator.dart';
import 'package:graduation_project_my_own_talki/provider/myprovider.dart';
import 'package:provider/provider.dart';

class PopUpMenu extends StatelessWidget {
  PopUpMenu({super.key});

  List<String> items = [
    'Group Settings',
    'Search',
    'Wallpaper',
    'Clear chat',
    'Exit Group'
  ];

  @override
  Widget build(BuildContext context) {
    myprovider provider = Provider.of(context);
    return PopupMenuButton(
      itemBuilder: (BuildContext context) {
        return items.map((item) {
          return PopupMenuItem(
            onTap: item == 'Search'
                ? () {
                    provider.switch_app_scearch();
                  }
                : () {
                    provider.switch_app2();
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
      onSelected: (value) {
        if (value == 'Group Settings') {
          pageGroupSettings(context);
        }
      },
    );
  }
}
