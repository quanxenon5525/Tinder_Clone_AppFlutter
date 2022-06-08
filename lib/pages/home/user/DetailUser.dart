import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproject/theme/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:story_view/story_view.dart';

class DetailUser extends StatefulWidget {
  const DetailUser({Key key, @required this.uid}) : super(key: key);
  final String uid;
  @override
  State<DetailUser> createState() => _DetailUserState();
}

class _DetailUserState extends State<DetailUser> {
  final StoryController controller = StoryController();
  User user = FirebaseAuth.instance.currentUser;
  List<String> arrayList = [];
  List<String> arrayList2 = [];
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  @override
  void intitState() {
    super.initState();
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.PLAYING;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('user')
            .where('uid', isEqualTo: widget.uid)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: [
              Stack(
                children: [
                  Container(
                    height: 500,
                    child: StoryView(
                      controller: controller,
                      storyItems: [
                        for (var i = 0; i < snapshot.data.docs.length; i++)
                          for (var index = 0;
                              index < snapshot.data.docs[i].get('img').length;
                              index++)
                            StoryItem.inlineImage(
                              url: snapshot.data.docs[i].get('img')[index],
                              controller: controller,
                            ),
                      ],
                      onStoryShow: (s) {
                        print("Showing a story");
                      },
                      onComplete: () {
                        print("Completed a cycle");
                      },
                      // progressPosition: ProgressPosition.bottom,
                      repeat: false,
                      inline: true,
                    ),
                  ),
                  Container(
                    child: IconButton(
                      icon: Icon(
                        Icons.more_horiz,
                        color: white,
                        size: 40,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 320, top: 470),
                    child: FloatingActionButton(
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Color.fromARGB(255, 255, 25, 75),
                        child: Icon(
                          Icons.arrow_downward,
                          size: 30,
                          color: white,
                        ),
                      ),
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Divider(
                    height: 5,
                  )
                ],
              ),
              for (var value = 0; value < snapshot.data.docs.length; value++)
                Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Text(
                            snapshot.data.docs[value].get('name'),
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10, left: 17),
                          child: Text(
                            "20",
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 7, left: 20),
                          child: Icon(
                            Icons.home,
                            color: Color.fromARGB(255, 116, 114, 114),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 7, left: 5),
                          child: Text(
                            "Sống tại Hồ Chí Minh",
                            style: TextStyle(
                              fontSize: 17,
                              color: Color.fromARGB(255, 116, 114, 114),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 7, left: 20),
                          child: Icon(
                            Icons.location_on,
                            color: Color.fromARGB(255, 116, 114, 114),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 7, left: 5),
                          child: Text(
                            "1 kilometer(s) away",
                            style: TextStyle(
                              fontSize: 17,
                              color: Color.fromARGB(255, 116, 114, 114),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10, left: 25),
                          child: Text(
                            "Giới thiệu bản thân",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 25),
                      child: Text(
                        "IG: Zhan.ghaiyue and my name's meaning is Moon on the Ocean",
                        style: TextStyle(
                          fontSize: 17,
                          color: Color.fromARGB(255, 151, 149, 149),
                        ),
                      ),
                    ),
                    Divider(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10, left: 25),
                          child: Text(
                            "Sở thích của tôi",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                          width: 300,
                          height: 50,
                          child: Row(
                            children: [
                              for (var favorite = 0;
                                  favorite <
                                      snapshot.data.docs[value]
                                          .get('favorite')
                                          .length;
                                  favorite++)
                                StreamBuilder(
                                  stream: FirebaseFirestore.instance
                                      .collection('user')
                                      .where('uid', isEqualTo: user.uid)
                                      .snapshots(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<QuerySnapshot>
                                          snapshotCheck) {
                                    if (!snapshotCheck.hasData) {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                    for (var a = 0;
                                        a < snapshotCheck.data.docs.length;
                                        a++) {
                                      for (var u = 0;
                                          u <
                                              snapshotCheck.data.docs[a]
                                                  .get('favorite')
                                                  .length;
                                          u++) {
                                        if (arrayList.contains(snapshotCheck
                                            .data.docs[a]
                                            .get('favorite')[u])) {
                                          print('Exist');
                                        } else {
                                          arrayList.add(snapshotCheck
                                              .data.docs[a]
                                              .get('favorite')[u]);
                                        }
                                      }
                                      // for (var indexCheck = 0;
                                      //     indexCheck < arrayList.length;
                                      //     indexCheck++) {
                                      //   if (arrayList[indexCheck] ==
                                      //       snapshot.data.docs[value]
                                      //           .get('favorite')[favorite]) {
                                      if (arrayList.contains(snapshot
                                          .data.docs[value]
                                          .get('favorite')[favorite])) {
                                        return Container(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 5,
                                            horizontal: 10,
                                          ),
                                          margin: EdgeInsets.only(right: 10),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Color.fromARGB(
                                                    255, 243, 32, 109)),
                                            borderRadius:
                                                BorderRadius.circular(40),
                                          ),
                                          child: Text(
                                            snapshot.data.docs[value]
                                                .get('favorite')[favorite],
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 243, 32, 109),
                                            ),
                                          ),
                                        );
                                      } else {
                                        return Container(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 5,
                                            horizontal: 10,
                                          ),
                                          margin: EdgeInsets.only(right: 10),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: grey,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(40),
                                          ),
                                          child: Text(
                                            snapshot.data.docs[value]
                                                .get('favorite')[favorite],
                                          ),
                                        );
                                      }
                                    }
                                  },
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10, left: 25),
                          child: Text(
                            "Nhạc hiệu của tôi",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 10, left: 25),
                                  child: Text(
                                    "Em của ngày hôm qua",
                                    style: TextStyle(
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: green,
                                        ),
                                        child: Icon(
                                          Icons.wifi,
                                          size: 17,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            child: Text(
                                              "Sơn Tùng - MTP",
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Stack(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                String url =
                                    "https://thegrowingdeveloper.org/files/audios/quiet-time.mp3?b4869097e4";
                                await audioPlayer.play(url);
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 20),
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "https://amatrendy.net/cdn/files/loi-bai-hat-em-cua-ngay-hom-qua.jpg"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(
                      height: 15,
                    ),
                    Column(
                      children: [
                        Container(
                          child: Text(
                            "CHIA SẺ HỒ SƠ CỦA " +
                                snapshot.data.docs[value].get('name'),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: black,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Text(
                          "ĐỂ XEM BẠN BÈ NGHĨ SAO",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                    Divider(
                      height: 15,
                    ),
                    Column(
                      children: [
                        Text(
                          "TRÌNH BÁO " + snapshot.data.docs[value].get('name'),
                        )
                      ],
                    )
                  ],
                ),
            ],
          );
        },
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 80, right: 80),
        height: 100,
        width: 300,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              // color: Colors.blue,
              width: 65,
              height: 70,
              child: IconButton(
                onPressed: () {},
                icon: CircleAvatar(
                  radius: 30,
                  backgroundColor: Color.fromARGB(255, 255, 255, 255),
                  child: Icon(
                    Icons.close,
                    size: 40,
                    color: Color.fromARGB(255, 255, 25, 75),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              // color: Colors.blue,
              width: 65,
              height: 70,
              child: IconButton(
                onPressed: () {},
                icon: CircleAvatar(
                  radius: 30,
                  backgroundColor: Color.fromARGB(255, 255, 255, 255),
                  child: Icon(
                    Icons.star,
                    size: 40,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              width: 65,
              height: 70,
              child: IconButton(
                onPressed: () {},
                icon: CircleAvatar(
                  radius: 30,
                  backgroundColor: Color.fromARGB(255, 255, 255, 255),
                  child: Icon(
                    Icons.favorite,
                    size: 40,
                    color: Colors.green,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // bottomSheet:
    );
  }
}
