import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class EditGender extends StatefulWidget {
  const EditGender({Key key}) : super(key: key);

  @override
  State<EditGender> createState() => _EditGenderState();
}

class _EditGenderState extends State<EditGender> {
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
              'Tôi là',
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
                        'Nam',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    CupertinoFormRow(
                      prefix: Text(
                        'Nữ',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    CupertinoFormRow(
                      prefix: Text(
                        'Thêm',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      child: Container(
                        child: Icon(
                          Icons.navigate_next,
                          color: Colors.grey,
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
                        'Hiển thị giới tính trên hồ sơ của tôi',
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
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tìm hiểu thêm',
                style: TextStyle(color: Colors.red),
              ),
              Text(
                ' về tính năng giới tính trên Tinder',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ]));
  }
}
