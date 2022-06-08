import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Gift extends StatelessWidget {
  const Gift({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
      child: SizedBox(
        height: 90,
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
            margin: EdgeInsets.only(left: 100, top: 5, bottom: 10),
            child: Row(
              children: [
                Container(
                  child: Image.network(
                    "https://cdn-icons-png.flaticon.com/512/4213/4213958.png",
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  margin: EdgeInsets.only(top: 12),
                  child: Text(
                    'Nhận Thưởng',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
