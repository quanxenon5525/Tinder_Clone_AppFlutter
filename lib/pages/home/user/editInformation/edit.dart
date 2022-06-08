import 'package:finalproject/pages/editCity.dart';
import 'package:finalproject/pages/edit_gender.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../editSex.dart';
import '../../../editfavorite.dart';

class Edit extends StatefulWidget {
  const Edit({Key key}) : super(key: key);
  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  double _value = 100;
  bool _checkSpace = false;
  RangeValues _currentRangeValues = const RangeValues(40, 80);
  @override
  Widget build(BuildContext context) {
    // bool _checkSpace = false;
    return Scaffold(
      backgroundColor: Color(0xFFECEFF1),
      body: ListView(children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SingleChildScrollView(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 10.0, right: 10.0, left: 10, top: 10),
                  child: Container(
                    height: 150,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                        width: 1,
                        color: Colors.black,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                        icon: Icon(
                          Icons.add_circle,
                          color: Colors.pinkAccent,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 10.0, right: 10.0, left: 10, top: 10),
                  child: Container(
                    height: 150,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                        width: 1,
                        color: Colors.black,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                        icon: Icon(
                          Icons.add_circle,
                          color: Colors.pinkAccent,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 10, right: 10.0, left: 10, top: 10),
                  child: Container(
                    height: 150,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                        width: 1,
                        color: Colors.black,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                        icon: Icon(
                          Icons.add_circle,
                          color: Colors.pinkAccent,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 10.0, right: 10.0, left: 10, top: 10),
                  child: Container(
                    height: 150,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                        width: 1,
                        color: Colors.black,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                        icon: Icon(
                          Icons.add_circle,
                          color: Colors.pinkAccent,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 10.0, right: 10.0, left: 10, top: 10),
                  child: Container(
                    height: 150,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                        width: 1,
                        color: Colors.black,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                        icon: Icon(
                          Icons.add_circle,
                          color: Colors.pinkAccent,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 10, right: 10.0, left: 10, top: 10),
                  child: Container(
                    height: 150,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                        width: 1,
                        color: Colors.black,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                        icon: Icon(
                          Icons.add_circle,
                          color: Colors.pinkAccent,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 10.0, right: 10.0, left: 10, top: 10),
                  child: Container(
                    height: 150,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                        width: 1,
                        color: Colors.black,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                        icon: Icon(
                          Icons.add_circle,
                          color: Colors.pinkAccent,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 10.0, right: 10.0, left: 10, top: 10),
                  child: Container(
                    height: 150,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                        width: 1,
                        color: Colors.black,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                        icon: Icon(
                          Icons.add_circle,
                          color: Colors.pinkAccent,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 10, right: 10.0, left: 10, top: 10),
                  child: Container(
                    height: 150,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                        width: 1,
                        color: Colors.black,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                        icon: Icon(
                          Icons.add_circle,
                          color: Colors.pinkAccent,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              'Thêm video,ảnh hoặc loop để hoàn thành thêm 4% hồ sơ của bạn,cùng cơ hội nhận được nhiều lượt Thích hơn',
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              'TÙY CHỌN HÌNH ẢNH',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoMono'),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(children: [
                    CupertinoFormRow(
                      prefix: Text(
                        'Ảnh thông minh',
                        style: TextStyle(
                          color: Colors.grey,
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
                  ]))),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              'Tính năng Ảnh thông minh liên tục xem xét toàn bộ ảnh hồ sơ của bạn và chọn ra ảnh đẹp nhất để hiển thị trước',
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              'GIỚI THIỆU BẢN THÂN',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoMono'),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: TextField(),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              'SỞ THÍCH',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoMono'),
            ),
          ),
          SizedBox(
            height: 15,
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
                      prefix: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditFavotire()));
                        },
                        child: Text(
                          'ấn vào',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
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
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              'PHONG CÁCH SỐNG',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoMono'),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CupertinoFormRow(
                      prefix: Text(
                        'Cung hoàng đạo',
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
                    CupertinoFormRow(
                      prefix: Text(
                        'Chế độ ăn uống',
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
                    CupertinoFormRow(
                      prefix: Text(
                        'Thú cưng',
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
                    CupertinoFormRow(
                      prefix: Text(
                        'Giáo dục',
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
                    CupertinoFormRow(
                      prefix: Text(
                        'Hút thuốc',
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
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
              children: [
                Text(
                  '°',
                  style: TextStyle(color: Colors.red),
                ),
                Text(
                  'CHỨC DANH',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'RobotoMono'),
                ),
              ],
            ),
          ),
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
                        'Thêm chức danh',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
              children: [
                Text(
                  '°',
                  style: TextStyle(color: Colors.red),
                ),
                Text(
                  'CÔNG TY',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'RobotoMono'),
                ),
              ],
            ),
          ),
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
                        'Thêm công ty',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
              children: [
                Text(
                  'TRƯỜNG',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'RobotoMono'),
                ),
              ],
            ),
          ),
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
                        'Thêm Trường',
                        style: TextStyle(
                          color: Colors.grey,
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
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
              children: [
                Text(
                  '°',
                  style: TextStyle(color: Colors.red),
                ),
                Text(
                  'ĐANG SỐNG TẠI',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'RobotoMono'),
                ),
              ],
            ),
          ),
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
                      prefix: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditCity()));
                        },
                        child: Text(
                          'Thêm Thành phố',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
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
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              'SWIPE NIGHT',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoMono'),
            ),
          ),
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
                            'Hiển thị các quyết định trong hồ sơ',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          child: CupertinoSwitch(
                            activeColor: Colors.pinkAccent,
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
                      ]))),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
              children: [
                Text(
                  '°',
                  style: TextStyle(color: Colors.red),
                ),
                Text(
                  'ẢNH INSTAGRAM',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'RobotoMono'),
                ),
              ],
            ),
          ),
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
                        'Kết nối Instagram',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      child: Text(
                        'KẾT NỐI',
                        style: TextStyle(color: Colors.pinkAccent),
                      ),
                    ),
                  ],
                ),
              )),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
              children: [
                Text(
                  'BÀI HÁT SPOTIFY YÊU THÍCH',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'RobotoMono'),
                ),
              ],
            ),
          ),
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
                        'Kết nối Spotify',
                        style: TextStyle(
                          color: Colors.grey,
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
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
              children: [
                Text(
                  '°',
                  style: TextStyle(color: Colors.red),
                ),
                Text(
                  'TOP NGHỆ SĨ SPOTIFY',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'RobotoMono'),
                ),
              ],
            ),
          ),
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
                        'Kết nối Spotify',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      child: Text(
                        'KẾT NỐI',
                        style: TextStyle(color: Colors.pinkAccent),
                      ),
                    ),
                  ],
                ),
              )),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
              children: [
                Text(
                  'GIỚI TÍNH',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'RobotoMono'),
                ),
              ],
            ),
          ),
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
                      prefix: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditGender()));
                        },
                        child: Text(
                          'Nam',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
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
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
              children: [
                Text(
                  'KHUYNH HƯỚNG TÍNH DỤC',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'RobotoMono'),
                ),
              ],
            ),
          ),
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
                      prefix: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditSex()));
                        },
                        child: Text(
                          'Thêm Khuynh Hướng Tính Dục',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
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
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
              children: [
                Text(
                  'KIỂM SOÁT HỒ SƠ CỦA BẠN',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'RobotoMono'),
                ),
                SizedBox(width: 5),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red),
                  child: Text(
                    'Tinder Plus',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
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
                            'Ẩn tuổi của tôi',
                            style: TextStyle(
                              color: Colors.grey,
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
                        CupertinoFormRow(
                          prefix: Text(
                            'Ẩn khoảng cách của tôi',
                            style: TextStyle(
                              color: Colors.grey,
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
                      ]))),
        ]),
      ]),
    );
  }
}
