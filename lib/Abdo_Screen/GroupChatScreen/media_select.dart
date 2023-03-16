import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class media_select extends StatefulWidget {
  media_select(this.screenwidth);
  var screenwidth;
  File? _image;
  @override
  State<media_select> createState() => _media_selectState();
}

class _media_selectState extends State<media_select> {
  File? _image;
  String fileText = "";
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
                    final result = await FilePicker.platform.pickFiles(
                      allowMultiple: true,
                      type: FileType.image,
                    );
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
                  onPressed: () {},
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
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    _image = File(image!.path);
    Navigator.of(context, rootNavigator: true).pop('dialog');
  }

  void pickGalaey() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    _image = File(image!.path);
    Navigator.of(context, rootNavigator: true).pop('dialog');
  }

  void OpenFile() async {
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
}