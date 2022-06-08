import 'package:flutter/material.dart';

class Conf_tools extends StatelessWidget {
  const Conf_tools({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/confirming.png'),
            Padding(
              padding: const EdgeInsets.only(left: 14, top: 12, bottom: 12),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Cách xác minh",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                            "Cách tốt nhất để biết một người không phải là\n'ảo'"),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 68),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
