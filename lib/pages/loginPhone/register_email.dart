import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproject/pages/loginPhone/welcome_page.dart';
import 'package:finalproject/theme/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:validators/validators.dart';

class EmailRegisterPage extends StatefulWidget {
  const EmailRegisterPage({key}) : super(key: key);

  @override
  State<EmailRegisterPage> createState() => _EmailRegisterPageState();
}

class _EmailRegisterPageState extends State<EmailRegisterPage> {
  @override
  final _formKey = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppbar(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return ListView(
      children: [
        Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 15.0, right: 8.0),
              // color: Colors.blue,
              padding: const EdgeInsets.only(left: 25, top: 30),
              width: 350,
              child: Text(
                "Email của bạn là gì ",
                style: TextStyle(
                  color: black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 20, top: 40),
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Text(
                "Hãy xác minh email của bạn để không bị mất quyền truy cập vào tài khoản",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 40, top: 20, left: 40),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _email,
                      decoration: InputDecoration(
                        hintText: "Nhập Email",
                      ),
                      validator: (value) {
                        if (value != null) {
                          if (value.length > 5 &&
                              value.contains('@') &&
                              value.endsWith('.com')) {
                            return null;
                          }
                          return 'Enter a Valid Email Address';
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            InkWell(
              borderRadius: BorderRadius.circular(60),
              onTap: (() async {
                // if (!_formKey.currentState.validate()) {
                // FirebaseAuth.instance.currentUser?.uo(_text.text);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomePage()),
                );
                User user = FirebaseAuth.instance.currentUser;
                await FirebaseFirestore.instance
                    .collection('user')
                    .doc(user.uid)
                    .update({
                  'email': _email.text,
                });
                // } else {
                //   return;
                // }
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
                    "TIẾP TỤC",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
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

  AppBar getAppbar() {
    return AppBar(
      elevation: 0,
      backgroundColor: white,
      iconTheme: IconThemeData(
        color: black,
      ),
    );
  }
}
