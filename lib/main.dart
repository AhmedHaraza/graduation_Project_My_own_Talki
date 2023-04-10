import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project_my_own_talki/Abdo_Screen/ChatScreen/main_chat_screen.dart';
import 'package:graduation_project_my_own_talki/Abdo_Screen/GroupChatScreen/main_group_chat_screen.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/Home_Screen_Messenger/Main_Navigation.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/my_theme.dart';
import 'package:graduation_project_my_own_talki/Shimmer.dart';
import 'package:graduation_project_my_own_talki/provider/myprovider.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

bool darkmode = false;
bool isLogin = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    isLogin = false;
  } else {
    isLogin = true;
  }
  runApp(ChangeNotifierProvider(
      create: (context) => myprovider(), child: Home_page()));
}

class Home_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          myprovider provider = Provider.of<myprovider>(context);
          return OverlaySupport.global(
            child: MaterialApp(
              theme: MyThemeData.lightTheme,
              darkTheme: MyThemeData.darktheme,
              themeMode: provider.theme,
              debugShowCheckedModeBanner: false,
              initialRoute:
                  //MainGroupChatScreen.route_MainGroupChatScreen,
                  MyHomepage.route_MyHomepage,
              routes: {
                MainChatScreen.route_MainChatScreen:(c)=>MainChatScreen(),
                MainGroupChatScreen.route_MainGroupChatScreen: (c) =>
                    MainGroupChatScreen(),
                MyHomepage.route_MyHomepage: (c) => MyHomepage(),
                my_main.route_my_main : (c) => my_main(),
              },
            ),
          );
        });
  }
}