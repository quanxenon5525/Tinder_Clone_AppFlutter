import 'package:expandable_slider/expandable_slider.dart';
import 'package:finalproject/pages/home/user/address/address_update.dart';
import 'package:finalproject/pages/home/user/manage/active/active.dart';
import 'package:finalproject/pages/home/user/manage/active/is_active.dart';
import 'package:finalproject/pages/home/user/manage/manage_notification/manage_noti.dart';
import 'package:finalproject/pages/home/user/manage/manage_reason/manage_reason.dart';
import 'package:finalproject/pages/home/user/manage/manage_selective/manage_select.dart';
import 'package:finalproject/pages/home/user/manage/manage_time/manage_time.dart';
import 'package:finalproject/pages/home/user/manage/vaccine/vaccine_center.dart';

import 'package:finalproject/pages/home/user/setting/setting_card.dart';
import 'package:finalproject/pages/home/user/setting/update/updateLinkSocial/updateConnectiveSocial.dart';
import 'package:finalproject/pages/home/user/setting/update/updateMail/updateMail.dart';
import 'package:finalproject/pages/home/user/setting/update/updatePhone/updatePhone.dart';
import 'package:finalproject/pages/home/user/setting/widget/gift.dart';
import 'package:finalproject/pages/home/user/setting/widget/setting_card1.dart';
import 'package:finalproject/pages/home/user/setting/widget/setting_card2.dart';
import 'package:finalproject/pages/home/user/setting/widget/star_card.dart';
import 'package:finalproject/pages/home/user/setting/widget/thunder_card.dart';
import 'package:finalproject/pages/home/user/sex_choices/sex.dart';

