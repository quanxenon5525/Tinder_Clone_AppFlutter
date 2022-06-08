import 'package:finalproject/pages/home/user/editInformation/edit.dart';
import 'package:finalproject/pages/home/user/editInformation/preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class EditInfoHome extends StatelessWidget {
  const EditInfoHome({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Sửa Thông tin',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          elevation: 0,
          bottom: TabBar(tabs: [
            Tab(
              child: Text(
                'Chỉnh sửa',
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            ),
            Tab(
              child: Text(
                'Xem trước',
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            )
          ]),
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
          ],
        ),
        body: TabBarView(
          children: [Edit(), const Preview()],
        ),
      ),
    );
  }
}
