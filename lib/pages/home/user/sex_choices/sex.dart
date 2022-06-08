import 'package:finalproject/pages/home/user/sex_choices/choices/everybody.dart';
import 'package:finalproject/pages/home/user/sex_choices/choices/female.dart';
import 'package:finalproject/pages/home/user/sex_choices/choices/male.dart';
import 'package:finalproject/theme/colors.dart';
import 'package:flutter/material.dart';

class SexChoices extends StatefulWidget {
  const SexChoices({Key key}) : super(key: key);

  @override
  State<SexChoices> createState() => _SexChoicesState();
}

class _SexChoicesState extends State<SexChoices> {
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
                "Hiển thị cho tôi",
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
            margin: EdgeInsets.only(left: 20, top: 20),
            child: Text(
              "HIỂN THỊ CHO TÔI",
              style: TextStyle(
                color: grey,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Female(),
          SizedBox(
            height: 2,
          ),
          Male(),
          SizedBox(
            height: 2,
          ),
          EveryBody(),
          SizedBox(
            height: 40,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 154),
                child: Text(
                  "Tinder chào đón tất cả các bạn.",
                  style: TextStyle(
                    color: grey,
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                "Giờ đây mục cài đặt khám phá hiển thị những người\ndùng có bao gồm nhiều thông tin hơn về [xác định giới\ntính] (https://blog.gotinder.com/genders) và [khuynh\nhướng tình dục] (https://blog.gotinder.com/orientations)\ncủa họ. Khi người dùng thêm thông tin về bản thân, họ\ncó thể chọn hiển thị trong những mục tìm kiếm nào phản\nánh tốt nhất về nhân thân của họ",
                style: TextStyle(
                  color: grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
