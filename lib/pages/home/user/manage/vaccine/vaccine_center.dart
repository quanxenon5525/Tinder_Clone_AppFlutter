import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VaccineCenter extends StatefulWidget {
  const VaccineCenter({Key key}) : super(key: key);

  @override
  State<VaccineCenter> createState() => _VaccineCenterState();
}

class _VaccineCenterState extends State<VaccineCenter> {
  bool _checkSpace = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECEFF1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0),
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(
          color: Colors.pink,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(
                Icons.navigate_before,
                size: 30,
                color: Colors.pink,
              ),
              onPressed: () async {
                Navigator.pop(context);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(right: 95),
              child: Text(
                "Trung tâm vaccine",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 14),
            child: Text(
              "Hiển thị biểu tượng Trung tâm Vaccine trong các tương hợp mới của tôi.",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            child: SizedBox(
              height: 55,
              child: CupertinoFormRow(
                prefix: Text(
                  'Hiển thị Biểu tượng trong các\nTương hợp',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                child: CupertinoSwitch(
                  activeColor: Colors.pink,
                  value: _checkSpace,
                  onChanged: (value) {
                    setState(
                      () {
                        _checkSpace = !_checkSpace;
                      },
                    );

                    if (_checkSpace == true) {}
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
