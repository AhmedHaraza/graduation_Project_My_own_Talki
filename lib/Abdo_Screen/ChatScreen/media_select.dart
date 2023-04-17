import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_my_own_talki/Abdo_Screen/ChatScreen/contacts_list.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class media_select extends StatefulWidget {
  media_select(this.screenwidth, {this.recieverId, this.recieverName,this.recieverPhoto});
  var screenwidth;
  var recieverId;
  var recieverName;
  var recieverPhoto;
  @override
  State<media_select> createState() => _media_selectState();
}

class _media_selectState extends State<media_select> {
  File? _image;
  String fileText = "";
  var messagePhoto;

  FilePickerResult? result;
  String? _fileName;
  PlatformFile? pickedfile;
  bool isLoading = false;
  File? fileToDisplay;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 60),
      child: SimpleDialog(
        insetPadding: const EdgeInsets.all(10),
        backgroundColor: const Color(0xff161616),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.bottomCenter,
        contentPadding: const EdgeInsets.fromLTRB(5, 40, 5, 40),
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: widget.screenwidth),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: IconButton(
                    onPressed: OpenFile,
                    icon: const Icon(
                      Icons.upload_file,
                      color: Colors.white,
                    ),
                    iconSize: 30,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.location_on,
                      color: Colors.white,
                    ),
                    iconSize: 30,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: IconButton(
                    onPressed: pickImage,
                    icon: const Icon(
                      Icons.photo_camera,
                      color: Colors.white,
                    ),
                    iconSize: 30,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: IconButton(
                  onPressed: () async {
                    final permission = await Permission.photos.status;
                    if (permission != PermissionStatus.granted) {
                      await Permission.photos.request();
                    }
                    try {
                      setState(() {
                        isLoading = true;
                      });
                      result = await FilePicker.platform.pickFiles(
                          type: FileType.image, allowMultiple: false);
                      if (result != null) {
                        _fileName = result!.files.first.name;
                        pickedfile = result!.files.first;
                        _image = File(pickedfile!.path.toString());
                        var user = FirebaseAuth.instance.currentUser;
                        var randomName = Random().nextInt(1000000000);
                        var ref = await FirebaseStorage.instance.ref();
                        var userImage = await ref
                            .child('users')
                            .child('messages')
                            .child('images/${randomName}${user?.displayName}');
                        await userImage.putFile(_image!);
                        String imageUrl = await userImage.getDownloadURL();
                        setState(() {
                          messagePhoto = imageUrl;
                        });
                        await sendMessage();
                        Navigator.of(context, rootNavigator: true)
                            .pop('dialog');
                      }
                      setState(() {
                        isLoading = false;
                      });
                    } catch (e) {
                      print(e);
                    }
                    if (result == null) return;
                  },
                  icon: const Icon(
                    Icons.image,
                    color: Colors.white,
                  ),
                  iconSize: 30,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: IconButton(
                  onPressed: () async {
                    final result = await FilePicker.platform.pickFiles(
                      allowMultiple: false,
                      type: FileType.audio,
                      //allowedExtensions: ['m4a','mp3','aac'],
                    );
                    if (result == null) return;
                    //OpenFile(result.files);
                  },
                  icon: const Icon(
                    Icons.audio_file,
                    color: Colors.white,
                  ),
                  iconSize: 30,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: IconButton(
                  onPressed: () async {
                    final permission = await Permission.contacts.status;
                    if (permission != PermissionStatus.granted) {
                      await Permission.contacts.request();
                    } else {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ContactListPage(
                            recieverId: widget.recieverId,
                            recieverName: widget.recieverName,
                            recieverPhoto: widget.recieverPhoto,
                          )));
                    }
                  },
                  icon: const Icon(
                    Icons.contacts,
                    color: Colors.white,
                  ),
                  iconSize: 30,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void pickImage() async {
    final permission = await Permission.camera.status;
    if (permission != PermissionStatus.granted) {
      await Permission.camera.request();
    } else {
      try {
        var image = await ImagePicker().pickImage(source: ImageSource.camera);
        _image = File(image!.path);
        var user = FirebaseAuth.instance.currentUser;
        var randomName = Random().nextInt(1000000000);
        var ref = await FirebaseStorage.instance.ref();
        var userImage = await ref
            .child('users')
            .child('messages')
            .child('images/${randomName}${user?.displayName}');
        await userImage.putFile(_image!);
        String imageUrl = await userImage.getDownloadURL();
        setState(() {
          messagePhoto = imageUrl;
        });
        await sendMessageCamera();
        Navigator.of(context, rootNavigator: true).pop('dialog');
      } catch (e) {
        print(e);
      }
    }
  }

  void OpenFile() async {
    final permission = await Permission.manageExternalStorage.status;
    if (permission != PermissionStatus.granted) {
      await Permission.manageExternalStorage.request();
    }
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc'],
    );
    if (result != null && result.files.single.path != null) {
      PlatformFile file = result.files.first;
      print(file.name);
      print(file.bytes);
      print(file.size);
      print(file.extension);
      print(file.path);

      File _file = File(result.files.single.path!);
      fileText = _file.path;
    }
  }

  sendMessage() async {
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
      'Reciever ID': widget.recieverId,
      'Sender Name': currentUser?.displayName,
      'Reciever Name': widget.recieverName,
      'Message Content': messagePhoto,
      'Date and Time': DateTime.now(),
      'Reciever Photo' : widget.recieverPhoto,
      'Type': 'Photo'
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
      'Message Content': messagePhoto,
      'Date and Time': DateTime.now(),
      'Reciever Photo' : widget.recieverPhoto,
      'Type': 'Photo'
    });
  }

  sendMessageCamera() async {
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
      'Reciever ID': widget.recieverId,
      'Sender Name': currentUser?.displayName,
      'Reciever Name': widget.recieverName,
      'Message Content': messagePhoto,
      'Date and Time': DateTime.now(),
      'Reciever Photo' : widget.recieverPhoto,
      'Type': 'Photo'
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
      'Message Content': messagePhoto,
      'Date and Time': DateTime.now(),
      'Reciever Photo' : widget.recieverPhoto,
      'Type': 'Photo'
    });
  }
}
