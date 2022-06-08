import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IsActive extends StatefulWidget {
  const IsActive({Key key}) : super(key: key);

  @override
  State<IsActive> createState() => _IsActiveState();
}

class _IsActiveState extends State<IsActive> {
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
              padding: const EdgeInsets.only(right: 42),
              child: Text(
                "Trạng thái hoạt động gần đây",
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
                  'Hiển thị trạng thái hoạt động',
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
              "Các thành viên Tinder có thể biết trong 24 giờ qua bạn\ncó hoạt động trên Tinder không. Nếu bạn tắt tính năng\nnày, họ sẽ không thể xem trạng thái hoạt động gần đây\ncủa bạn",
              style: TextStyle(color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }
}
