// ignore_for_file: use_key_in_widget_constructors, constant_identifier_names, camel_case_types, sort_child_properties_last, avoid_unnecessary_containers, file_names, non_constant_identifier_names, deprecated_member_use

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/CircleAvatar/CircleAvatar.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/Navigator.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/TextForm/Myform.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/my_theme.dart';
import 'package:image_picker/image_picker.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class create_an_account extends StatefulWidget {
  static const String route_name_create_an_account = 'routename';

  @override
  State<create_an_account> createState() => _create_an_accountState();
}

class _create_an_accountState extends State<create_an_account> {
  bool _visState1 = true;
  bool _visState2 = true;
  File? _image;

  final _formState = GlobalKey<FormState>();

  TextEditingController userSignUpEmail = new TextEditingController();
  TextEditingController userSignUpPassword = new TextEditingController();
  TextEditingController userSignUpConfirmPassword = new TextEditingController();
  TextEditingController userFirstName = new TextEditingController();
  TextEditingController userLastName = new TextEditingController();
  TextEditingController userPhoneNumber = new TextEditingController();
  TextEditingController userBirthDate = new TextEditingController();

  signUpAddUser() async {
    try {
      UserCredential? userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: userSignUpEmail.text, password: userSignUpPassword.text)
          .then((value) async {
        var user = FirebaseAuth.instance.currentUser;

        await FirebaseFirestore.instance
            .collection('users')
            .doc(user?.uid)
            .set({
          'First Name': userFirstName.text,
          'Last Name': userLastName.text,
          'Email' : userSignUpEmail.text,
          'Password' : userSignUpPassword.text,
          'Phone Number': userPhoneNumber.text,
          'Birth Date': userBirthDate.text,
        });
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.info,
          animType: AnimType.rightSlide,
          title: 'Error',
          body: Padding(
              padding: EdgeInsets.all(16), child: Text('weak-password')),
        )..show();
      } else if (e.code == 'email-already-in-use') {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.info,
          animType: AnimType.rightSlide,
          title: 'Error',
          body: Padding(
              padding: EdgeInsets.all(16), child: Text('email-already-in-use')),
        )..show();
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () async {
          final shouldpop = await showMyDialog();
          //CircleAvatar_go_to_sin_in(context);
          if (shouldpop == false) {
            return false;
          } else {
            CircleAvatar_go_to_sin_in(context);
            return true;
          }
        },
        child: Scaffold(
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Theme(
              data: ThemeData(errorColor: Color.fromRGBO(255, 75, 38, 1.0)),
              child: Form(
                key: _formState,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                            padding:
                                REdgeInsets.only(top: 50, left: 20, right: 170),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Create an',
                                  style: Theme.of(context).textTheme.headline1,
                                ),
                                Text(
                                  'account',
                                  style: Theme.of(context).textTheme.headline1,
                                ),
                              ],
                            )),
                        SizedBox(height: 4.h),
                      ],
                    ),
                    Center(
                      child: InkWell(
                        onTap: () => showDialog(
                            context: context,
                            builder: (context) => Transform.translate(
                                  offset: Offset(0, -100),
                                  child: Container(
                                    margin:
                                        REdgeInsets.only(right: 45, left: 45),
                                    child: SimpleDialog(
                                      backgroundColor: Color(0xff262626),
                                      children: [
                                        ListTile(
                                          onTap: pickImage,
                                          title: Text(
                                            "Take a Photo",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xff5F5A5A)),
                                          ),
                                          leading: Icon(
                                            Icons.photo_camera,
                                            color: Color(0xff5F5A5A),
                                          ),
                                        ),
                                        ListTile(
                                          onTap: pickfile,
                                          title: Text("Upload Photo",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xff5F5A5A))),
                                          leading: Icon(Icons.photo_library,
                                              color: Color(0xff5F5A5A)),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                        child: CircleAvatar(
                          backgroundImage:
                              _image == null ? null : FileImage(_image!),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5, bottom: 3),
                            child: _image == null
                                ? Icon(
                                    Icons.add_a_photo,
                                    size: 40.sp,
                                  )
                                : Container(),
                          ),
                          backgroundColor:
                              const Color.fromRGBO(95, 90, 90, 1.0),
                          radius: 40.r,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    Padding(
                        padding: REdgeInsets.only(left: 20, right: 20),
                        child: MyForme(
                          'Email or Phone Number',
                          icon: const Icon(Icons.person,
                              color: Color.fromRGBO(95, 90, 90, 1.0)),
                          TextInputType.emailAddress,
                          fieldController: userSignUpEmail,
                        )),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.4,
                          child: TextFormField(
                            validator: (value) =>
                                (value == '') ? 'This Value is Required' : null,
                            controller: userFirstName,
                            maxLength: 10,
                            decoration: InputDecoration(
                              counterText: "",
                              prefixIcon: Icon(
                                Icons.person,
                                color: Color.fromRGBO(95, 90, 90, 1.0),
                              ),
                              filled: true,
                              fillColor: const Color.fromRGBO(44, 44, 44, 1.0),
                              hintText: 'First Name',
                              hintStyle: TextStyle(
                                fontSize: 12.sp,
                                color: Color.fromRGBO(95, 90, 90, 1.0),
                                fontWeight: FontWeight.bold,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.r),
                                  borderSide: BorderSide(
                                      color: MyThemeData.colorgray,
                                      width: 3.w)),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.r),
                                borderSide: BorderSide(
                                    color: MyThemeData.colorgray, width: 3.w),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.r),
                                borderSide: BorderSide(
                                    color: MyThemeData.colorgray, width: 3.w),
                              ),
                              contentPadding: EdgeInsets.all(10),
                            ),
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                                color: Color.fromRGBO(95, 90, 90, 1.0),
                                fontSize: 14.sp),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.4,
                          child: TextFormField(
                            validator: (value) =>
                                (value == '') ? 'This Value is Required' : null,
                            controller: userLastName,
                            maxLength: 10,
                            decoration: InputDecoration(
                                counterText: "",
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Color.fromRGBO(95, 90, 90, 1.0),
                                ),
                                filled: true,
                                fillColor:
                                    const Color.fromRGBO(44, 44, 44, 1.0),
                                hintText: 'Last Name',
                                hintStyle: TextStyle(
                                  fontSize: 12.sp,
                                  color: Color.fromRGBO(95, 90, 90, 1.0),
                                  fontWeight: FontWeight.bold,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.r),
                                    borderSide: BorderSide(
                                        color: MyThemeData.colorgray,
                                        width: 3.w)),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.r),
                                  borderSide: BorderSide(
                                      color: MyThemeData.colorgray, width: 3.w),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.r),
                                  borderSide: BorderSide(
                                      color: MyThemeData.colorgray, width: 3.w),
                                ),
                                contentPadding: REdgeInsets.all(10)),
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                                color: Color.fromRGBO(95, 90, 90, 1.0),
                                fontSize: 14.sp),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Padding(
                      padding: REdgeInsets.only(left: 20, right: 20),
                      child: Myform2(
                        'Password',
                        const Icon(
                          Icons.lock,
                          size: 20,
                          color: Color.fromRGBO(95, 90, 90, 1.0),
                        ),
                        TextInputType.visiblePassword,
                        addicon: IconButton(
                          onPressed: () {
                            setState(() {
                              _visState1 = !_visState1;
                            });
                          },
                          icon: (Icon(
                            _visState1
                                ? Icons.visibility
                                : Icons.visibility_off,
                            size: 20.sp,
                          )),
                          color: const Color.fromRGBO(95, 90, 90, 1.0),
                        ),
                        Visibilty_Paswword: _visState1,
                        fieldController: userSignUpPassword,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Center(
                      child: Padding(
                        padding: REdgeInsets.only(left: 20, right: 20),
                        child: Myform2(
                          'Confirm Password',
                          const Icon(
                            Icons.lock,
                            size: 20,
                            color: Color.fromRGBO(95, 90, 90, 1.0),
                          ),
                          TextInputType.visiblePassword,
                          addicon: IconButton(
                            onPressed: () {
                              setState(() {
                                _visState2 = !_visState2;
                              });
                            },
                            icon: (Icon(
                              _visState2
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              size: 20.sp,
                            )),
                            color: const Color.fromRGBO(95, 90, 90, 1.0),
                          ),
                          Visibilty_Paswword: _visState2,
                          fieldController: userSignUpConfirmPassword,
                        ),
                      ),
                    ),
                    Container(
                      margin: REdgeInsets.only(top: 10, left: 20, right: 20),
                      child: IntlPhoneField(
                        controller: userPhoneNumber,
                        disableLengthCheck: true,
                        dropdownIcon: Icon(
                          Icons.arrow_drop_down,
                          size: 25.sp,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: MyThemeData.colorgray,
                          hintText: 'Phone Number',
                          hintStyle: TextStyle(
                            fontSize: 14.sp,
                            color: Color.fromRGBO(95, 90, 90, 1.0),
                            fontWeight: FontWeight.bold,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r)),
                          contentPadding: REdgeInsets.all(16),
                        ),
                        keyboardType: TextInputType.phone,
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Padding(
                      padding: REdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        validator: (value) {
                          if (value == '') {
                            return 'This Value is Required';
                          } else {
                            return null;
                          }
                        },
                        controller: userBirthDate,
                        style: TextStyle(
                            color: const Color.fromRGBO(95, 90, 90, 1.0),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.r),
                                borderSide: BorderSide(
                                    color: MyThemeData.colorgray, width: 3.w)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.r),
                                borderSide: BorderSide(
                                    color: MyThemeData.colorgray, width: 3.w)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.r),
                                borderSide: BorderSide(
                                    color: MyThemeData.colorgray, width: 3.w)),
                            hintText: "Birthdate dd / mm / yy",
                            hintStyle: TextStyle(
                              color: MyThemeData.filetextfiled,
                              fontSize: 12.sp,
                              fontWeight: MyThemeData.fontWeight.fontWeight,
                            ),
                            hintMaxLines: 2,
                            filled: true,
                            fillColor: MyThemeData.colorgray,
                            prefixIcon: Icon(
                              Icons.calendar_today,
                              size: 20,
                              color: Color.fromRGBO(95, 90, 90, 1.0),
                            )),
                        keyboardType: TextInputType.datetime,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Wrap(
                      children: [
                        Container(
                          margin: REdgeInsets.only(left: 20),
                          width: 7.0.w,
                          height: 15.0.h,
                          decoration: const BoxDecoration(
                              color: Color.fromRGBO(95, 90, 90, 1.0),
                              shape: BoxShape.circle),
                        ),
                        SizedBox(
                          width: 4.w,
                          height: 20.h,
                        ),
                        Container(
                          child: RichText(
                            maxLines: 2,
                            text: TextSpan(children: [
                              TextSpan(
                                  text: 'By Clicking The  ',
                                  style: MyThemeData.Rich_Text)
                            ]),
                          ),
                        ),
                        Container(
                          child: Text(
                            'Register  ',
                            style: TextStyle(
                                color: const Color.fromRGBO(255, 75, 38, 1.0),
                                fontSize: 12.sp),
                          ),
                        ),
                        Container(
                          child: Text(
                            'button, you agree to the',
                            style: MyThemeData.Rich_Text,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text(
                            ' public offer',
                            style: MyThemeData.Rich_Text,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Padding(
                              padding: REdgeInsets.only(left: 24),
                              child: Text(
                                'Register',
                                style: MyThemeData.Register,
                              )),
                        ),
                        Expanded(
                            child: InkWell(
                                onTap: () async {
                                  if (_formState.currentState!.validate()) {
                                    await signUpAddUser();
                                    CircleAvatar_go_to_sin_in(context);
                                  } else {}
                                },
                                child: My_CircleAvatar()))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void pickImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      _image = File(image!.path);
    });
    Navigator.of(context, rootNavigator: true).pop('dialog');
  }

  // void pickGalaey() async {
  //   var image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //   setState(() {
  //     _image = File(image!.path);
  //     Navigator.of(context, rootNavigator: true).pop('dialog');
  //   });
  // }

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
}
