import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingCard extends StatelessWidget {
  const SettingCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
      child: SizedBox(
        width: 370,
        height: 80,
        child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(7),
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Colors.white,
                ],
              ),
            ),
            child: Column(
              children: [
                Center(
                  child: Image.network(
                    'https://dude-hack.com/wp-content/uploads/2021/02/Is-Tinder-Gold-Worth-It-Tinder-Gold-Logo.png',
                    height: 50,
                    width: 180,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  'Xem ai Thích bạn & nhiều tính năng khác',
                  style: TextStyle(
                    color: Color.fromARGB(255, 112, 111, 111),
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
