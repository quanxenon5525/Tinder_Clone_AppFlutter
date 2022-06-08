import 'package:finalproject/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ThunderCard extends StatelessWidget {
  const ThunderCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 10),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2.2,
        height: 100,
        child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(5),
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Colors.white,
                ],
              ),
            ),
            child: Container(
              margin: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Container(
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: white,
                      child: Icon(
                        Icons.bolt_outlined,
                        size: 30,
                        color: Color.fromARGB(255, 223, 40, 240),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Text(
                      'Kiếm lượt Tăng Tốc',
                      style: TextStyle(
                        color: Color.fromARGB(255, 223, 40, 240),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
