import 'package:finalproject/pages/home/user/shield/widget/check_point.dart';
import 'package:finalproject/pages/home/user/shield/widget/consensus.dart';
import 'package:finalproject/pages/home/user/shield/widget/report.dart';
import 'package:finalproject/pages/home/user/shield/widget/test_1.dart';
import 'package:finalproject/pages/home/user/shield/widget/test_2.dart';
import 'package:finalproject/pages/home/user/shield/widget/test_3.dart';
import 'package:finalproject/pages/home/user/shield/widget/text_box1.dart';
import 'package:finalproject/pages/home/user/shield/widget/text_box2.dart';
import 'package:finalproject/pages/home/user/shield/widget/text_box3.dart';
import 'package:finalproject/pages/home/user/shield/widget/travel.dart';
import 'package:finalproject/pages/home/user/shield/widget/treatment.dart';
import 'package:flutter/material.dart';

import '../widget/basic_info.dart';

class GuideScreen extends StatefulWidget {
  const GuideScreen({Key key}) : super(key: key);

  @override
  State<GuideScreen> createState() => _GuideScreenState();
}

class _GuideScreenState extends State<GuideScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 30),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Xin chào Nhân",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Dưới đây là tất cả những gì bạn cần biết \nvề vấn đề an toàn",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 4,
              ),
              CircleAvatar(
                backgroundColor: Colors.red,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "An toàn",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              BasicInfo(),
              SizedBox(
                height: 18,
              ),
              Test_1(),
              SizedBox(
                height: 18,
              ),
              Test_2(),
              SizedBox(
                height: 40,
              ),
              Text(
                "Quấy rối",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 18,
              ),
              Treatment(),
              SizedBox(
                height: 18,
              ),
              TextBox1(),
              SizedBox(
                height: 40,
              ),
              Text(
                "Gặp gỡ ngoài đời",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 18,
              ),
              CheckPoint(),
              SizedBox(
                height: 18,
              ),
              Test_3(),
              SizedBox(
                height: 40,
              ),
              Text(
                "Báo cáo",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 18,
              ),
              Report(),
              SizedBox(
                height: 18,
              ),
              TextBox2(),
              SizedBox(
                height: 18,
              ),
              TextBox3(),
              SizedBox(
                height: 40,
              ),
              Text(
                "Đồng thuận",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 18,
              ),
              consensus(),
              SizedBox(
                height: 40,
              ),
              Text(
                "Du lịch",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 18,
              ),
              Travel(),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
