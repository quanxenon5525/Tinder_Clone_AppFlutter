import 'package:flutter/material.dart';

class Female extends StatelessWidget {
  const Female({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: Container(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 21),
              child: Text(
                "Nữ",
                style: TextStyle(fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 14),
              child: Icon(
                Icons.check,
                color: Colors.pink,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
