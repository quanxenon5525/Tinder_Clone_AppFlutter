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
          'C??i ?????t',
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
                  'THI???T L???P T??I KHO???N',
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
                              "S??? ??i???n tho???i",
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
                            "T??i kho???n ???? k???t n???i",
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
                  'S??? ??i???n tho???i v?? Email ???? x??c minh gi??p b???o m???t t??i kho???n c???a b???n',
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
                Text('KH??M PH??'),
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
                              "?????a ??i???m",
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
                                    "?????a ??i???m hi???n t???i c???a t??i",
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    "H??? Ch?? Minh , Th??nh Ph??? H??? Ch?? Minh",
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
                              "Kho???ng c??ch ??u ti??n",
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
                          'Ch??? hi???n th??? ng?????i trong ph???m vi n??y',
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
                              "Hi???n th??? cho t??i",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "N???",
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
                              "????? tu???i ??u ti??n",
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
                          'Ch??? hi???n th??? ng?????i trong ph???m vi n??y',
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
                          'To??n C???u',
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
                  'M??? ra to??n c???u s??? t???o c?? h???i ????? b???n g???p g??? nhi???u ng?????i quanh ????y c??ng nh?? ??? kh???p n??i tr??n th??? gi???i',
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
                  'NG??N NG??? ?????U TI??N',
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
                              "Ti???ng Vi???t",
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
                              "Th??m ng??n ng???..",
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
                      'KI???M SO??T AI B???N S??? TH???Y',
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
                            '????? xu???t ?????i t?????ng ch???n l???c',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          Container(
                            width: 320,
                            child: Text(
                              'Xem nh???ng ng?????i ph?? h???p v???i b???n nh???t(c??i ?????t m???c ?????nh)',
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
                            '????? xu???t ?????i t?????ng ch???n l???c',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          Container(
                            width: 320,
                            child: Text(
                              'Xem nh???ng ng?????i c?? ho???t ?????ng m???i nh???t tr?????c',
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
                      'KI???M SO??T AI TH???Y ???????C B???N',
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
                            'Ti??u chu???n',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          Container(
                            width: 320,
                            child: Text(
                              'Ch??? hi???n th??? cho m???t s??? ki???u ng?????i nh???t ?????nh ????? xu???t c?? nh??n',
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
                            'Ch??? nh???ng ng?????i t??i Th??ch',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          Container(
                            width: 320,
                            child: Text(
                              'Ch??? nh???ng ng?????i t??i ???? qu???t ph???i s??? th???y t??i',
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
                      'Hi???n th??? t??i tr??n Tinder',
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
              'Khi ???? t???t,b???n s??? kh??ng ???????c hi???n th??? trong th??? ?????i di???n.Nh???ng ng?????i b???n ???? t??? ?? th??ch c?? th??? v???n nh??n th???y h??? s?? v?? t????ng h???p v???i b???n.B???n v???n c?? th??? xem v?? tr?? chuy???n v???i c??c b???n t????ng h???p c???a m??nh.',
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
                                "Ch???n li??n h???",
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
              'Ch???n nh???ng ?????i t?????ng b???n kh??ng mu???n nh??n th???y ho???c kh??ng mu???n h??? nh??n th???y b???n tr??n Tinder t??? danh s??ch li??n h??? c???a b???n',
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
                  'H???P C???',
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
                                "Qu???n l?? H???p c???",
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
                  'TOP TUY???N CH???N',
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
                                "Qu???n l?? Top Tuy???n ch???n",
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
                  'TH??NG B??O ???? XEM',
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
                                "Qu???n l?? Th??ng b??o ???? xem",
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
                  'KHUNG GI??? V??NG',
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
                                "Qu???n l?? Khung gi??? v??ng",
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
                  'TRUNG T??M VACCINE',
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
                                "Qu???n l?? Trung t??m Vaccine",
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
                  'M???C S??? D???NG D??? LI???U',
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
                                "Ph??t t??? ?????ng video",
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
                  'TR???NG TH??I HO???T ?????NG',
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
                                "??ang  tr???c tuy???n",
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
                                "Tr???ng th??i ho???t ?????ng g???n ????y",
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
                  'H??? S?? WEB',
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
                                "T??n ng?????i...",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  child: Text(
                                    "Nh???p t??n ng?????i d??ng c???a b???n",
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
              'T???o T??n ng?????i d??ng c??ng khai.Chia s??? t??n ng?????i d??ng c???a b???n ????? m???i ng?????i tr??n to??n th??? gi???i c?? th??? vu???t qua ph???i cho b???n tr??n Tinder',
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
                        'TH??NG B??O',
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
                                "Th??ng B??o C???p Nh???t",
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
              'Ch???n c??c th??ng b??o mu???n xem khi ??ang ??? trong ???ng d???ng',
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
                            "Kh??i ph???c ho???t ?????ng Mua",
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
                            "Chia s??? Tinder",
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
                        'C???NG ?????NG',
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
                                "Quy t???c C???ng ?????ng",
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
                                "B?? quy???t An To??n",
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
                                "Trung t??m An to??n",
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
                        'QUY???N RI??NG T??',
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
                                "Ch??nh s??ch Cookie",
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
                                "Ch??nh s??ch Quy???n ri??ng t??",
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
                                "T??y ch???n Quy???n ri??ng t??",
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
                        'PH??P L??',
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
                                "Gi???y ph??p",
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
                                "??i???u kho???n D???ch v???",
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
                            "????ng xu???t",
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
                "Phi??n b???n 13.8.0",
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
                            "X??a t??i kho???n",
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
