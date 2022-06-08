import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Treatment extends StatelessWidget {
  const Treatment({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360,
      height: 100,
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
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: SvgPicture.asset('assets/icons/chat.svg'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text(
                        "Cách xử lý",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Nếu bạn thấy chuyện gì đó\nkhông ổn, hãy lên tiếng.",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 43),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
