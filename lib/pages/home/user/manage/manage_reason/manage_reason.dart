import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ManageReason extends StatefulWidget {
  const ManageReason({Key key}) : super(key: key);

  @override
  State<ManageReason> createState() => _ManageReasonState();
}

class _ManageReasonState extends State<ManageReason> {
  bool _checkSpace = false;
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
            Padding(
              padding: const EdgeInsets.only(right: 105),
              child: Text(
                "Quản lý hợp cạ",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            child: SizedBox(
              height: 55,
              child: CupertinoFormRow(
                prefix: Text(
                  'Tham gia tìm hợp cạ',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                child: CupertinoSwitch(
                  activeColor: Colors.pink,
                  value: _checkSpace,
                  onChanged: (value) {
                    setState(
                      () {
                        _checkSpace = !_checkSpace;
                      },
                    );

                    if (_checkSpace == true) {}
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 14),
            child: Text(
              "Tắt mục này sẽ gỡ bỏ tính năng tìm Hợp cạ khỏi hồ sơ\ncủa bạn và bạn sẽ không còn nhìn thấy những hồ sơ Hợp\ncạ.",
              style: TextStyle(color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }
}
