import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:intl/intl.dart';

class ContactListPage extends StatefulWidget {
  ContactListPage({this.recieverId,this.recieverName,this.recieverPhoto});
  var recieverId;
  var recieverName;
  var recieverPhoto;
  @override
  _ContactListPageState createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  List<Contact>? _contacts;

  @override
  void initState() {
    super.initState();
    refreshContacts();
  }

  Future<void> refreshContacts() async {
    // Load without thumbnails initially.
    var contacts =
        (await ContactsService.getContacts(withThumbnails: false)).toList();
//      var contacts = (await ContactsService.getContactsForPhone("8554964652"))
//          .toList();
    setState(() {
      _contacts = contacts;
    });

    // Lazy load thumbnails after rendering initial contacts.
    for (final contact in contacts) {
      ContactsService.getAvatar(contact).then((avatar) {
        if (avatar == null) return; // Don't redraw if no change.
        setState(() => contact.avatar = avatar);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff1C1C1C),
          title: Text(
            'Contacts List',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: SafeArea(
          child: _contacts != null
              ? ListView.builder(
                  itemCount: _contacts?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    Contact c = _contacts!.elementAt(index);
                    return ListTile(
                      onTap: () async{
                        sendContact(index);
                        Navigator.of(context).pop();
                        Navigator.of(context, rootNavigator: true)
                            .pop('dialog');
                      },
                      leading: (c.avatar != null && c.avatar!.length > 0)
                          ? CircleAvatar(
                              backgroundImage: MemoryImage(c.avatar!))
                          : CircleAvatar(
                              child: Text(c.initials()),
                              backgroundColor: Color.fromRGBO(255, 75, 38, 1.0),
                            ),
                      title: Text(
                        c.displayName ?? "",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  },
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }

  void contactOnDeviceHasBeenUpdated(Contact contact) {
    this.setState(() {
      var id = _contacts?.indexWhere((c) => c.identifier == contact.identifier);
      _contacts![id!] = contact;
    });
  }

    sendContact(Index) async {
    var currentUser = await FirebaseAuth.instance.currentUser;
    //save messages data for sender
    await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser?.uid)
        .collection('Chats')
        .doc(widget.recieverId.toString().trim())
        .collection('Messages')
        .add({
      'Sender ID': currentUser?.uid,
      'Reciever ID': widget.recieverId.toString(),
      'Sender Name': currentUser?.displayName,
      'Reciever Name': widget.recieverName,
      'Contact Name' : _contacts![Index].displayName.toString(),
      'Message Content': _contacts![Index].phones![0].value.toString(),
      'Date and Time' : DateTime.now(),
      'Reciever Photo' : widget.recieverPhoto,
      'Type': 'Contact'
    });

    //save messages data for reciever
    await FirebaseFirestore.instance
        .collection('users')
        .doc(widget.recieverId.toString().trim())
        .collection('Chats')
        .doc(currentUser?.uid)
        .collection('Messages')
        .add({
      'Sender ID': currentUser?.uid,
      'Reciever ID': widget.recieverId,
      'Sender Name': currentUser?.displayName,
      'Reciever Name': widget.recieverName,
      'Contact Name' : _contacts![Index].displayName.toString(),
      'Message Content': _contacts![Index].phones![0].value.toString(),
      'Date and Time' : DateTime.now(),
      'Reciever Photo' : widget.recieverPhoto,
      'Type': 'Contact',
    });
  }
}



