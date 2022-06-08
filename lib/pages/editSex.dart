import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class EditSex extends StatefulWidget {
  const EditSex({Key key}) : super(key: key);

  @override
  State<EditSex> createState() => _EditSexState();
}

class _EditSexState extends State<EditSex> {
  double _value = 100;
  bool _checkSpace = false;
  RangeValues _currentRangeValues = const RangeValues(40, 80);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFECEFF1),
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              'Khuynh hướng',
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Xong',
                    style: TextStyle(
                        color: Colors.pinkAccent,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'RobotoMono'),
                  ))
            ]),
        body: ListView(children: [
          SizedBox(
            height: 10,
          ),
          Text('CHỌN TỐI ĐA 3'),
          SizedBox(
            height: 10,
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CupertinoFormRow(
                      prefix: Text(
                        'Dị tính',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    CupertinoFormRow(
                      prefix: Text(
                        'Đồng tính Nam',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    CupertinoFormRow(
                      prefix: Text(
                        'Đồng tính Nữ',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    CupertinoFormRow(
                      prefix: Text(
                        'Song tính',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    CupertinoFormRow(
                      prefix: Text(
                        'Vô tính',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    CupertinoFormRow(
                      prefix: Text(
                        'Á tính',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    CupertinoFormRow(
                      prefix: Text(
                        'Toàn tính',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    CupertinoFormRow(
                      prefix: Text(
                        'Phi dị tính',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    CupertinoFormRow(
                      prefix: Text(
                        'Chưa xác định rõ khuynh hướng',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          SizedBox(
            height: 20,
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CupertinoFormRow(
                      prefix: Text(
                        'Hiển thị khuynh hướng của tôi trên hồ sơ ',
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
                  ],
                ),
              )),
        ]));
  }
}
