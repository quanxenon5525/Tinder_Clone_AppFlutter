import 'package:finalproject/pages/home/user/setting/update/updatePhone/ChangePhone.dart';
import 'package:finalproject/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class UpdatePhone extends StatefulWidget {
  const UpdatePhone({Key key}) : super(key: key);

  @override
  State<UpdatePhone> createState() => _UpdatePhoneState();
}

class _UpdatePhoneState extends State<UpdatePhone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECEFF1),
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
              "Số điện thoại",
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
          Container(
            margin: EdgeInsets.only(left: 10, top: 20),
            child: Text(
              "SỐ ĐIỆN THOẠI",
              style: TextStyle(
                color: grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            child: InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.only(left: 15, top: 5, bottom: 5),
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        "01236660347",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 5),
                      child: Icon(
                        Icons.check,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, top: 10),
            child: Text(
              "Số điện thoại đã xác minh",
              style: TextStyle(
                color: grey,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            child: InkWell(
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChangePhone()),
                );
              },
              child: Container(
                padding: const EdgeInsets.only(left: 15, top: 5, bottom: 5),
                height: 50,
                child: Center(
                  child: Text(
                    "Cập nhật số điện thoại của tôi",
                    style: TextStyle(
                      color: Colors.pink,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
