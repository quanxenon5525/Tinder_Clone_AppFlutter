import 'package:finalproject/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class UpdateEmail extends StatefulWidget {
  const UpdateEmail({Key key}) : super(key: key);

  @override
  State<UpdateEmail> createState() => _UpdateEmailState();
}

class _UpdateEmailState extends State<UpdateEmail> {
  TextEditingController _email = TextEditingController();

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
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
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
              ],
            ),
            Text(
              "Email",
              style: TextStyle(color: black, fontSize: 20),
            ),
            Text(
              "Số điện thoại",
              style: TextStyle(color: black.withOpacity(0), fontSize: 10),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10, top: 20),
            child: Text(
              "EMAIL",
              style: TextStyle(
                color: grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            child: InkWell(
              onTap: () {},
              child: Container(
                height: 50,
                padding: EdgeInsets.only(left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      // color: Colors.grey,
                      child: Column(
                        children: [
                          TextFormField(
                            cursorColor: Colors.blue,
                            controller: _email,
                            decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              contentPadding:
                                  EdgeInsetsDirectional.only(start: 10.0),
                              border: InputBorder.none,
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
          ),
          Container(
            margin: EdgeInsets.only(left: 10, top: 10),
            child: Text(
              "Email của bạn đã được xác minh",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            child: InkWell(
              onTap: () async {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => ChangePhone()),
                // );
              },
              child: Container(
                padding: const EdgeInsets.only(left: 15, top: 5, bottom: 5),
                height: 50,
                child: Center(
                  child: Text(
                    "Gửi email xác minh",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
