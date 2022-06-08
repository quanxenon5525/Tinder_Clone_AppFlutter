import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class EditCity extends StatefulWidget {
  const EditCity({Key key}) : super(key: key);

  @override
  State<EditCity> createState() => _EditCityState();
}

class _EditCityState extends State<EditCity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECEFF1),
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Sửa Thành phố',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Hủy',
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
          height: 50,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Icon(
                    Icons.send,
                    color: Colors.purple,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Gần Địa Điểm hiện tại',
                  style: TextStyle(color: Colors.purple),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Icon(
                    Icons.leave_bags_at_home_outlined,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Tôi không muốn hiển thị thành phố của mình',
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
