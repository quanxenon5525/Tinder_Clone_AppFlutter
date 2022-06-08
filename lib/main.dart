// @dart=2.9
import 'package:finalproject/pages/home/root_app.dart';
import 'package:finalproject/pages/home/user/editInformation/edit.dart';
import 'package:finalproject/pages/home/user/setting.dart';
import 'package:finalproject/pages/home/user/shield/page/safe_center_screen.dart';
import 'package:finalproject/pages/loginPhone/SexualOrientation_page.dart';
import 'package:finalproject/pages/loginPhone/favorite_page.dart';
import 'package:finalproject/pages/login.dart';
import 'package:finalproject/pages/loginPhone/school_page.dart';
import 'package:finalproject/pages/loginPhone/imgRegister/upload_img.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  User user = FirebaseAuth.instance.currentUser;

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: user != null ? RootApp() : LoginPage(),
      // home: LoginPage(),
    ),
  );
  // home: Setting(),
  // home: SafeCenterScreen(),
  //   ),
  // );
}
