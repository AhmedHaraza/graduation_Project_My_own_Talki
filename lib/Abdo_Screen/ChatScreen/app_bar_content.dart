import 'package:flutter/material.dart';

import 'popup_menue.dart';

Widget appBarLeading = Container(
  margin: const EdgeInsets.all(7),
  child: InkWell(onTap: () {}, child: const CircleAvatar()),
);

Widget appBarTitle = InkWell(
  onTap: () {},
  child: Column(
    children: [
      Container(
        alignment: Alignment.centerLeft,
        child: const Text(
          'Connor Frazier',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Row(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
            child: const Icon(
              Icons.circle,
              color: Color(0xffFF4B26),
              size: 12,
            ),
          ),
          const Text(
            'Online',
            style: TextStyle(
              color: Color(0xffFF4B26),
              fontSize: 16,
            ),
          ),
        ],
      ),
    ],
  ),
);

List<Widget> appBarActions = [
  IconButton(
    constraints: const BoxConstraints(),
    onPressed: () {},
    icon: const Icon(
      Icons.videocam_outlined,
      color: Color(0xFFFF4B26),
      size: 34,
    ),
  ),
  Container(
    margin: const EdgeInsets.only(left: 10),
    child: IconButton(
      constraints: const BoxConstraints(),
      onPressed: () {},
      icon: const Icon(
        Icons.add_call,
        color: Color(0xFFFF4B26),
        size: 25,
      ),
    ),
  ),
  Container(constraints: const BoxConstraints(), child: PopUpMenu()),
];
