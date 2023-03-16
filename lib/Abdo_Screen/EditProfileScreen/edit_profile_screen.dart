// ignore_for_file: constant_identifier_names, sized_box_for_whitespace

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project_my_own_talki/Abdo_Screen/EditProfileScreen/custom_shape.dart';
import 'package:graduation_project_my_own_talki/Abdo_Screen/EditProfileScreen/data_field.dart';
import 'package:graduation_project_my_own_talki/Abdo_Screen/EditProfileScreen/user_info.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/Navigator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class EditProfileScreen extends StatefulWidget {
  static const String route_EditProfileScreen = 'EditProfileScreen';

  EditProfileScreen({super.key});
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController state = TextEditingController();
  TextEditingController FirstName = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController address = TextEditingController();
  final _formState = GlobalKey<FormState>();
  File? _image;
  final item = ['Male', 'Female'];
  String value = 'Male';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () async {
          final shouldpop = await showMyDialog();
          if (shouldpop == false) {
            return false;
          } else {
            Backandsubmitineditprofile(context);
            return true;
          }
        },
        child: Scaffold(
          backgroundColor: const Color.fromRGBO(22, 22, 22, 1.0),
          resizeToAvoidBottomInset: true,
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                CustomPaint(
                  size: Size(MediaQuery.of(context).size.width, 220.sp),
                  painter: MyPainter(),
                ),
                Container(
                  margin: REdgeInsets.fromLTRB(40, 30, 40, 20),
                  width: MediaQuery.of(context).size.width,
                  child: Form(
                    key: _formState,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              margin: REdgeInsets.all(8),
                              width: 80.w,
                              height: 80.h,
                              child: InkWell(
                                  onTap: () {},
                                  child: CircleAvatar(
                                      backgroundImage: _image == null
                                          ? null
                                          : FileImage(_image!),
                                      backgroundColor: Color(0xff4D5151),
                                      child: _image == null
                                          ? Icon(
                                              Icons.person,
                                              size: 60.sp,
                                            )
                                          : Container())),
                            ),
                            Positioned(
                              left: 55.sp,
                              bottom: 10.sp,
                              child: Container(
                                width: 35.w,
                                height: 35.h,
                                decoration: BoxDecoration(
                                  color: const Color(0xff434343),
                                  borderRadius: BorderRadius.circular(30.r),
                                  border: Border.all(
                                    width: 4.w,
                                    color: const Color(0xff202020),
                                  ),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) =>
                                            Transform.translate(
                                              offset: Offset(0, -100),
                                              child: Container(
                                                margin: REdgeInsets.only(
                                                    right: 30, left: 30),
                                                child: Transform.translate(
                                                  offset: Offset(0, -85),
                                                  child: SimpleDialog(
                                                    backgroundColor:
                                                        Color(0xff262626),
                                                    children: [
                                                      ListTile(
                                                        onTap: pickImage,
                                                        title: Text(
                                                          "Take a Photo",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Color(
                                                                  0xff5F5A5A)),
                                                        ),
                                                        leading: Icon(
                                                          Icons.photo_camera,
                                                          color:
                                                              Color(0xff5F5A5A),
                                                        ),
                                                      ),
                                                      ListTile(
                                                        onTap: pickfile,
                                                        title: Text(
                                                            "Upload Photo",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Color(
                                                                    0xff5F5A5A))),
                                                        leading: Icon(
                                                            Icons.photo_library,
                                                            color: Color(
                                                                0xff5F5A5A)),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ));
                                  },
                                  child: Icon(
                                    size: 16.sp,
                                    Icons.border_color,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: REdgeInsets.only(top: 3),
                          child: Text(
                            userName,
                            style: TextStyle(
                              fontSize: 24.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: REdgeInsets.all(5.0),
                          child: Text(
                            userEmail,
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          userPhoneNumber,
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white,
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: [
                                Container(
                                  margin: REdgeInsets.only(top: 25),
                                  alignment: Alignment.center,
                                  width: MediaQuery.of(context).size.width,
                                  child: Text(
                                    'Edit profile',
                                    style: TextStyle(
                                      fontSize: 28.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                    margin: REdgeInsets.only(top: 15),
                                    child: TextFormField(
                                      maxLength: 10,
                                      validator: (value) => (value == '')
                                          ? 'This Value is Required'
                                          : null,
                                      decoration: InputDecoration(
                                          counterText: "",
                                          filled: true,
                                          fillColor: const Color(0xff4D5151),
                                          hintText: 'Frist Name',
                                          hintStyle: TextStyle(
                                            fontSize: 14.sp,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12.r)),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12.r)),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12.r)),
                                          contentPadding: REdgeInsets.all(16)),
                                      keyboardType: TextInputType.name,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14.sp),
                                    )
                                    ),
                                Container(
                                  margin: REdgeInsets.only(top: 15),
                                  child: TextFormField(
                                      maxLength: 10,
                                      validator: (value) => (value == '')
                                          ? 'This Value is Required'
                                          : null,
                                      decoration: InputDecoration(
                                          counterText: "",
                                          filled: true,
                                          fillColor: const Color(0xff4D5151),
                                          hintText: 'Last Name',
                                          hintStyle: TextStyle(
                                            fontSize: 14.sp,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12.r)),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12.r)),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12.r)),
                                          contentPadding: REdgeInsets.all(16)),
                                      keyboardType: TextInputType.name,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14.sp),
                                    )
                                ),
                                Container(
                                  margin: REdgeInsets.only(top: 15),
                                  child: DataField(
                                    'Address',
                                    TextInputType.streetAddress,
                                    fieldController: address,
                                  ),
                                ),
                                Container(
                                  margin: REdgeInsets.only(top: 15),
                                  height: 65.h,
                                  child: IntlPhoneField(
                                    disableLengthCheck: true,
                                    dropdownIcon: Icon(
                                      Icons.arrow_drop_down,
                                      size: 25.sp,
                                    ),
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: const Color(0xff4D5151),
                                        hintText: 'Phone Number',
                                        hintStyle: TextStyle(
                                          fontSize: 14.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12.r)),
                                        contentPadding: REdgeInsets.all(16)),
                                    keyboardType: TextInputType.phone,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14.sp),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.topCenter,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.7,
                                        child: DataField(
                                          'State',
                                          TextInputType.streetAddress,
                                          fieldController: state,
                                        ),
                                      ),
                                      Container(
                                        padding: REdgeInsets.all(10),
                                        height: 43.h,
                                        decoration: BoxDecoration(
                                            color: Color(0xff4D5151),
                                            borderRadius:
                                                BorderRadius.circular(12.r)),
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.7,
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<String>(
                                            dropdownColor: Color(0xff4D5151),
                                            elevation: 0,
                                            value: value,
                                            isExpanded: true,
                                            items: item
                                                .map((item) => DropdownMenuItem(
                                                    child: Text(
                                                      item,
                                                      style: TextStyle(
                                                          fontSize: 14.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white),
                                                    ),
                                                    value: item))
                                                .toList(),
                                            onChanged: (value) => setState(() {
                                              this.value = value!;
                                            }),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: REdgeInsets.only(top: 15),
                                  width: 237.w,
                                  height: 50.h,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (_formState.currentState!.validate()) {
                                        Backandsubmitineditprofile(context);
                                      } else {}
                                    },
                                    style: ElevatedButton.styleFrom(
                                      alignment: Alignment.center,
                                      backgroundColor: const Color(0xffff4b26),
                                      padding: REdgeInsets.all(15),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                      ),
                                    ),
                                    child: Text(
                                      'Submit',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 20.sp),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool?> showMyDialog() => showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
            backgroundColor: Color(0xff262626),
            title: Text('Do you want to go back ?',
                style: TextStyle(color: Color(0xff5F5A5A))),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: Color(0xff5F5A5A)),
                  )),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: Text('Yes', style: TextStyle(color: Color(0xff5F5A5A))),
              ),
            ],
          ));
  DropdownMenuItem<String> buildmenuitem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
        ),
      );

  void pickImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      _image = File(image!.path);
    });
    Navigator.of(context, rootNavigator: true).pop('dialog');
  }

  FilePickerResult? result;
  String? _fileName;
  PlatformFile? pickedfile;
  bool isLoading = false;
  File? fileToDisplay;
  Future<void> pickfile() async {
    try {
      setState(() {
        isLoading = true;
      });
      result = await FilePicker.platform
          .pickFiles(type: FileType.image, allowMultiple: false);
      if (result != null) {
        _fileName = result!.files.first.name;
        pickedfile = result!.files.first;
        _image = File(pickedfile!.path.toString());
        Navigator.of(context, rootNavigator: true).pop('dialog');
      }

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }
  // void pickGalaey() async {
  //   var image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //   setState(() {
  //     _image = File(image!.path);
  //     Navigator.of(context, rootNavigator: true).pop('dialog');
  //   });
  // }
}
