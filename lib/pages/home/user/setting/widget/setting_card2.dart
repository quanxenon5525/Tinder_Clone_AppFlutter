import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingCard2 extends StatelessWidget {
  const SettingCard2({
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
                  'https://assetscdn1.paytm.com/images/catalog/product/D/DE/DEAQCQWIK86179376104EB0/0x1920/70/0.png',
                  height: 50,
                  width: 180,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                'Lượt Thích vô hạn & nhiều tiện ích khác',
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
