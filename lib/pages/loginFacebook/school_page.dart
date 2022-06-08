import 'package:finalproject/pages/loginFacebook/SexualOrientation_page.dart';
import 'package:finalproject/pages/loginFacebook/favorite_page.dart';
import 'package:finalproject/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SchoolPage extends StatefulWidget {
  const SchoolPage({key}) : super(key: key);

  @override
  State<SchoolPage> createState() => _SchoolPageState();
}

class _SchoolPageState extends State<SchoolPage> {
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
      iconTheme: IconThemeData(
        color: black,
      ),
    );
  }

  Widget getBody() {
    return Column(
      children: [
        Container(
          // color: Colors.blue,
          margin: EdgeInsets.only(right: 50, left: 50, top: 50),
          child: Text(
            "Trường của tôi là",
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
              child: TextFormField(
                autofocus: false,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Tên trường',
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
          margin: EdgeInsets.only(left: 45, right: 40),
          child: Text(
            "Đây là cách nội dung hiển thị trên Tinder",
            style: TextStyle(
              color: grey,
              fontSize: 15,
            ),
          ),
        ),
        SizedBox(
          height: 70,
        ),
        InkWell(
          borderRadius: BorderRadius.circular(60),
          onTap: (() {
            // if (_formKey.currentState!.validate()) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Favorite_Page()),
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
                "BỎ QUA",
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
