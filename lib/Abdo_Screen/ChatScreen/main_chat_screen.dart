// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project_my_own_talki/Abdo_Screen/ChatScreen/message.dart';
import 'package:graduation_project_my_own_talki/Abdo_Screen/ChatScreen/popup_menue.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/Navigator.dart';
import 'package:graduation_project_my_own_talki/Nada_Screens/User_Info.dart';

import 'chat_box.dart';

class MainChatScreen extends StatefulWidget {
  static const String route_MainChatScreen = 'rout_MainChatScreen';
  MainChatScreen({super.key});

  @override
  State<MainChatScreen> createState() => _MainChatScreenState();
}

class _MainChatScreenState extends State<MainChatScreen> {
  var currentUserId;
  var currentUserPhoto;

  getUserInfo() async {
    var user = await FirebaseAuth.instance.currentUser;
    setState(() {
      currentUserId = user?.uid;
      currentUserPhoto = user?.photoURL;
    });
  }

  @override
  void initState() {
    super.initState();
    getUserInfo();
  }


  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> datauserInfo =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () async {
          Backandsubmitineditprofile(context);
          return false;
        },
        child: Scaffold(
          appBar: AppBar(
            leading: Container(
              margin: const EdgeInsets.all(7),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return User_Info(
                      recieverPhoto: datauserInfo['Photo Url'],
                      recieverName: '${datauserInfo['First Name']} ${datauserInfo['Last Name']}',
                      recieverId: '${datauserInfo['id']}'.trim(),
                    );
                  }));
                },
                child: CircleAvatar(
                  radius: 25.r,
                  backgroundColor: Color(0xff4D5151),
                  backgroundImage: (datauserInfo['Photo Url'] == null ||
                          datauserInfo['Photo Url'] == '')
                      ? null
                      : NetworkImage('${datauserInfo['Photo Url']}'),
                  child: (datauserInfo['Photo Url'] == null ||
                          datauserInfo['Photo Url'] == '')
                      ? Icon(
                          Icons.person,
                          size: 30.sp,
                        )
                      : Container(),
                ),
              ),
            ),
            title: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return User_Info(
                      recieverPhoto: datauserInfo['Photo Url'],
                      recieverName: '${datauserInfo['First Name']} ${datauserInfo['Last Name']}',
                      recieverId: '${datauserInfo['id']}'.trim(),
                    );
                  }));
              },
              // ()=> userInfo(context),
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc('${datauserInfo['id']}'.trim())
                    .snapshots(),
                builder: (context, snapshot) => Column(
                  children: [
                    Container(
                      constraints: BoxConstraints(),
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                        child: Text(
                          '${datauserInfo['First Name']} ${datauserInfo['Last Name']}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                          child: Icon(
                            Icons.circle,
                            color: snapshot.hasData
                                ? snapshot.data!['Status'] == 'online'
                                    ? Color(0xffFF4B26)
                                    : Color.fromRGBO(95, 90, 90, 1.0)
                                : null,
                            size: 12,
                          ),
                        ),
                        Text(
                          snapshot.hasData ? '${snapshot.data!['Status']}' : '',
                          style: TextStyle(
                            color: snapshot.hasData
                                ? snapshot.data!['Status'] == 'online'
                                    ? Color(0xffFF4B26)
                                    : Color.fromRGBO(95, 90, 90, 1.0)
                                : null,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            actions: [
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
              Container(
                  constraints: const BoxConstraints(),
                  child: PopUpMenu(
                    recieverId: datauserInfo['id'].toString().trim(),
                  )),
            ],
            backgroundColor: const Color(0xff1C1C1C),
          ),
          body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(currentUserId)
                .collection('Chats')
                .doc(datauserInfo['id'].toString().trim())
                .collection('Messages')
                .orderBy('Date and Time', descending: true)
                .snapshots(),
            builder: (context, snapshot) => (snapshot.connectionState ==
                    ConnectionState.waiting)
                ? Center(
                    child: CircularProgressIndicator(
                    color: Color(0xffFF4B26),
                  ))
                : ListView.builder(
                    reverse: true,
                    padding: REdgeInsets.only(left: 10, right: 10),
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) => (currentUserId ==
                            snapshot.data?.docs[index]['Sender ID'])
                        ? Row(
                            mainAxisAlignment: (currentUserId ==
                                    snapshot.data?.docs[index]['Sender ID'])
                                ? MainAxisAlignment.end
                                : MainAxisAlignment.start,
                            children: [
                              SenderMessage(
                                messageContent:
                                    '${snapshot.data?.docs[index]['Message Content']}',
                                messageType: snapshot.data?.docs[index]['Type'],
                                contactName: snapshot.data?.docs[index]['Type'] == 'Contact'? snapshot.data?.docs[index]['Contact Name']: null,
                              ),
                              CircleAvatar(
                                backgroundColor: Color(0xff4D5151),
                                backgroundImage: (currentUserPhoto == null ||
                                        currentUserPhoto == '')
                                    ? null
                                    : NetworkImage('${currentUserPhoto}'),
                                child: (currentUserPhoto == null ||
                                        currentUserPhoto == '')
                                    ? Icon(
                                        Icons.person,
                                        size: 27.sp,
                                      )
                                    : Container(),
                              ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundColor: Color(0xff4D5151),
                                backgroundImage:
                                    (datauserInfo['Photo Url'] == null ||
                                            datauserInfo['Photo Url'] == '')
                                        ? null
                                        : NetworkImage(
                                            '${datauserInfo['Photo Url']}'),
                                child: (datauserInfo['Photo Url'] == null ||
                                        datauserInfo['Photo Url'] == '')
                                    ? Icon(
                                        Icons.person,
                                        size: 27.sp,
                                      )
                                    : Container(),
                              ),
                              ReceiverMessage(
                                messageContent:
                                    '${snapshot.data?.docs[index]['Message Content']}',
                                messageType: snapshot.data?.docs[index]['Type'],
                                contactName: snapshot.data?.docs[index]['Type'] == 'Contact'? snapshot.data?.docs[index]['Contact Name']: null,
                              ),
                            ],
                          )),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Container(
              width: double.infinity,
              color: const Color(0xff1C1C1C),
              margin: const EdgeInsets.all(10),
              child: ChatBox(
                recieverId: datauserInfo['id'],
                recieverName:
                    '${datauserInfo['First Name']} ${datauserInfo['Last Name']}',
                    recieverPhoto: '${datauserInfo['Photo Url']}',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