import 'package:finalproject/pages/login.dart';
import 'package:finalproject/theme/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Setting extends StatefulWidget {
  const Setting({Key key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  double _value = 100;
  bool _checkSpace = false;
  RangeValues _currentRangeValues = const RangeValues(40, 80);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECEFF1),
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0),
        elevation: 0,
        title: Text(
          'Cài đặt',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: 'RobotoMono'),
        ),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
              },
              child: Text(
                'Xong',
                style: TextStyle(
                    color: Colors.pinkAccent,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'RobotoMono'),
              ))
        ],
      ),
      body: Container(
        child: ListView(children: [
          SizedBox(
            height: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SettingCard1(),
              SettingCard(),
              SettingCard2(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [StarCard(), ThunderCard()],
              ),
              Gift()
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'THIẾT LẬP TÀI KHOẢN',
                  style: TextStyle(
                    color: grey,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UpdatePhone()),
                    );
                  },
                  child: Hero(
                    tag: "check",
                    child: Container(
                      padding:
                          const EdgeInsets.only(left: 15, top: 10, bottom: 10),
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                              "Số điện thoại",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Container(
                            child: Icon(
                              Icons.navigate_next,
                              color: grey,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                // ),
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Divider(
                    height: 5,
                    color: grey,
                  ),
                ),
                InkWell(
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ConnectSocialAcount()),
                    );
                  },
                  child: Hero(
                    tag: "check3",
                    child: Container(
                      padding:
                          const EdgeInsets.only(left: 15, top: 10, bottom: 10),
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Tài khoản đã kết nối",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          Icon(
                            Icons.navigate_next,
                            color: grey,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Divider(
                    height: 5,
                    color: grey,
                  ),
                ),
                InkWell(
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UpdateEmail()),
                    );
                  },
                  child: Hero(
                    tag: "CHECK2",
                    child: Container(
                      padding:
                          const EdgeInsets.only(left: 15, top: 10, bottom: 10),
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Email",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          Icon(
                            Icons.navigate_next,
                            color: grey,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Số điện thoại và Email đã xác minh giúp bảo mật tài khoản của bạn',
                  style: TextStyle(
                      color: Color.fromARGB(255, 134, 127, 127), fontSize: 15),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('KHÁM PHÁ'),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddressUpdate()),
                      );
                    },
                    child: Hero(
                      tag: "Address",
                      child: Container(
                        padding: const EdgeInsets.only(left: 15, bottom: 18),
                        height: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Địa điểm",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              child: Column(
                                children: [
                                  Text(
                                    "Địa điểm hiện tại của tôi",
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    "Hồ Chí Minh , Thành Phố Hồ Chí Minh",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color.fromARGB(255, 134, 127, 127),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.navigate_next,
                              color: grey,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Divider(
                      height: 5,
                      color: grey,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Khoảng cách Ưu tiên",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 18,
                                  color: Colors.black),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 15),
                              child: Text(
                                  '${num.parse(_value.toStringAsFixed(0))}' +
                                      "km"),
                            )
                          ],
                        ),
                      ),
                      ExpandableSlider.adaptive(
                        inactiveColor: Color.fromARGB(255, 221, 218, 218),
                        activeColor: Colors.pink,
                        // expandsOnLongPress: true,

                        value: _value,
                        onChanged: (newValue) => setState(
                          () => _value = newValue,
                        ),

                        min: 0,
                        max: 100,
                        estimatedValueStep: 1,
                      ),
                      CupertinoFormRow(
                        prefix: Text(
                          'Chỉ hiển thị người trong phạm vi này',
                          style: TextStyle(
                            color: Color.fromARGB(255, 134, 127, 127),
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
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Divider(
                      height: 5,
                      color: grey,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SexChoices()),
                      );
                    },
                    child: Hero(
                      tag: "chooseSex",
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 15, top: 10, bottom: 10),
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Hiển thị cho tôi",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Nữ",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                ),
                                Icon(
                                  Icons.navigate_next,
                                  color: grey,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Divider(
                      height: 5,
                      color: grey,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Độ tuổi Ưu tiên",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 18,
                                  color: Colors.black),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 15),
                              child: Text(
                                  '${num.parse(_currentRangeValues.start.toStringAsFixed(0))}' +
                                      "-" +
                                      '${num.parse(_currentRangeValues.end.toStringAsFixed(0))}'),
                            )
                          ],
                        ),
                      ),
                      RangeSlider(
                        values: _currentRangeValues,
                        activeColor: Colors.pink,
                        max: 100,
                        divisions: 5,
                        labels: RangeLabels(
                          _currentRangeValues.start.round().toString(),
                          _currentRangeValues.end.round().toString(),
                        ),
                        onChanged: (RangeValues values) {
                          setState(() {
                            _currentRangeValues = values;
                          });
                        },
                      ),
                      CupertinoFormRow(
                        prefix: Text(
                          'Chỉ hiển thị người trong phạm vi này',
                          style: TextStyle(
                            color: Color.fromARGB(255, 134, 127, 127),
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
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        child: Divider(
                          height: 5,
                          color: grey,
                        ),
                      ),
                      CupertinoFormRow(
                        prefix: Text(
                          'Toàn Cầu',
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
                  )
                ]),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mở ra toàn cầu sẽ tạo cơ hội để bạn gặp gỡ nhiều người quanh đây cũng như ở khắp nơi trên thế giới',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'NGÔN NGỮ ĐẦU TIÊN',
                  style: TextStyle(
                    color: Color.fromARGB(255, 114, 112, 112),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                            left: 15, top: 10, bottom: 10),
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Tiếng Việt",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        child: Divider(
                          height: 5,
                          color: grey,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            left: 15, top: 10, bottom: 10),
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Thêm ngôn ngữ..",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'KIỂM SOÁT AI BẠN SẼ THẤY',
                      style: TextStyle(
                        color: Color.fromARGB(255, 114, 112, 112),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.pink,
                      ),
                      // color: Colors.pink

                      child: Text(
                        " Tinder Plus",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Đề xuất đối tượng chọn lọc',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          Container(
                            width: 320,
                            child: Text(
                              'Xem những người phù hợp với bạn nhất(cài đặt mặc định)',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.check,
                        color: Colors.pink,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Divider(
                    height: 5,
                    color: grey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Đề xuất đối tượng chọn lọc',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          Container(
                            width: 320,
                            child: Text(
                              'Xem những người có hoạt động mới nhất trước',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Divider(
                    height: 5,
                    color: Colors.grey.withOpacity(0),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'KIỂM SOÁT AI THẤY ĐƯỢC BẠN',
                      style: TextStyle(
                        color: Color.fromARGB(255, 114, 112, 112),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.pink,
                      ),
                      // color: Colors.pink

                      child: Text(" Tinder Plus",
                          style: TextStyle(
                            color: Colors.white,
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tiêu chuẩn',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          Container(
                            width: 320,
                            child: Text(
                              'Chỉ hiển thị cho một số kiểu người nhất định đề xuất cá nhân',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.check,
                        color: Colors.pink,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Divider(
                    height: 5,
                    color: grey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Chỉ những người tôi Thích',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          Container(
                            width: 320,
                            child: Text(
                              'Chỉ những người tôi đã quẹt phải sẽ thấy tôi',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Divider(
                    height: 5,
                    color: Colors.grey.withOpacity(0),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            height: 70,
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
                      'Hiển thị tôi trên Tinder',
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
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              'Khi đã tắt,bạn sẽ không được hiển thị trong thẻ đại diện.Những người bạn đã tỏ ý thích có thể vẫn nhìn thấy hồ sơ và tương hợp với bạn.Bạn vẫn có thể xem và trò chuyện với các bạn tương hợp của mình.',
              style: TextStyle(
                fontSize: 15,
                color: Color.fromARGB(255, 148, 146, 146),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UpdatePhone()),
                      );
                    },
                    child: Hero(
                      tag: "Block",
                      child: Container(
                        padding:
                            const EdgeInsets.only(left: 5, top: 10, bottom: 10),
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                "Chặn liên hệ",
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Container(
                              child: Icon(
                                Icons.navigate_next,
                                color: grey,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  // ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              'Chọn những đối tượng bạn không muốn nhìn thấy hoặc không muốn họ nhìn thấy bạn trên Tinder từ danh sách liên hệ của bạn',
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'HỢP CẠ',
                  style: TextStyle(
                    color: Color.fromARGB(255, 102, 101, 101),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ManageReason()),
                      );
                    },
                    child: Hero(
                      tag: "manage_reason",
                      child: Container(
                        padding:
                            const EdgeInsets.only(left: 5, top: 10, bottom: 10),
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                "Quản lý Hợp cạ",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Container(
                              child: Icon(
                                Icons.navigate_next,
                                color: grey,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'TOP TUYỂN CHỌN',
                  style: TextStyle(
                    color: Color.fromARGB(255, 102, 101, 101),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ManageSelect()),
                      );
                    },
                    child: Hero(
                      tag: "manage_select",
                      child: Container(
                        padding:
                            const EdgeInsets.only(left: 5, top: 10, bottom: 10),
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                "Quản lý Top Tuyển chọn",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Container(
                              child: Icon(
                                Icons.navigate_next,
                                color: grey,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'THÔNG BÁO ĐÃ XEM',
                  style: TextStyle(
                    color: Color.fromARGB(255, 102, 101, 101),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ManageNoti()),
                      );
                    },
                    child: Hero(
                      tag: "manage_noti",
                      child: Container(
                        padding:
                            const EdgeInsets.only(left: 5, top: 10, bottom: 10),
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                "Quản lý Thông báo đã xem",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Container(
                              child: Icon(
                                Icons.navigate_next,
                                color: grey,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'KHUNG GIỜ VÀNG',
                  style: TextStyle(
                    color: Color.fromARGB(255, 102, 101, 101),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ManageTime()),
                      );
                    },
                    child: Hero(
                      tag: "timegold",
                      child: Container(
                        padding:
                            const EdgeInsets.only(left: 5, top: 10, bottom: 10),
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                "Quản lý Khung giờ vàng",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Container(
                              child: Icon(
                                Icons.navigate_next,
                                color: grey,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'TRUNG TÂM VACCINE',
                  style: TextStyle(
                    color: Color.fromARGB(255, 102, 101, 101),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VaccineCenter()),
                      );
                    },
                    child: Hero(
                      tag: "vaccine",
                      child: Container(
                        padding:
                            const EdgeInsets.only(left: 5, top: 10, bottom: 10),
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                "Quản lý Trung tâm Vaccine",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Container(
                              child: Icon(
                                Icons.navigate_next,
                                color: grey,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'MỨC SỬ DỤNG DỮ LIỆU',
                  style: TextStyle(
                    color: Color.fromARGB(255, 102, 101, 101),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UpdatePhone()),
                      );
                    },
                    child: Hero(
                      tag: "data",
                      child: Container(
                        padding:
                            const EdgeInsets.only(left: 5, top: 10, bottom: 10),
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                "Phát tự động video",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Container(
                              child: Icon(
                                Icons.navigate_next,
                                color: grey,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'TRẠNG THÁI HOẠT ĐỘNG',
                  style: TextStyle(
                    color: Color.fromARGB(255, 102, 101, 101),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Active()),
                      );
                    },
                    child: Hero(
                      tag: "active",
                      child: Container(
                        padding:
                            const EdgeInsets.only(left: 5, top: 10, bottom: 10),
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                "Đang  trực tuyến",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Container(
                              child: Icon(
                                Icons.navigate_next,
                                color: grey,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Divider(
                      height: 5,
                      color: grey,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => IsActive()),
                      );
                    },
                    child: Hero(
                      tag: "currently",
                      child: Container(
                        padding:
                            const EdgeInsets.only(left: 5, top: 10, bottom: 10),
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                "Trạng thái hoạt động gần đây",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Container(
                              child: Icon(
                                Icons.navigate_next,
                                color: grey,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'HỒ SƠ WEB',
                  style: TextStyle(
                    color: Color.fromARGB(255, 102, 101, 101),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UpdatePhone()),
                      );
                    },
                    child: Hero(
                      tag: "info",
                      child: Container(
                        padding:
                            const EdgeInsets.only(left: 5, top: 10, bottom: 10),
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                "Tên người...",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  child: Text(
                                    "Nhập tên người dùng của bạn",
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Icon(
                                    Icons.navigate_next,
                                    color: grey,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Divider(
                      height: 5,
                      color: grey.withOpacity(0),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Tạo Tên người dùng công khai.Chia sẻ tên người dùng của bạn để mọi người trên toàn thế giới có thể vuốt qua phải cho bạn trên Tinder',
              style: TextStyle(
                fontSize: 15,
                color: Color.fromARGB(255, 129, 128, 128),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'THÔNG BÁO',
                        style: TextStyle(
                          color: Color.fromARGB(255, 102, 101, 101),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UpdatePhone()),
                      );
                    },
                    child: Hero(
                      tag: "email",
                      child: Container(
                        padding:
                            const EdgeInsets.only(left: 5, top: 10, bottom: 10),
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                "Email",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Container(
                              child: Icon(
                                Icons.navigate_next,
                                color: grey,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Divider(
                      height: 5,
                      color: grey,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UpdatePhone()),
                      );
                    },
                    child: Hero(
                      tag: "notifyUpadte",
                      child: Container(
                        padding:
                            const EdgeInsets.only(left: 5, top: 10, bottom: 10),
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                "Thông Báo Cập Nhật",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Container(
                              child: Icon(
                                Icons.navigate_next,
                                color: grey,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Divider(
                      height: 5,
                      color: grey,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UpdatePhone()),
                      );
                    },
                    child: Hero(
                      tag: "teamtinder",
                      child: Container(
                        padding:
                            const EdgeInsets.only(left: 5, top: 10, bottom: 10),
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                "Team tinder",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Container(
                              child: Icon(
                                Icons.navigate_next,
                                color: grey,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              'Chọn các thông báo muốn xem khi đang ở trong ứng dụng',
              style: TextStyle(
                  fontSize: 15, color: Color.fromARGB(255, 102, 100, 100)),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UpdatePhone()),
                      );
                    },
                    child: Hero(
                      tag: "recoveryBuy",
                      child: Container(
                        padding:
                            const EdgeInsets.only(left: 5, top: 10, bottom: 10),
                        height: 40,
                        child: Container(
                          child: Text(
                            "Khôi phục hoạt động Mua",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UpdatePhone()),
                      );
                    },
                    child: Hero(
                      tag: "shareTinder",
                      child: Container(
                        padding:
                            const EdgeInsets.only(left: 5, top: 10, bottom: 10),
                        height: 40,
                        child: Container(
                          child: Text(
                            "Chia sẻ Tinder",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'CỘNG ĐỒNG',
                        style: TextStyle(
                          color: Color.fromARGB(255, 102, 101, 101),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UpdatePhone()),
                      );
                    },
                    child: Hero(
                      tag: "rule",
                      child: Container(
                        padding:
                            const EdgeInsets.only(left: 5, top: 10, bottom: 10),
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                "Quy tắc Cộng đồng",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Container(
                              child: Icon(
                                Icons.navigate_next,
                                color: grey,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Divider(
                      height: 5,
                      color: grey,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UpdatePhone()),
                      );
                    },
                    child: Hero(
                      tag: "trickshield",
                      child: Container(
                        padding:
                            const EdgeInsets.only(left: 5, top: 10, bottom: 10),
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                "Bí quyết An Toàn",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Container(
                              child: Icon(
                                Icons.navigate_next,
                                color: grey,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Divider(
                      height: 5,
                      color: grey,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UpdatePhone()),
                      );
                    },
                    child: Hero(
                      tag: "centerShield",
                      child: Container(
                        padding:
                            const EdgeInsets.only(left: 5, top: 10, bottom: 10),
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                "Trung tâm An toàn",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Container(
                              child: Icon(
                                Icons.navigate_next,
                                color: grey,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'QUYỀN RIÊNG TƯ',
                        style: TextStyle(
                          color: Color.fromARGB(255, 102, 101, 101),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UpdatePhone()),
                      );
                    },
                    child: Hero(
                      tag: "cookie",
                      child: Container(
                        padding:
                            const EdgeInsets.only(left: 5, top: 10, bottom: 10),
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                "Chính sách Cookie",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Container(
                              child: Icon(
                                Icons.navigate_next,
                                color: grey,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Divider(
                      height: 5,
                      color: grey,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UpdatePhone()),
                      );
                    },
                    child: Hero(
                      tag: "private",
                      child: Container(
                        padding:
                            const EdgeInsets.only(left: 5, top: 10, bottom: 10),
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                "Chính sách Quyền riêng tư",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Container(
                              child: Icon(
                                Icons.navigate_next,
                                color: grey,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Divider(
                      height: 5,
                      color: grey,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UpdatePhone()),
                      );
                    },
                    child: Hero(
                      tag: "privateSetting",
                      child: Container(
                        padding:
                            const EdgeInsets.only(left: 5, top: 10, bottom: 10),
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                "Tùy chọn Quyền riêng tư",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Container(
                              child: Icon(
                                Icons.navigate_next,
                                color: grey,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'PHÁP LÝ',
                        style: TextStyle(
                          color: Color.fromARGB(255, 102, 101, 101),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UpdatePhone()),
                      );
                    },
                    child: Hero(
                      tag: "paper",
                      child: Container(
                        padding:
                            const EdgeInsets.only(left: 5, top: 10, bottom: 10),
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                "Giấy phép",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Container(
                              child: Icon(
                                Icons.navigate_next,
                                color: grey,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Divider(
                      height: 5,
                      color: grey,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UpdatePhone()),
                      );
                    },
                    child: Hero(
                      tag: "ruleService",
                      child: Container(
                        padding:
                            const EdgeInsets.only(left: 5, top: 10, bottom: 10),
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                "Điều khoản Dịch vụ",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Container(
                              child: Icon(
                                Icons.navigate_next,
                                color: grey,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () async {
                      FirebaseAuth.instance.signOut().then(
                            (value) => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                              )
                            },
                          );
                    },
                    child: Hero(
                      tag: "logout",
                      child: Container(
                        padding:
                            const EdgeInsets.only(left: 5, top: 10, bottom: 10),
                        height: 40,
                        child: Container(
                          child: Text(
                            "Đăng xuất",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://img2.gratispng.com/20180729/obb/kisspng-logo-tinder-symbol-organization-repository-symbol-5b5e8af90d00b5.2066231715329226170533.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                "Phiên bản 13.8.0",
                style: TextStyle(
                  color: Colors.grey,
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Hero(
                      tag: "remove",
                      child: Container(
                        padding:
                            const EdgeInsets.only(left: 5, top: 10, bottom: 10),
                        height: 40,
                        child: Container(
                          child: Text(
                            "Xóa tài khoản",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
        ]),
      ),
    );
  }
}
