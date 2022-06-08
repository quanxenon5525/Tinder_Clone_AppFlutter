import 'package:flutter/material.dart';

class Test_1 extends StatelessWidget {
  const Test_1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360,
      height: 90,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(5),
          gradient: const LinearGradient(
            colors: [Colors.white, Colors.white],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 14),
          child: Row(
            children: [
              Container(
                width: 70,
                height: 45,
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(255, 255, 255, 75)),
                  borderRadius: BorderRadius.circular(5),
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 255, 255, 75),
                      Color.fromARGB(255, 255, 255, 75)
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: Text(
                      "Kiểm tra",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "Trắc nghiệm về An toàn khi\nhẹn hò trên mạng",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 36),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
