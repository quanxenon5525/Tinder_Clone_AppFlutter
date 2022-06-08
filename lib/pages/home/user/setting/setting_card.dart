import 'package:finalproject/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingCard1 extends StatelessWidget {
  const SettingCard1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, right: 5, left: 5),
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
                  'https://www.gratisdatingwebsite.com/wp-content/uploads/2021/01/tinder-platinum.png',
                  height: 50,
                  width: 180,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                'Trải nghiệm hẹn hò thú vị bậc nhất',
                style: TextStyle(
                  color: Color.fromARGB(255, 112, 111, 111),
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
