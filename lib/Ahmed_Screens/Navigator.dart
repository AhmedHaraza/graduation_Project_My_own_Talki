import 'package:flutter/material.dart';
import 'package:graduation_project_my_own_talki/Abdo_Screen/ChatScreen/main_chat_screen.dart';
import 'package:graduation_project_my_own_talki/Abdo_Screen/ChatWallPaperScreen/chatwallpaper_screen.dart';
import 'package:graduation_project_my_own_talki/Abdo_Screen/ContactsScreen/contacts_screen.dart';
import 'package:graduation_project_my_own_talki/Abdo_Screen/EditProfileScreen/edit_profile_screen.dart';
import 'package:graduation_project_my_own_talki/Abdo_Screen/HideStatusScreen/hide_status_screen.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/Home_Screen_Messenger/Main_Navigation.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/Home_Screen_Messenger/add_Friend.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/Home_Screen_Messenger/contectsmessegegroup.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/Sign%20In.dart';
import 'package:graduation_project_my_own_talki/Ahmed_Screens/create%20an%20account.dart';
import 'package:graduation_project_my_own_talki/Mohamed/Change_Pass_Scren.dart';
import 'package:graduation_project_my_own_talki/Mohamed/Forget_Pass_Scren.dart';
import 'package:graduation_project_my_own_talki/Mohamed/GroupSettings.dart';
import 'package:graduation_project_my_own_talki/Mohamed/TypeS.dart';
import 'package:graduation_project_my_own_talki/Nada_Screens/Custom_Wallpaper.dart';
import 'package:graduation_project_my_own_talki/Nada_Screens/Reset_Password.dart';
import 'package:graduation_project_my_own_talki/Nada_Screens/User_Info.dart';
import 'package:graduation_project_my_own_talki/lib/Mazen_Screens/OtpForm.dart';
import 'package:graduation_project_my_own_talki/lib/Mazen_Screens/bright.dart';
import 'package:graduation_project_my_own_talki/lib/Mazen_Screens/dark.dart';
import 'package:graduation_project_my_own_talki/lib/Mazen_Screens/my_status.dart';
import 'package:graduation_project_my_own_talki/lib/Mazen_Screens/solid_color.dart';
import 'package:graduation_project_my_own_talki/lib/Mazen_Screens/status_2.dart';
import 'package:graduation_project_my_own_talki/lib/Mazen_Screens/status_privacy.dart';

import '../Abdo_Screen/Create_A_Group_Screen/create_a_group_screen.dart';

void Select_Screen_create_an_ccount(BuildContext ctx) {
  Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
    return create_an_account();
  }));
}

void Select_Screen_Sin_In(BuildContext ctx) {
  Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
    return Sign_In();
  }));
}

void Select_Screen_Pinned_Message(BuildContext ctx) {
  Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
    return my_main();
  }));
}

void CircleAvatar_go_to_sin_in(BuildContext ctx) {
  Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
    return Sign_In();
  }));
}

void forgetpass(BuildContext ctx) {
  Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
    return ForgetPassScren();
  }));
}

void textbackforgetpass(BuildContext ctx) {
  Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
    return Sign_In();
  }));
}

void circleforgetpasswithotp(BuildContext ctx) {
  Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
    return OtPForm();
  }));
}

void Submitenterotp(BuildContext ctx) {
  Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
    return const Reset_Password();
  }));
}

void submitresetpassword(BuildContext ctx) {
  Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
    return  Sign_In();
  }));
}

void BackEnterotp(BuildContext ctx) {
  Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
    return  ForgetPassScren();
  }));
}

void BackResetPass(BuildContext ctx) {
  Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
    return  OtPForm();
  }));
}

void addfriend(BuildContext ctx) {
  Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
    return  const Addfrinds();
  }));
}

void addyourgroup(BuildContext ctx) {
  Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
    return const CreateGroup();
  }));
}

void crilcleavaatargrope(BuildContext ctx) {
  Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
    return  my_main();
  }));
}

void Editprofile(BuildContext ctx) {
  Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
    return  EditProfileScreen();
  }));
}

void Backandsubmitineditprofile(BuildContext ctx) {
  Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
    return my_main();
  }));
}

void Addfrinedgroup(BuildContext ctx) {
  Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
    return const Addfrinds();
  }));
}

void addstatus(BuildContext ctx) {
  Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
    return  StatusScreen();
  }));
}

void changepassword(BuildContext ctx) {
  Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
    return  const ChangePassScren();
  }));
}

void Broadcastmessage(BuildContext ctx) {
  Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
    return  const contectsmessegegroup();
  }));
}

void Statusprivacy(BuildContext ctx) {
  Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
    return   status_privacy();
  }));
}

void SttingMystatus(BuildContext ctx) {
  Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
    return   mystatus();
  }));
}
void Mycontactsexceptinstatusprivacy(BuildContext ctx) {
  Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
    return    HideStatusScreen();
  }
  ));
}

void iconEdit(BuildContext ctx) {
  Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
    return TypeS();
  }));
}

void TextChange(BuildContext ctx) {
  Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
    return const Custom_Wallpaper();
  }));
}

void IconBacinCoustomWall(BuildContext ctx) {
  Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
    return const ChatWallPaperScreen();
  }));
}

void ImageBrightincustomwallpaper(BuildContext ctx) {
  Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
    return  bright();
  }));
}

void ImageDarkincustomwallpaper(BuildContext ctx) {
  Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
    return  dark();
  }));
}

void ImageSolidincustomwallpaper(BuildContext ctx) {
  Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
    return  solid_color();
  }));
}

void circleAvatarinchangepassword(BuildContext ctx) {
  Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
    return  my_main();
  }));
}
void CallSomePeople(BuildContext ctx) {
  Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
    return  ContactsScreen();
  }));
}

void pageGroupSettings(BuildContext ctx) {
  Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
    return  GroupSettings();
  }
  ));
}

void userInfo(BuildContext ctx) {
  Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
    return  User_Info();
  }
  ));
}


