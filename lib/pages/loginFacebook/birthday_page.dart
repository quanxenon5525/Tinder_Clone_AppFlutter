import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproject/pages/loginFacebook/select_gender.dart';
import 'package:finalproject/theme/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BirthdayPage extends StatefulWidget {
  const BirthdayPage({Key key}) : super(key: key);

  @override
  State<BirthdayPage> createState() => _BirthdayPageState();
}

class _BirthdayPageState extends State<BirthdayPage> {
  DateTime _chosenDateTime;
  @override
  final _formKey = GlobalKey<FormState>();

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
    return Column(
      children: [
        Container(
          // color: Colors.blue,
          margin: EdgeInsets.only(right: 50, left: 70, top: 50),
          child: Text(
            "Sinh nhật của tôi là",
            style: TextStyle(
              color: black,
              fontWeight: FontWeight.w500,
              fontSize: 60,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          // color: Colors.blue,
          margin: EdgeInsets.only(left: 55, right: 70),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Form(
              key: _formKey,
              child: Container(
                height: 200,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: DateTime(1969, 1, 1),
                  onDateTimeChanged: (DateTime newDateTime) {
                    setState(() {
                      _chosenDateTime = newDateTime;
                    });

                    // Do something
                  },
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 9,
        ),
        Container(
          // color: Colors.blue,
          // color: Colors.blue,
          margin: EdgeInsets.only(left: 60, right: 65),
          child: Text(
            "Đây là cách tên bạn hiển thị trên Tinder và bạn sẽ không thay đổi về sau",
            style: TextStyle(
              color: grey,
              fontSize: 17,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        InkWell(
          borderRadius: BorderRadius.circular(60),
          onTap: (() async {
            User user = FirebaseAuth.instance.currentUser;
            await FirebaseFirestore.instance
                .collection('user')
                .doc(user.uid)
                .update({
              'birthday': _chosenDateTime.toString(),
            });
            // if (!_formKey.currentState.validate()) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GenderUserPage()),
              // );
            );

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
    );
  }
}
