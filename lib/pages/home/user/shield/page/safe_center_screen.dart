import 'package:finalproject/pages/home/user/shield/page/guide_screen.dart';
import 'package:finalproject/pages/home/user/shield/page/resources_screen.dart';
import 'package:finalproject/pages/home/user/shield/page/tools_screen.dart';
import 'package:finalproject/theme/colors.dart';
import 'package:flutter/material.dart';

class SafeCenterScreen extends StatefulWidget {
  const SafeCenterScreen({Key key}) : super(key: key);

  @override
  State<SafeCenterScreen> createState() => _SafeCenterScreenState();
}

class _SafeCenterScreenState extends State<SafeCenterScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
              icon: Icon(
                Icons.close,
                color: black,
              ),
              iconSize: 30,
              onPressed: () async {
                Navigator.of(context).pop();
              }),
          centerTitle: true,
          title: Text(
            'Trung tâm An toàn',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          bottom: TabBar(
            tabs: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                  "HƯỚNG DẪN",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                  "CÔNG CỤ",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                  "TÀI NGUYÊN",
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
        ),
        body: TabBarView(children: [
          const GuideScreen(),
          const ToolsScreen(),
          const ResourcesScreen()
        ]),
      ),
    );
  }
}
