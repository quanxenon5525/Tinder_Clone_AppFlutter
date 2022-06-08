import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproject/pages/home/root_app.dart';
import 'package:finalproject/pages/loginPhone/register_email.dart';
import 'package:finalproject/theme/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginPhone extends StatefulWidget {
  const LoginPhone({Key key}) : super(key: key);

  @override
  State<LoginPhone> createState() => _LoginPhoneState();
}

class _LoginPhoneState extends State<LoginPhone> {
  @override
  final _formKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  bool otpVisibility = false;

  String verificationID = "";
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController otpController = TextEditingController();
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
      scrollDirection: Axis.vertical,
      children: [
        Container(
          margin: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 15.0, right: 8.0),
                // color: Colors.blue,
                padding: const EdgeInsets.only(left: 25, top: 10),
                width: 350,
                child: Text(
                  "Số điện thoại của tôi là",
                  style: TextStyle(
                    color: black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 20, top: 20, left: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      IntlPhoneField(
                        keyboardType: TextInputType.phone,
                        controller: phoneNumber,
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                        ),
                        // validator: (value) {
                        //   if (value.isNotEmpty && value.length < 9) {
                        //     return "Số điện thoại không hợp lệ";
                        //   } else if (value.length > 0 && value.isNotEmpty) {
                        //     return "Số điện thoại không hợp lệ";
                        //   } else if (value.isNotEmpty &&
                        //       value.length >= 9 &&
                        //       value.length <= 10) {
                        //     return null;
                        //   } else {
                        //     return "Số điện thoại không hợp lệ";
                        //   }
                        // },

                        initialCountryCode: 'IN',
                        onChanged: (phone) {
                          print(phone.completeNumber);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 20, top: 40),
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Text(
                  "Chúng tôi sẽ gửi tin nhán cùng mã xác minh. Bạn có thể phải trả phí tin nhắn và dữ liệu. Tìm hiểu chuyện gì xảy ra khi số điện thoại của bạn thay đổi",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Visibility(
                child: Column(
                  children: [
                    Text(
                      "Nhập mã OTP",
                      style: TextStyle(
                          color: black,
                          fontSize: 15,
                          fontWeight: FontWeight.w800),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      // color: Colors.blue,
                      width: 150,
                      child: TextField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          controller: otpController,
                          maxLength: 6,
                          cursorColor: Theme.of(context).primaryColor,
                          decoration: InputDecoration(
                              // hintText: "******",
                              counterText: '',
                              hintStyle: TextStyle(
                                  color: Colors.black, fontSize: 20.0))),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    IconButton(
                        onPressed: () {
                          verifyOTP();
                          Fluttertoast.showToast(
                              msg: "Đã gửi lại mã OTP",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        },
                        icon: Icon(
                          Icons.restore,
                          color: Colors.green,
                        ))
                  ],
                ),
                visible: otpVisibility,
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                borderRadius: BorderRadius.circular(60),
                onTap: (() {
                  if (otpVisibility) {
                    verifyOTP();
                  } else {
                    loginWithPhone();
                  }
                  // if (!_formKey.currentState.validate()) {

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
                      otpVisibility ? "TIẾP TỤC" : "GET OTP",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void loginWithPhone() async {
    final QuerySnapshot result = await FirebaseFirestore.instance
        .collection('user')
        .where('phone', isEqualTo: phoneNumber.text)
        .limit(1)
        .get();
    final List<DocumentSnapshot> documents = result.docs;
    if (documents.length > 0) {
      auth.verifyPhoneNumber(
        phoneNumber: '+84' + phoneNumber.text,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential).then((value) {
            print("You are logged in successfully");
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verificationId, int resendToken) {
          otpVisibility = true;
          verificationID = verificationId;
          setState(() {});
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } else {
      Fluttertoast.showToast(
          msg: "Account Not Found with Phone",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  void verifyOTP() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID, smsCode: otpController.text);

    await auth.signInWithCredential(credential).then((value) async {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RootApp()),
      );
      // User user = FirebaseAuth.instance.currentUser;
      // await FirebaseFirestore.instance.collection('user').doc(user.uid).set({
      //   'phone': phoneNumber.text,
      //   'uid': user.uid,
      //   'birthday': '',
      //   'email': '',
      //   'favorite': '',
      //   'gender': '',
      //   'name': '',
      //   'img': '',
      //   'school': '',
      //   'sexChoose': '',
      //   'SexOrientation': 'https://www.w3schools.com/w3images/avatar2.png',
      // });
      Fluttertoast.showToast(
          msg: "Welcome to Tinder",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    });
  }
}
