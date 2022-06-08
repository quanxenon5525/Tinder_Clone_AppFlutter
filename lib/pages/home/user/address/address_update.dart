import 'package:finalproject/pages/home/user/setting.dart';
import 'package:finalproject/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddressUpdate extends StatefulWidget {
  const AddressUpdate({Key key}) : super(key: key);

  @override
  State<AddressUpdate> createState() => _AddressUpdateState();
}

class _AddressUpdateState extends State<AddressUpdate> {
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
              padding: const EdgeInsets.only(right: 125),
              child: Text(
                "Địa điểm",
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
          Container(
            margin: EdgeInsets.only(left: 20, top: 20),
            child: Text(
              "ĐỊA ĐIỂM HIỆN TẠI",
              style: TextStyle(
                color: grey,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            child: Container(
              height: 50,
              padding: EdgeInsets.only(left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        SizedBox(
                          height: 40,
                          width: 40,
                          child: Icon(
                            Icons.location_on_outlined,
                            color: Colors.blue,
                            size: 28,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4, left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 0),
                                child: Text(
                                  "Địa điểm hiện tại của tôi",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "Hồ Chí Minh, Thành Phố Hồ Chí Minh",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: 50,
                  ),
                  Container(
                    child: Icon(
                      Icons.check,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 60,
            color: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.flight),
                FlatButton(
                  onPressed: () {},
                  child: Text(
                    "Thêm địa điểm mới",
                    style: TextStyle(fontSize: 18),
                  ),
                  textColor: Colors.white,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
