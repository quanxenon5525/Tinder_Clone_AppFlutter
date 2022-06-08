import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ManageSelect extends StatefulWidget {
  const ManageSelect({Key key}) : super(key: key);

  @override
  State<ManageSelect> createState() => _ManageSelectState();
}

class _ManageSelectState extends State<ManageSelect> {
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
              padding: const EdgeInsets.only(right: 70),
              child: Text(
                "Quản lý Top Tuyển chọn",
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
                  'Hiển thị tôi trong phần Top Tuyển chọn',
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
              "Bật tính năng này sẽ cho pháp người dùng khác ở gần\nbạn nhìn thấy bạn là một đối tượng Top Tuyển chọn nổi\nbật.",
              style: TextStyle(color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }
}
