import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ManageNoti extends StatefulWidget {
  const ManageNoti({Key key}) : super(key: key);

  @override
  State<ManageNoti> createState() => _ManageNotiState();
}

class _ManageNotiState extends State<ManageNoti> {
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
              padding: const EdgeInsets.only(right: 56),
              child: Text(
                "Quản lý Thông báo đã xem",
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
                  'Gửi thông báo đã xem',
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
              "Tắt mục này sẽ ngăn không để bất kỳ tương hợp mới nào\nbật thông báo đã xem trong cuộc trò chuyện của các\nbạn từ thời điểm này trở đi.",
              style: TextStyle(color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }
}
