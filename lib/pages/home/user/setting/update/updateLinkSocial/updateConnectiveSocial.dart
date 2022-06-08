import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproject/theme/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class ConnectSocialAcount extends StatefulWidget {
  const ConnectSocialAcount({Key key}) : super(key: key);

  @override
  State<ConnectSocialAcount> createState() => _ConnectSocialAcountState();
}

class _ConnectSocialAcountState extends State<ConnectSocialAcount> {
  bool _checkBoxGoogle = false;

  bool _checkBoxFaceBook = false;

  var loading = false;
  void _loginFacebook() async {
    setState(() {
      loading = true;
    });
    try {
      final LoginResult = await FacebookAuth.instance.login();
      final userData = await FacebookAuth.instance.getUserData();
      final facebookAuthCredential =
          FacebookAuthProvider.credential(LoginResult.accessToken.token);
      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

      final QuerySnapshot result = await FirebaseFirestore.instance
          .collection('user')
          .where(
            'email',
            isEqualTo: userData['email'],
          )
          .limit(1)
          .get();
      final List<DocumentSnapshot> documents = result.docs;

      if (documents.length > 0) {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => RootApp()),
        // );
      } else {
        // User user = FirebaseAuth.instance.currentUser;

        // await FirebaseFirestore.instance.collection('user').doc(user.uid).set({
        //   'email': userData['email'],
        //   'img': FieldValue.arrayUnion([userData['picture']['data']['url']]),
        //   'name': userData['name'],
        //   'birthday': '',
        //   'favorite': '',
        //   'gender': '',
        //   'school': '',
        //   'ListUidMatch': FieldValue.arrayUnion([]),
        //   'sexChoose': '',
        //   'uid': user.uid,
        //   'SexOrientation': 'https://www.w3schools.com/w3images/avatar2.png',
        // });

        // await FirebaseFirestore.instance.collection('match').doc(user.uid).set({
        //   'name': userData['name'],
        //   'active': true,
        //   'uid': user.uid,
        //   'imgUid': userData['picture']['data']['url'],
        //   'ListUidMatch': FieldValue.arrayUnion([]),
        // });

        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => WelcomePage()),
        // );
      }
    } on Exception catch (e) {
      print("error");
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0),
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(
          color: Colors.pink,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.navigate_before,
                    size: 30,
                    color: Colors.pink,
                  ),
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            Text(
              "Tài khoản đã kết nối",
              style: TextStyle(color: black, fontSize: 20),
            ),
            Text(
              "Số điện thoại",
              style: TextStyle(color: black.withOpacity(0), fontSize: 10),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          CupertinoFormSection(
            header: Text(
                'ĐĂNG NHẬP NHANH HƠN BẰNG CÁCH LIÊN KẾT VỚI TÀI KHOẢN CỦA BẠN'),
            children: [
              CupertinoFormRow(
                prefix: Text('Đăng nhập với Google'),
                child: CupertinoSwitch(
                  activeColor: Colors.pink,
                  value: _checkBoxGoogle,
                  onChanged: (value) {
                    setState(
                      () {
                        _checkBoxGoogle = !_checkBoxGoogle;
                      },
                    );

                    if (_checkBoxGoogle == true) {
                      print('chec');
                    }
                  },
                ),
              ),
              CupertinoFormRow(
                prefix: Text('Đăng nhập với Facebook'),
                child: CupertinoSwitch(
                  activeColor: Colors.pink,
                  value: _checkBoxFaceBook,
                  onChanged: (value) {
                    setState(
                      () {
                        _checkBoxFaceBook = !_checkBoxFaceBook;
                      },
                    );
                    if (_checkBoxFaceBook == false) {
                      print('chec');
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
