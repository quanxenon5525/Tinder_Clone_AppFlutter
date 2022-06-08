import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproject/data/likes_json.dart';
import 'package:finalproject/theme/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LikePage extends StatefulWidget {
  const LikePage({Key key}) : super(key: key);

  @override
  State<LikePage> createState() => _LikePageState();
}

class _LikePageState extends State<LikePage> {
  User user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: white,
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('user')
            .where('ListUidMatch', arrayContains: user.uid)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            padding: EdgeInsets.only(bottom: 100),
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "99+ Lượt Thích",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: black,
                      ),
                    ),
                    Text(
                      "Top Tuyển chọn",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 0.8,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Wrap(
                  spacing: 5,
                  runSpacing: 5,
                  children: List.generate(
                    snapshot.data.docs.length,
                    (index) {
                      return Container(
                        width: (size.width - 15) / 2,
                        height: 250,
                        child: Stack(
                          children: [
                            Container(
                              width: (size.width - 15) / 2,
                              height: 250,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        snapshot.data.docs[index]['img'][0],
                                      ),
                                      fit: BoxFit.cover)),
                            ),
                            Container(
                              width: (size.width - 15) / 2,
                              height: 250,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  colors: [
                                    black.withOpacity(0.25),
                                    black.withOpacity(0),
                                  ],
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 8,
                                          height: 8,
                                          decoration: BoxDecoration(
                                            color: green,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "Recently Active",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: white,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
          //   },
          // );
        },
      ),
      bottomSheet: getFooter(),
    );
  }

  Widget getFooter() {
    var size = MediaQuery.of(context).size;

    return Container(
      color: Colors.white,
      width: size.width,
      height: 80,
      child: Column(children: [
        Container(
          width: size.width - 70,
          height: 50,
          margin: EdgeInsets.only(top: 25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
              colors: [
                yellow_one,
                yellow_two,
              ],
            ),
          ),
          child: Center(
              child: Text(
            "SEE WHO LIKES YOU",
            style: TextStyle(
              fontSize: 18,
              color: white,
              fontWeight: FontWeight.bold,
            ),
          )),
        )
      ]),
    );
  }
}
