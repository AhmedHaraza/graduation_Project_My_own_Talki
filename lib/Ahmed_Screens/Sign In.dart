// ignore_for_file: avoid_unnecessary_containers, use_key_in_widget_constructors, constant_identifier_names, camel_case_types, file_names, sized_box_for_whitespace

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/CircleAvatar/CircleAvatar.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/Navigator.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/TextForm/Myform.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/my_theme.dart';

class Sign_In extends StatefulWidget {
  static const String Route_Sign_In = 'Sing In';
  @override
  State<Sign_In> createState() => _Sign_InState();
}

class _Sign_InState extends State<Sign_In> {
  final _formState = GlobalKey<FormState>();

  bool _visState = true;
  TextEditingController userSignInEmail = new TextEditingController();
  TextEditingController userSignInPassword = new TextEditingController();

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
// End of Google Sign in

// FaceBook Sign in
  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
// End of FaceBook Sign in

  Sign_In() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userSignInEmail.text,
        password: userSignInPassword.text,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.info,
          animType: AnimType.rightSlide,
          title: 'Error',
          body: Padding(
              padding: EdgeInsets.all(16),
              child: Text('No user found for that email.')),
        )..show();
      } else if (e.code == 'wrong-password') {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.info,
          animType: AnimType.rightSlide,
          title: 'Error',
          body: Padding(
              padding: EdgeInsets.all(16), child: Text('wrong-password')),
        )..show();
      } else {
        print(e);
        AwesomeDialog(
          context: context,
          dialogType: DialogType.info,
          animType: AnimType.rightSlide,
          title: 'Error',
          body: Padding(
              padding: EdgeInsets.all(16),
              child: Text('Wrong Email or Password')),
        )..show();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formState,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: REdgeInsets.only(top: 60, left: 20, bottom: 34),
                  width: 132.w,
                  height: 55.h,
                  child: Image.asset(
                    "assets/image/Talki.png",
                  ),
                ),
                Container(
                  margin: REdgeInsets.only(left: 20, right: 19),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30.h),
                      Container(
                        child: MyForme(
                          'Email or Phone Number',
                          icon: Icon(
                            Icons.person,
                            color: const Color.fromRGBO(95, 90, 90, 1.0),
                            size: 20.sp,
                          ),
                          TextInputType.emailAddress,
                          fieldController: userSignInEmail,
                        ),
                      ),
                      SizedBox(height: 21.h),
                      Container(
                        child: Myform2(
                          'Password',
                          Icon(
                            Icons.lock,
                            size: 20.sp,
                            color: const Color.fromRGBO(95, 90, 90, 1.0),
                          ),
                          TextInputType.visiblePassword,
                          addicon: IconButton(
                            onPressed: () {
                              setState(() {
                                _visState = !_visState;
                              });
                            },
                            icon: (Icon(
                              _visState
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              size: 20.sp,
                            )),
                            color: const Color.fromRGBO(95, 90, 90, 1.0),
                          ),
                          Visibilty_Paswword: _visState,
                          fieldController: userSignInPassword,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              child: Text(
                                'Create a new account',
                                style: MyThemeData.Page_Sign_in,
                              ),
                              onTap: () =>
                                  Select_Screen_create_an_ccount(context)),
                          SizedBox(width: 110.w),
                          InkWell(
                            child: Text(
                              'Forget Password',
                              style: MyThemeData.Page_Sign_in,
                            ),
                            onTap: () => forgetpass(context),
                          ),
                        ],
                      ),
                      SizedBox(height: 50.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                              child: Text(
                            'Sign In',
                            style: MyThemeData.Register,
                          )),
                          Container(
                            margin: REdgeInsets.only(right: 10),
                            child: InkWell(
                              child: My_CircleAvatar(),
                              onTap: () async {
                                if (_formState.currentState!.validate()) {
                                  UserCredential response = await Sign_In();
                                  if (response != null) {
                                    Select_Screen_Pinned_Message(context);
                                  } else {}
                                } else {}
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 55.h),
                      Center(
                          child: Text(
                        'Sign In with',
                        style: MyThemeData.Text_Sin_in,
                      )),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () async {
                              try {
                                await signInWithGoogle();
                                Select_Screen_Pinned_Message(context);
                              } catch (e) {
                                print(e);
                              }
                            },
                            child: const Image(
                                image: AssetImage(
                                    'assets/image/logos_google-icon.png')),
                          ),
                          SizedBox(
                            width: 17.w,
                          ),
                          const Center(
                            child: Image(
                                image: AssetImage(
                                    'assets/image/foundation_social-apple.png')),
                          ),
                          SizedBox(
                            width: 17.w,
                          ),
                          Center(
                              child: InkWell(
                            onTap: () async {
                              UserCredential response =
                                  await signInWithFacebook();
                              if (response != null) {
                                Select_Screen_Pinned_Message(context);
                                print(response);
                              } else {}
                            },
                            child: Image(
                                image: AssetImage(
                                    'assets/image/logos_facebook.png')),
                          )),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
