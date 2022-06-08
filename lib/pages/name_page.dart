import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproject/pages/birthday_page.dart';
import 'package:finalproject/theme/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class NamePage extends StatefulWidget {
  const NamePage({key}) : super(key: key);

  @override
  State<NamePage> createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
  TextEditingController _name = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
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
          margin: EdgeInsets.only(right: 100, left: 70, top: 50),
          child: Text(
            "Tên tôi là",
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
              child: TextFormField(
                autofocus: false,
                controller: _name,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Tên',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Tên không được để trống";
                  } else {
                    return null;
                  }
                },
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
            // if (!_formKey.currentState.validate()) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BirthdayPage()),
            );
            User user = FirebaseAuth.instance.currentUser;
            await FirebaseFirestore.instance
                .collection('user')
                .doc(user.uid)
                .update({
              'name': _name.text,
            });
            await FirebaseFirestore.instance
                .collection('match')
                .doc(user.uid)
                .update({
              'name': _name.text,
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
    );
  }
}
