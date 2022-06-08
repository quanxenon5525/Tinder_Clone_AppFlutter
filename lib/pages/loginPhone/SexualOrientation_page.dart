import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproject/pages/loginPhone/choose_page.dart';
import 'package:finalproject/theme/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SexualOrientation extends StatefulWidget {
  const SexualOrientation({key}) : super(key: key);

  @override
  State<SexualOrientation> createState() => _SexualOrientationState();
}

class _SexualOrientationState extends State<SexualOrientation> {
  @override
  bool _checkbox = false;
  bool _checkboxListTile = false;
  bool _checkboxListTile1 = false;
  bool _checkboxListTile2 = false;
  bool _checkboxListTile3 = false;
  bool _checkboxListTile4 = false;
  bool _checkboxListTile5 = false;
  bool _checkboxListTile6 = false;
  List<String> strings = [];
  List<String> result = [];

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
      iconTheme: IconThemeData(
        color: black,
      ),
    );
  }

  Widget getBody() {
    return ListView(
      children: [
        Column(
          children: [
            Container(
              // color: Colors.blue,
              margin: EdgeInsets.only(left: 30, top: 70, right: 30),
              child: Text(
                "Khuynh hướng tính dục của tôi là",
                style: TextStyle(
                    color: black, fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              // color: Colors.blue,
              margin: EdgeInsets.only(right: 230),
              child: Text(
                "Chọn tối đa 3",
                style: TextStyle(
                    color: grey, fontWeight: FontWeight.w400, fontSize: 17),
              ),
            ),
            Container(
              // color: Colors.blue,
              child: Column(
                children: [
                  Container(
                    // color: Colors.blue,
                    width: 350,
                    margin: EdgeInsets.only(right: 15),
                    child: CheckboxListTile(
                      checkColor: white,
                      activeColor: Color.fromARGB(255, 255, 25, 75),
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Text(
                        'Dị Tính',
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
                  Container(
                    // color: Colors.blue,
                    width: 350,
                    margin: EdgeInsets.only(right: 15),
                    child: CheckboxListTile(
                      checkColor: white,
                      activeColor: Color.fromARGB(255, 255, 25, 75),
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Text(
                        'Đồng tính Nam',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: black,
                          fontSize: 15,
                        ),
                      ),
                      value: _checkboxListTile1,
                      onChanged: (value) {
                        setState(() {
                          _checkboxListTile1 = !_checkboxListTile1;
                        });
                      },
                    ),
                  ),
                  Container(
                    // color: Colors.blue,
                    width: 350,
                    margin: EdgeInsets.only(right: 15),
                    child: CheckboxListTile(
                      checkColor: white,
                      activeColor: Color.fromARGB(255, 255, 25, 75),
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Text(
                        'Đồng tính Nữ',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: black,
                          fontSize: 15,
                        ),
                      ),
                      value: _checkboxListTile2,
                      onChanged: (value) {
                        setState(() {
                          _checkboxListTile2 = !_checkboxListTile2;
                        });
                      },
                    ),
                  ),
                  Container(
                    // color: Colors.blue,
                    width: 350,
                    margin: EdgeInsets.only(right: 15),
                    child: CheckboxListTile(
                      checkColor: white,
                      activeColor: Color.fromARGB(255, 255, 25, 75),
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Text(
                        'Song Tính',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: black,
                          fontSize: 15,
                        ),
                      ),
                      value: _checkboxListTile3,
                      onChanged: (value) {
                        setState(() {
                          _checkboxListTile3 = !_checkboxListTile3;
                        });
                      },
                    ),
                  ),
                  Container(
                    // color: Colors.blue,
                    width: 350,
                    margin: EdgeInsets.only(right: 15),
                    child: CheckboxListTile(
                      checkColor: white,
                      activeColor: Color.fromARGB(255, 255, 25, 75),
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Text(
                        'Vô Tính',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: black,
                          fontSize: 15,
                        ),
                      ),
                      value: _checkboxListTile4,
                      onChanged: (value) {
                        setState(() {
                          _checkboxListTile4 = !_checkboxListTile4;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    // color: Colors.blue,
                    width: 350,
                    margin: EdgeInsets.only(right: 15),
                    child: CheckboxListTile(
                      checkColor: white,
                      activeColor: Color.fromARGB(255, 255, 25, 75),
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Text(
                        'Hiển thị khuynh huớng của tôi trên hồ sơ',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: black,
                          fontSize: 15,
                        ),
                      ),
                      value: _checkboxListTile5,
                      onChanged: (value) {
                        setState(() {
                          _checkboxListTile5 = !_checkboxListTile5;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              borderRadius: BorderRadius.circular(60),
              onTap: (() async {
                // print(_checkboxListTile);
                // print(_checkboxListTile1);
                // print(_checkboxListTile2);
                // print(_checkboxListTile3);
                // print(_checkboxListTile4);

                // strings.add(_checkboxListTile.toString());
                // strings.add(_checkboxListTile1.toString());
                // strings.add(_checkboxListTile2.toString());
                // strings.add(_checkboxListTile3.toString());
                // strings.add(_checkboxListTile4.toString());
                // strings.add(_checkboxListTile5.toString());
                // for (int i = 0; i < strings.length; i++) {
                //   if (strings[i] == "true") {
                //     if (result.contains(strings[i])) {
                //       print('Tồn tại');
                //     } else {
                //       result.add(strings[i]);
                //     }
                //   }
                // }
                // print(result);
                // print(_checkboxListTile5);
                if (strings.length < 3) {
                  if (strings.length == 0) {
                    if (_checkboxListTile) {
                      strings.add("Vô Tính");
                    }
                    if (_checkboxListTile1) {
                      strings.add("Đồng tính Nam");
                    }
                    if (_checkboxListTile2) {
                      strings.add("Đồng tính Nữ");
                    }
                    if (_checkboxListTile3) {
                      strings.add("Song Tính");
                    }
                    if (_checkboxListTile4) {
                      strings.add("Vô Tính");
                    }
                  }
                } else {
                  print("a");
                }

                // } else {
                //   for (var i = 0; i < strings.length; i++) {
                //     if (strings.contains(strings[i]) == true) {
                //       strings.remove(strings[i]);
                //     }
                //   }
                // }
                // print(strings);
                // if (selected != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChoosePage()),
                );
                User user = FirebaseAuth.instance.currentUser;
                await FirebaseFirestore.instance
                    .collection('user')
                    .doc(user.uid)
                    .update({
                  'SexOrientation': strings,
                });
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
