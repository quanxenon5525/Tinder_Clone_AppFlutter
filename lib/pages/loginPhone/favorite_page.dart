import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproject/data/likes_json.dart';
import 'package:finalproject/pages/loginPhone/imgRegister/upload_img.dart';
import 'package:finalproject/theme/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Favorite_Page extends StatefulWidget {
  const Favorite_Page({Key key}) : super(key: key);

  @override
  State<Favorite_Page> createState() => _Favorite_PageState();
}

class _Favorite_PageState extends State<Favorite_Page> {
  bool selected_1 = false;
  bool colorText_1 = false;
  bool selected_2 = false;
  bool colorText_2 = false;
  bool selected_3 = false;
  bool colorText_3 = false;
  bool selected_4 = false;
  bool colorText_4 = false;
  bool selected_5 = false;
  bool colorText_5 = false;
  bool selected_6 = false;
  bool colorText_6 = false;
  bool selected_7 = false;
  bool colorText_7 = false;
  bool selected_8 = false;
  bool colorText_8 = false;
  bool selected_9 = false;
  bool colorText_9 = false;
  bool selected_10 = false;
  bool colorText_10 = false;
  bool selected_11 = false;
  bool colorText_11 = false;
  bool selected_12 = false;
  bool colorText_12 = false;
  bool selected_13 = false;
  bool colorText_13 = false;
  bool selected_14 = false;
  bool colorText_14 = false;
  bool selected_15 = false;
  bool colorText_15 = false;
  bool selected_16 = false;
  bool colorText_16 = false;
  bool selected_17 = false;
  bool colorText_17 = false;
  bool selected_18 = false;
  bool colorText_18 = false;
  bool selected_19 = false;
  bool colorText_19 = false;
  bool selected_20 = false;
  bool colorText_20 = false;
  List<String> strings = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppbar(),
      body: getBody(),
    );
  }

  AppBar getAppbar() {
    return AppBar(
      elevation: 0,
      backgroundColor: white,
      iconTheme: IconThemeData(
        color: black,
      ),
    );
  }

  Widget getBody() {
    return ListView(
      children: [
        Column(
          children: [
            Text(
              "Sở Thích",
              style: TextStyle(
                color: black,
                fontWeight: FontWeight.w500,
                fontSize: 45,
              ),
            )
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          padding: EdgeInsets.only(left: 60, right: 50),
          child: Text(
            "Hãy cho mọi người biết bạn thích những gì bằng cách thêm thông tin vào hồ sơ",
            style: TextStyle(
              color: grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Container(
          // color: Colors.blue,
          margin: EdgeInsets.only(left: 55),
          child: Text(
            "Chọn tối đa 5",
            style: TextStyle(
                color: black, fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Container(
          // color: Colors.blue,
          margin: EdgeInsets.only(left: 40, right: 40),
          padding: EdgeInsets.only(top: 15, left: 5, right: 5),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {
                      setState(() {
                        selected_1 = !selected_1;
                        colorText_1 = !colorText_1;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 14, top: 5, bottom: 5),
                      width: 80,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: selected_1
                                ? Color.fromARGB(255, 255, 25, 75)
                                : grey,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        "90s Kid",
                        style: TextStyle(
                            color: selected_1
                                ? Color.fromARGB(255, 255, 25, 75)
                                : grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selected_2 = !selected_2;
                        colorText_2 = !colorText_2;
                      });
                    },
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      padding: EdgeInsets.only(left: 15, top: 5, bottom: 5),
                      width: 160,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: selected_2
                                ? Color.fromARGB(255, 255, 25, 75)
                                : grey,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        "Chăm sóc bản thân",
                        style: TextStyle(
                            color: selected_2
                                ? Color.fromARGB(255, 255, 25, 75)
                                : grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        selected_3 = !selected_3;
                        colorText_3 = !colorText_3;
                      });
                    },
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      padding: EdgeInsets.only(left: 15, top: 5, bottom: 5),
                      width: 90,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: selected_3
                                ? Color.fromARGB(255, 255, 25, 75)
                                : grey,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        "Hot Yoga",
                        style: TextStyle(
                            color: selected_3
                                ? Color.fromARGB(255, 255, 25, 75)
                                : grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (() {
                      setState(() {
                        selected_4 = !selected_4;
                        colorText_4 = !colorText_4;
                      });
                    }),
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      padding: EdgeInsets.only(left: 15, top: 5, bottom: 5),
                      width: 60,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: selected_4
                                ? Color.fromARGB(255, 255, 25, 75)
                                : grey,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        "Viết",
                        style: TextStyle(
                          color: selected_4
                              ? Color.fromARGB(255, 255, 25, 75)
                              : grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selected_5 = !selected_5;
                        colorText_5 = !colorText_5;
                      });
                    },
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      padding: EdgeInsets.only(left: 12, top: 5, bottom: 5),
                      width: 60,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: selected_5
                                ? Color.fromARGB(255, 255, 25, 75)
                                : grey,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        "Thiền",
                        style: TextStyle(
                            color: selected_5
                                ? Color.fromARGB(255, 255, 25, 75)
                                : grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        selected_6 = !selected_6;
                        colorText_6 = !colorText_6;
                      });
                    },
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      padding: EdgeInsets.only(left: 20, top: 5, bottom: 5),
                      width: 80,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: selected_6
                                ? Color.fromARGB(255, 255, 25, 75)
                                : grey,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        "Sushi",
                        style: TextStyle(
                            color: selected_6
                                ? Color.fromARGB(255, 255, 25, 75)
                                : grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selected_7 = !selected_7;
                        colorText_7 = !colorText_7;
                      });
                    },
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      padding: EdgeInsets.only(left: 15, top: 5, bottom: 5),
                      width: 80,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: selected_7
                                ? Color.fromARGB(255, 255, 25, 75)
                                : grey,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        "Hockey",
                        style: TextStyle(
                            color: selected_7
                                ? Color.fromARGB(255, 255, 25, 75)
                                : grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selected_8 = !selected_8;
                        colorText_8 = !colorText_8;
                      });
                    },
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      padding: EdgeInsets.only(left: 12, top: 5, bottom: 5),
                      width: 80,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: selected_8
                                ? Color.fromARGB(255, 255, 25, 75)
                                : grey,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        "Bóng rổ",
                        style: TextStyle(
                            color: selected_8
                                ? Color.fromARGB(255, 255, 25, 75)
                                : grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        selected_9 = !selected_9;
                        colorText_9 = !colorText_9;
                      });
                    },
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      padding: EdgeInsets.only(left: 24, top: 5, bottom: 5),
                      width: 150,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: selected_9
                                ? Color.fromARGB(255, 255, 25, 75)
                                : grey,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        "Cuộc thi về thơ",
                        style: TextStyle(
                            color: selected_9
                                ? Color.fromARGB(255, 255, 25, 75)
                                : grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        selected_10 = !selected_10;
                        colorText_10 = !colorText_10;
                      });
                    },
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      padding: EdgeInsets.only(left: 22, top: 5, bottom: 5),
                      width: 150,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: selected_10
                                ? Color.fromARGB(255, 255, 25, 75)
                                : grey,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        "Tập luyện tại nhà",
                        style: TextStyle(
                            color: selected_10
                                ? Color.fromARGB(255, 255, 25, 75)
                                : grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {
                      setState(() {
                        selected_11 = !selected_11;
                        colorText_11 = !colorText_11;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 24, top: 5, bottom: 5),
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: selected_11
                                ? Color.fromARGB(255, 255, 25, 75)
                                : grey,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        "Manga",
                        style: TextStyle(
                            color: selected_11
                                ? Color.fromARGB(255, 255, 25, 75)
                                : grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        selected_12 = !selected_12;
                        colorText_12 = !colorText_12;
                      });
                    },
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      padding: EdgeInsets.only(left: 24, top: 5, bottom: 5),
                      width: 120,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: selected_12
                                ? Color.fromARGB(255, 255, 25, 75)
                                : grey,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        "Trang điểm",
                        style: TextStyle(
                            color: selected_12
                                ? Color.fromARGB(255, 255, 25, 75)
                                : grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selected_13 = !selected_13;
                        colorText_13 = !colorText_13;
                      });
                    },
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      padding: EdgeInsets.only(left: 20, top: 5, bottom: 5),
                      width: 80,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: selected_13
                                ? Color.fromARGB(255, 255, 25, 75)
                                : grey,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        "Bể cá",
                        style: TextStyle(
                          color: selected_13
                              ? Color.fromARGB(255, 255, 25, 75)
                              : grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        selected_14 = !selected_14;
                        colorText_14 = !colorText_14;
                      });
                    },
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      padding: EdgeInsets.only(left: 24, top: 5, bottom: 5),
                      width: 130,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: selected_14
                                ? Color.fromARGB(255, 255, 25, 75)
                                : grey,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        "Giày Sneaker",
                        style: TextStyle(
                            color: selected_14
                                ? Color.fromARGB(255, 255, 25, 75)
                                : grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selected_15 = !selected_15;
                        colorText_15 = !colorText_15;
                      });
                    },
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      padding: EdgeInsets.only(left: 20, top: 5, bottom: 5),
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: selected_15
                                ? Color.fromARGB(255, 255, 25, 75)
                                : grey,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        "Instagram",
                        style: TextStyle(
                            color: selected_15
                                ? Color.fromARGB(255, 255, 25, 75)
                                : grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: (() {
                      setState(() {
                        selected_16 = !selected_16;
                        colorText_16 = !colorText_16;
                      });
                    }),
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      padding: EdgeInsets.only(left: 15, top: 5, bottom: 5),
                      width: 130,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: selected_16
                                ? Color.fromARGB(255, 255, 25, 75)
                                : grey,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        "Suối nước nóng",
                        style: TextStyle(
                            color: selected_16
                                ? Color.fromARGB(255, 255, 25, 75)
                                : grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selected_17 = !selected_17;
                        colorText_17 = !colorText_17;
                      });
                    },
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      padding: EdgeInsets.only(left: 20, top: 5, bottom: 5),
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: selected_17
                                ? Color.fromARGB(255, 255, 25, 75)
                                : grey,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        "Võ thuật",
                        style: TextStyle(
                            color: selected_17
                                ? Color.fromARGB(255, 255, 25, 75)
                                : grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: (() {
                      setState(() {
                        selected_18 = !selected_18;
                        colorText_18 = !colorText_18;
                      });
                    }),
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      padding: EdgeInsets.only(left: 18, top: 5, bottom: 5),
                      width: 80,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: selected_18
                                ? Color.fromARGB(255, 255, 25, 75)
                                : grey,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        "Marvel",
                        style: TextStyle(
                            color: selected_18
                                ? Color.fromARGB(255, 255, 25, 75)
                                : grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selected_19 = !selected_19;
                        colorText_19 = !colorText_19;
                      });
                    },
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      padding: EdgeInsets.only(left: 20, top: 5, bottom: 5),
                      width: 80,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: selected_19
                                ? Color.fromARGB(255, 255, 25, 75)
                                : grey,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        "Đi dạo",
                        style: TextStyle(
                            color: selected_19
                                ? Color.fromARGB(255, 255, 25, 75)
                                : grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (() {
                      setState(() {
                        selected_20 = !selected_20;
                        colorText_20 = !colorText_20;
                      });
                    }),
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      padding: EdgeInsets.only(left: 12, top: 5, bottom: 5),
                      width: 60,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: selected_20
                                ? Color.fromARGB(255, 255, 25, 75)
                                : grey,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        "Chạy",
                        style: TextStyle(
                            color: selected_20
                                ? Color.fromARGB(255, 255, 25, 75)
                                : grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                borderRadius: BorderRadius.circular(60),
                onTap: (() async {
                  if (strings.length < 5) {
                    if (selected_1 == true) {
                      strings.add("90S Kid");
                    }
                    if (selected_2 == true) {
                      strings.add("Chăm sóc bản thân");
                    }
                    if (selected_3 == true) {
                      strings.add("Hot Yoga");
                    }
                    if (selected_4 == true) {
                      strings.add("Viết");
                    }
                    if (selected_5 == true) {
                      strings.add("Thiền");
                    }
                    if (selected_6 == true) {
                      strings.add("Sushi");
                    }
                    if (selected_7 == true) {
                      strings.add("Hockey");
                    }
                    if (selected_8 == true) {
                      strings.add("Bóng rổ");
                    }
                    if (selected_9 == true) {
                      strings.add("Cuộc thi về thơ");
                    }
                    if (selected_10 == true) {
                      strings.add("Tập luyện tại nhà");
                    }
                    if (selected_11 == true) {
                      strings.add("Manga");
                    }
                    if (selected_12 == true) {
                      strings.add("Trang điểm");
                    }
                    if (selected_13 == true) {
                      strings.add("Bể cá");
                    }
                    if (selected_14 == true) {
                      strings.add("Giày Sneaker");
                    }
                    if (selected_15 == true) {
                      strings.add("Instagram");
                    }
                    if (selected_16 == true) {
                      strings.add("Suối nước nóng");
                    }
                    if (selected_17 == true) {
                      strings.add("Võ thuật");
                    }
                    if (selected_18 == true) {
                      strings.add("Marvel");
                    }
                    if (selected_19 == true) {
                      strings.add("Đi dạo");
                    }
                    if (selected_20 == true) {
                      strings.add("Chạy");
                    }
                  }
                  // print(strings);
                  // if (selected != null) {
                  // if (selected == "first") {
                  //   result = "Nữ";
                  // } else if (selected == "second") {
                  //   result = "Nam";
                  // } else {
                  //   result = "Giới Tính Khác";
                  // }
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UploadImage_Page()),
                  );
                  User user = FirebaseAuth.instance.currentUser;

                  await FirebaseFirestore.instance
                      .collection('user')
                      .doc(user.uid)
                      .update({
                    'favorite': strings,
                  });
                }),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    color: Color.fromARGB(255, 255, 25, 75),
                  ),
                  width: 320,
                  height: 50,
                  child: Center(
                    child: Text(
                      "TIẾP TỤC",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
