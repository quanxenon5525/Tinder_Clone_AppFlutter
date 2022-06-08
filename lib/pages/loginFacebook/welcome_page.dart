import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproject/pages/loginFacebook/birthday_page.dart';
import 'package:finalproject/theme/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: getBody(),
    );
  }

  Widget getBody() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 100, left: 150, right: 150),
          child: Image.asset("assets/images/logotinder.png"),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15),
          padding: EdgeInsets.only(left: 13, right: 13),
          child: Text(
            "Chào mừng bạn đến với Tinder",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          child: Text(
            "Vui lòng tuân thủ các Quy Tắt Chung này",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: grey,
            ),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Column(
          children: [
            Container(
              // color: Colors.blue,
              margin: EdgeInsets.only(right: 60),
              padding: EdgeInsets.only(left: 15),
              width: 300,
              child: Row(
                children: [
                  Container(
                    child: Icon(
                      Icons.check,
                      color: Colors.pink,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Hãy là chính bạn",
                    style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.w800,
                        fontSize: 20),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              // color: Colors.yellow,
              margin: EdgeInsets.only(left: 35, right: 25),
              child: Text(
                "Đảm bảo ảnh, độ tuổi và tiểu sử của bạn đều là thật",
                style: TextStyle(
                    color: grey, fontSize: 17, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Column(
          children: [
            Container(
              // color: Colors.blue,
              margin: EdgeInsets.only(right: 60),
              padding: EdgeInsets.only(left: 15),
              width: 300,
              child: Row(
                children: [
                  Container(
                    child: Icon(
                      Icons.check,
                      color: Colors.pink,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Đảm bảo an toàn",
                    style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.w800,
                        fontSize: 20),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              // color: Colors.yellow,
              margin: EdgeInsets.only(left: 35, right: 25),
              child: Text(
                "Đừng vội vàng chia sẻ thông tin cá nhân. Hẹn hò an toàn",
                style: TextStyle(
                    color: grey, fontSize: 17, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Column(
          children: [
            Container(
              // color: Colors.blue,
              margin: EdgeInsets.only(right: 60),
              padding: EdgeInsets.only(left: 15),
              width: 300,
              child: Row(
                children: [
                  Container(
                    child: Icon(
                      Icons.check,
                      color: Colors.pink,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Cư xử chuẩn mực",
                    style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.w800,
                        fontSize: 20),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              // color: Colors.yellow,
              margin: EdgeInsets.only(left: 35, right: 52),
              child: Text(
                "Tôn trọng người khác và đối xử với họ như cách bạn muốn mọi người thể hiện với bạn",
                style: TextStyle(
                    color: grey, fontSize: 17, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Column(
          children: [
            Container(
              // color: Colors.blue,
              margin: EdgeInsets.only(right: 60),
              padding: EdgeInsets.only(left: 15),
              width: 300,
              child: Row(
                children: [
                  Container(
                    child: Icon(
                      Icons.check,
                      color: Colors.pink,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Hãy luôn chủ động",
                    style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.w800,
                        fontSize: 20),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              // color: Colors.yellow,
              margin: EdgeInsets.only(left: 0, right: 120),
              child: Text(
                "Luôn báo cảo hành vi xấu",
                style: TextStyle(
                    color: grey, fontSize: 17, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        SizedBox(
          height: 40,
        ),
        InkWell(
          borderRadius: BorderRadius.circular(60),
          onTap: (() async {
            // User user = FirebaseAuth.instance.currentUser;

            // await FirebaseFirestore.instance
            //     .collection('user')
            //     .doc(user.uid)
            //     .update({
            //   'uid': user.uid,
            // });
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BirthdayPage()),
            );
          }),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              color: Color.fromARGB(255, 255, 25, 75),
            ),
            width: 320,
            height: 50,
            child: Center(
              child: Text(
                "TÔI ĐỒNG Ý",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
