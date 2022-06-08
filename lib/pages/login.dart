import 'package:finalproject/pages/process_login.dart';
import 'package:finalproject/pages/loginPhone/register_phone.dart';
import 'package:finalproject/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 25, 75),
      body: getBody(),
    );
  }

  Widget getBody() {
    return ListView(
      children: [
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 350, left: 80, right: 80),
              child: Image.asset("assets/images/logoWhite.png"),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Text(
                "Khi bấm Tạo Tài Khoản hoặc Đăng Nhập, bạn đồng ý Điều Khoản của chúng tôi, Tìm hiểu về cách chúng tôi xử lý dữ liệu của bạn trong Chính sách Quyền Riêng Tư và Chính sách Cookie của chúng tôi",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              borderRadius: BorderRadius.circular(60),
              onTap: (() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              }),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  color: white,
                ),
                width: 320,
                height: 50,
                child: Center(
                  child: Text(
                    "TẠO TÀI KHOẢN",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              borderRadius: BorderRadius.circular(60),
              onTap: (() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginMutilPage()),
                );
              }),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  border: Border.all(
                    color: white,
                  ),
                ),
                width: 320,
                height: 50,
                child: Center(
                  child: Text(
                    "ĐĂNG NHẬP",
                    style: TextStyle(
                      color: white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 320,
              height: 50,
              child: Center(
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    "Sự cố khi Đăng Nhập?",
                    style: TextStyle(
                      color: white,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
