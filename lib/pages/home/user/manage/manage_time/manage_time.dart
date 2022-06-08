import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ManageTime extends StatefulWidget {
  const ManageTime({Key key}) : super(key: key);

  @override
  State<ManageTime> createState() => _ManageTimeState();
}

class _ManageTimeState extends State<ManageTime> {
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
              padding: const EdgeInsets.only(right: 68),
              child: Text(
                "Quản lý Khung giờ vàng",
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
                  'Hiển thị tôi trong Khung giờ vàng',
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
            padding: const EdgeInsets.only(left: 18, top: 14),
            child: Text(
              "Tắt tính năng này sẽ làm hồ sơ của bạn không được ưu\ntiên trong khung giờ vàng.",
              style: TextStyle(color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }
}
