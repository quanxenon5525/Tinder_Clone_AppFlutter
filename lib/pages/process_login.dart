import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproject/pages/home/root_app.dart';
import 'package:finalproject/pages/loginFacebook/welcome_page.dart';
import 'package:finalproject/pages/loginPhone/loginPhone.dart';
import 'package:finalproject/theme/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginMutilPage extends StatefulWidget {
  const LoginMutilPage({key}) : super(key: key);

  @override
  State<LoginMutilPage> createState() => _LoginMutilPageState();
}

class _LoginMutilPageState extends State<LoginMutilPage> {
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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RootApp()),
        );
      } else {
        User user = FirebaseAuth.instance.currentUser;

        await FirebaseFirestore.instance.collection('user').doc(user.uid).set({
          'email': userData['email'],
          'img': FieldValue.arrayUnion([userData['picture']['data']['url']]),
          'name': userData['name'],
          'birthday': '',
          'favorite': '',
          'gender': '',
          'school': '',
          'ListUidMatch': FieldValue.arrayUnion([]),
          'sexChoose': '',
          'uid': user.uid,
          'SexOrientation': 'https://www.w3schools.com/w3images/avatar2.png',
        });

        await FirebaseFirestore.instance.collection('match').doc(user.uid).set({
          'name': userData['name'],
          'active': true,
          'uid': user.uid,
          'imgUid': userData['picture']['data']['url'],
          'ListUidMatch': FieldValue.arrayUnion([]),
        });

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WelcomePage()),
        );
      }
    } on Exception catch (e) {
      print("error");
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  void _loginWithGoogle() async {
    setState(() {
      loading = true;
    });
    final googleSignIn = GoogleSignIn(scopes: ['email']);
    try {
      final googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount == null) {
        setState(() {
          loading = false;
        });
        return;
      }
      final googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      User user = FirebaseAuth.instance.currentUser;

      final QuerySnapshot result = await FirebaseFirestore.instance
          .collection('user')
          .where(
            'email',
            isEqualTo: googleSignInAccount.email,
          )
          .limit(1)
          .get();
      final List<DocumentSnapshot> documents = result.docs;
      if (documents.length > 0) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RootApp()),
        );
      } else {
        await FirebaseFirestore.instance.collection('user').doc(user.uid).set({
          'email': googleSignInAccount.email,
          'img': FieldValue.arrayUnion([googleSignInAccount.photoUrl]),
          'name': googleSignInAccount.displayName,
          'birthday': '',
          'favorite': '',
          'gender': '',
          'school': '',
          'ListUidMatch': FieldValue.arrayUnion([]),
          'sexChoose': '',
          'uid': user.uid,
          'SexOrientation': 'https://www.w3schools.com/w3images/avatar2.png',
        });
        await FirebaseFirestore.instance.collection('match').doc(user.uid).set({
          'name': googleSignInAccount.displayName,
          'active': true,
          'uid': user.uid,
          'imgUid': googleSignInAccount.photoUrl,
          'ListUidMatch': FieldValue.arrayUnion([]),
        });
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WelcomePage()),
        );
      }
    } on FirebaseAuthException catch (e) {
      var content = '';
      switch (e.code) {
        case 'account-exists-with-diffrent-cresdential':
          content = 'This account exists with a diffrent sign in provider';
          break;
        case 'invalid-credential':
          content = 'Unknow error has occurred';
          break;
        case 'operation-not-allowed':
          content = 'This is operation is not allowed';
          break;
        case 'user-disabled':
          content = 'The user you tried to log into is disabled';
          break;
        case 'user-not-found':
          content = 'The user you tried to log into was not found';
          break;
      }
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Log in with google failed'),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                print('Succcess');
              },
              child: Text('Ok'),
            )
          ],
        ),
      );
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppbar(),
      backgroundColor: Color.fromARGB(255, 255, 25, 75),
      body: getBody(),
    );
  }

  AppBar getAppbar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Color.fromARGB(255, 255, 25, 75),
      iconTheme: IconThemeData(color: black),
    );
  }

  Widget getBody() {
    return ListView(
      children: [
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 200, left: 80, right: 80),
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
              onTap: () {
                _loginWithGoogle();
              },
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
                    "ĐĂNG NHẬP VỚI Google",
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
            InkWell(
              borderRadius: BorderRadius.circular(60),
              onTap: (() {
                _loginFacebook();
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
                    "ĐĂNG NHẬP VỚI FACEBOOK",
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
            InkWell(
              borderRadius: BorderRadius.circular(60),
              onTap: (() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPhone()),
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
                    "ĐĂNG NHẬP VỚI SỐ ĐIỆN THOẠI",
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
