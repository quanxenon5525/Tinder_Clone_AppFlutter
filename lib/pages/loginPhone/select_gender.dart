import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproject/pages/loginPhone/SexualOrientation_page.dart';
import 'package:finalproject/theme/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class GenderUserPage extends StatefulWidget {
  const GenderUserPage({key}) : super(key: key);

  @override
  State<GenderUserPage> createState() => _GenderUserPageState();
}

class _GenderUserPageState extends State<GenderUserPage> {
  @override
  final _formKey = GlobalKey<FormState>();
  String selected = "first";
  String colorText = "first";
  String result = "";
  bool _checkbox = false;
  bool _checkboxListTile = false;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppbar(),
      body: getBody(),
    );
  }

  AppBar getAppbar() {
    return AppBar(
      elevation: 0,
      backgroundColor: white,
      // iconTheme: IconThemeData(
      //   color: black,
      // ),
      leading: IconButton(
        icon: Icon(
          Icons.close,
          color: black,
        ),
        iconSize: 45,
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }

  Widget getBody() {
    return ListView(
      children: [
        Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 50.0, right: 8.0),
              // color: Colors.blue,
              padding: const EdgeInsets.only(left: 25, top: 50),
              width: 350,
              child: Text(
                "Tôi là",
                style: TextStyle(
                  color: black,
                  fontSize: 50,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 70,
            ),
            InkWell(
              borderRadius: BorderRadius.circular(60),
              onTap: (() {
                setState(() {
                  selected = 'first';
                  colorText = 'first';
                });
              }),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  border: Border.all(
                      color: selected == 'first'
                          ? Color.fromARGB(255, 255, 25, 75)
                          : grey,
                      width: 2),
                ),
                width: 320,
                height: 50,
                child: Center(
                  child: Text(
                    "Nữ",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: colorText == 'first'
                            ? Color.fromARGB(255, 255, 25, 75)
                            : grey),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            InkWell(
              borderRadius: BorderRadius.circular(60),
              onTap: (() {
                setState(() {
                  selected = 'second';
                  colorText = 'second';
                });
              }),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  border: Border.all(
                      color: selected == 'second'
                          ? Color.fromARGB(255, 255, 25, 75)
                          : grey,
                      width: 2),
                ),
                width: 320,
                height: 50,
                child: Center(
                  child: Text(
                    "Nam",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: colorText == 'second'
                          ? Color.fromARGB(255, 255, 25, 75)
                          : grey,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            InkWell(
              borderRadius: BorderRadius.circular(60),
              onTap: (() {
                setState(() {
                  selected = 'thirt';
                  colorText = 'thirt';
                });
              }),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  border: Border.all(
                      color: selected == 'thirt'
                          ? Color.fromARGB(255, 255, 25, 75)
                          : grey,
                      width: 2),
                ),
                width: 320,
                height: 50,
                child: Center(
                  child: Text(
                    "Giới tính khác",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: colorText == 'thirt'
                          ? Color.fromARGB(255, 255, 25, 75)
                          : grey,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Container(
              // color: Colors.blue,
              width: 350,
              margin: EdgeInsets.only(left: 15, right: 15),
              child: CheckboxListTile(
                checkColor: white,
                activeColor: Color.fromARGB(255, 255, 25, 75),
                controlAffinity: ListTileControlAffinity.leading,
                title: Text(
                  'Hiển thị giới tính của tôi trên hồ sơ',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: black,
                    fontSize: 15,
                  ),
                ),
                value: _checkboxListTile,
                onChanged: (value) {
                  setState(() {
                    _checkboxListTile = !_checkboxListTile;
                  });
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              borderRadius: BorderRadius.circular(60),
              onTap: (() async {
                if (selected == "first") {
                  result = "Nữ";
                } else if (selected == "second") {
                  result = "Nam";
                } else {
                  result = "Giới Tính Khác";
                }

                if (selected != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SexualOrientation()),
                  );
                  User user = FirebaseAuth.instance.currentUser;
                  await FirebaseFirestore.instance
                      .collection('user')
                      .doc(user.uid)
                      .update({
                    'gender': result.toString(),
                  });
                } else {
                  return;
                }
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
}
