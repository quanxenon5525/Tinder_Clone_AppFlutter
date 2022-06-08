import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproject/data/explore_json.dart';
import 'package:finalproject/data/icons.dart';
import 'package:finalproject/data/likes_json.dart';
import 'package:finalproject/pages/match_page.dart';
import 'package:finalproject/theme/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:intl/intl.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  // List itemsTemp = [];
  // int itemLength = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    User user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('user')
            .where('uid', isEqualTo: user.uid)
            .snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot> snapshotListUid) {
          if (!snapshotListUid.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          for (var i = 0; i < snapshotListUid.data.docs.length; i++) {
            if (snapshotListUid.data.docs[i].get('ListUidMatch').length > 0) {
              for (var y = 0;
                  y < snapshotListUid.data.docs[i].get('ListUidMatch').length;
                  y++) {
                return StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('user')
                      .where('uid', whereNotIn: [
                    user.uid,
                    snapshotListUid.data.docs[i].get('ListUidMatch')[y]
                  ]).snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    // print(snapshot.data.docs.length);

                    for (var index = 0;
                        index < snapshot.data.docs.length;
                        index++) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Container(
                          // color: Colors.blue,
                          height: size.height,
                          padding: EdgeInsets.only(bottom: 10),
                          child: TinderSwapCard(
                            maxWidth: size.width,
                            maxHeight: size.height * 0.75,
                            minWidth: size.width * 0.8,
                            minHeight: size.height * 0.7,
                            cardBuilder: (context, index) => Container(
                              // color: Colors.red,
                              // padding: EdgeInsets.only(bottom: 250),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: grey.withOpacity(0.3),
                                        blurRadius: 5,
                                        spreadRadius: 2),
                                  ]),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Stack(
                                  children: [
                                    Container(
                                      width: size.width,
                                      height: size.height,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(snapshot
                                              .data.docs[index]
                                              .get('img')[0]),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: size.width,
                                      height: size.height,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: [
                                              black.withOpacity(0.25),
                                              black.withAlpha(0),
                                            ],
                                            end: Alignment.topCenter,
                                            begin: Alignment.bottomCenter),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: size.width * 0.72,
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            snapshot.data
                                                                .docs[index]
                                                                .get('name'),
                                                            style: TextStyle(
                                                              fontSize: 28,
                                                              color: white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          // Text(
                                                          //   snapshot.data.docs[index]
                                                          //       .get('age'),
                                                          //   style: TextStyle(
                                                          //     fontSize: 26,
                                                          //     color: white,
                                                          //   ),
                                                          // ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Container(
                                                            width: 10,
                                                            height: 10,
                                                            decoration:
                                                                BoxDecoration(
                                                                    color:
                                                                        green,
                                                                    shape: BoxShape
                                                                        .circle),
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            "Recently Active",
                                                            style: TextStyle(
                                                              fontSize: 18,
                                                              color: white,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Row(
                                                        children: List.generate(
                                                          snapshot
                                                              .data.docs[index]
                                                              .get('favorite')
                                                              .length,
                                                          (indexlikes) {
                                                            if (indexlikes ==
                                                                0) {
                                                              return Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        right:
                                                                            8),
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            30),
                                                                    color: white
                                                                        .withOpacity(
                                                                            0.4),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color:
                                                                          white,
                                                                      width: 2,
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .only(
                                                                      left: 1.0,
                                                                      right:
                                                                          5.0,
                                                                      bottom: 3,
                                                                      top: 3,
                                                                    ),
                                                                    child: Text(
                                                                      snapshot
                                                                          .data
                                                                          .docs[
                                                                              index]
                                                                          .get(
                                                                              'favorite')[indexlikes],
                                                                      style:
                                                                          TextStyle(
                                                                        color:
                                                                            white,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            } else {
                                                              return Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        right:
                                                                            8),
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            30),
                                                                    color: white
                                                                        .withOpacity(
                                                                            0.2),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .only(
                                                                      left:
                                                                          10.0,
                                                                      right:
                                                                          10.0,
                                                                      bottom: 3,
                                                                      top: 3,
                                                                    ),
                                                                    child: Text(
                                                                      snapshot
                                                                          .data
                                                                          .docs[
                                                                              index]
                                                                          .get(
                                                                              'favorite')[indexlikes],
                                                                      style:
                                                                          TextStyle(
                                                                        color:
                                                                            white,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    width: size.width * 0.1,
                                                    child: Center(
                                                      child: Icon(
                                                        Icons.info,
                                                        color: white,
                                                        size: 28,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                right: 25,
                                                left: 25,
                                                bottom: 12),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children:
                                                  List.generate(5, (index) {
                                                return Container(
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: white,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: grey
                                                              .withOpacity(0.1),
                                                          spreadRadius: 5,
                                                          blurRadius: 10,
                                                        ),
                                                      ]),
                                                  child: Center(
                                                      child: IconButton(
                                                    onPressed: () {},
                                                    icon: SvgPicture.asset(
                                                      item_icons[index]['icon'],
                                                    ),
                                                  )),
                                                );
                                              }),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            totalNum: snapshot.data.docs.length,
                            swipeCompleteCallback:
                                (CardSwipeOrientation orientation,
                                    int index) async {
                              debugPrint(index.toString());
                              // print(snapshot.data.docs[index].get('uid'));

                              final QuerySnapshot result =
                                  await FirebaseFirestore.instance
                                      .collection('match')
                                      .where(
                                        'uid',
                                        isEqualTo: snapshot.data.docs[index]
                                            .get('uid'),
                                      )
                                      .where('ListUidMatch',
                                          arrayContains: user.uid)
                                      .limit(1)
                                      .get();
                              final List<DocumentSnapshot> documents =
                                  result.docs;
                              if (documents.length > 0) {
                                if ((orientation.toString() ==
                                    "CardSwipeOrientation.RIGHT")) {
                                  FirebaseFirestore.instance
                                      .collection('match')
                                      .doc(user.uid)
                                      .update({
                                    "ListUidMatch": FieldValue.arrayUnion(
                                        [snapshot.data.docs[index].get('uid')]),
                                    "time": Timestamp.now(),
                                  });

                                  FirebaseFirestore.instance
                                      .collection('user')
                                      .doc(user.uid)
                                      .update({
                                    "ListUidMatch": FieldValue.arrayUnion(
                                        [snapshot.data.docs[index].get('uid')]),
                                  });

                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => MatchPage(
                                          uidCheck: snapshot.data.docs[index]
                                              .get('uid'))));
                                } else {
                                  print("không match");
                                }
                              } else {
                                FirebaseFirestore.instance
                                    .collection('match')
                                    .doc(user.uid)
                                    .update({
                                  "ListUidMatch": FieldValue.arrayUnion(
                                      [snapshot.data.docs[index].get('uid')]),
                                  "time": Timestamp.now(),
                                });
                                FirebaseFirestore.instance
                                    .collection('user')
                                    .doc(user.uid)
                                    .update({
                                  "ListUidMatch": FieldValue.arrayUnion(
                                      [snapshot.data.docs[index].get('uid')]),
                                });
                              }

                              // print(snapshot.data.docs[index].get('uid'));

                              debugPrint(orientation.toString());
                            },
                          ),
                        ),
                      );
                    }
                  },
                );
              }
            } else {
              return StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('user')
                    .where('uid', isNotEqualTo: user.uid)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  // print(snapshot.data.docs.length);

                  for (var index = 0;
                      index < snapshot.data.docs.length;
                      index++) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Container(
                        // color: Colors.blue,
                        height: size.height,
                        padding: EdgeInsets.only(bottom: 10),
                        child: TinderSwapCard(
                          maxWidth: size.width,
                          maxHeight: size.height * 0.75,
                          minWidth: size.width * 0.8,
                          minHeight: size.height * 0.7,
                          cardBuilder: (context, index) => Container(
                            // color: Colors.red,
                            // padding: EdgeInsets.only(bottom: 250),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: grey.withOpacity(0.3),
                                      blurRadius: 5,
                                      spreadRadius: 2),
                                ]),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Stack(
                                children: [
                                  Container(
                                    width: size.width,
                                    height: size.height,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(snapshot
                                            .data.docs[index]
                                            .get('img')[0]),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: size.width,
                                    height: size.height,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [
                                            black.withOpacity(0.25),
                                            black.withAlpha(0),
                                          ],
                                          end: Alignment.topCenter,
                                          begin: Alignment.bottomCenter),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: size.width * 0.72,
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          snapshot
                                                              .data.docs[index]
                                                              .get('name'),
                                                          style: TextStyle(
                                                            fontSize: 28,
                                                            color: white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        // Text(
                                                        //   snapshot.data.docs[index]
                                                        //       .get('age'),
                                                        //   style: TextStyle(
                                                        //     fontSize: 26,
                                                        //     color: white,
                                                        //   ),
                                                        // ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Container(
                                                          width: 10,
                                                          height: 10,
                                                          decoration:
                                                              BoxDecoration(
                                                                  color: green,
                                                                  shape: BoxShape
                                                                      .circle),
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          "Recentyly Active",
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            color: white,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      children: List.generate(
                                                        snapshot
                                                            .data.docs[index]
                                                            .get('favorite')
                                                            .length,
                                                        (indexlikes) {
                                                          if (indexlikes == 0) {
                                                            return Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .symmetric(
                                                                      vertical:
                                                                          8),
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30),
                                                                  color: white
                                                                      .withOpacity(
                                                                          0.4),
                                                                  border: Border
                                                                      .all(
                                                                    color:
                                                                        white,
                                                                    width: 2,
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                    left: 10.0,
                                                                    right: 5.0,
                                                                    bottom: 3,
                                                                    top: 3,
                                                                  ),
                                                                  child: Text(
                                                                    snapshot
                                                                        .data
                                                                        .docs[
                                                                            index]
                                                                        .get(
                                                                            'favorite')[indexlikes],
                                                                    style:
                                                                        TextStyle(
                                                                      color:
                                                                          white,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          } else {
                                                            return Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      right: 8),
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30),
                                                                  color: white
                                                                      .withOpacity(
                                                                          0.2),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                    left: 10.0,
                                                                    right: 10.0,
                                                                    bottom: 3,
                                                                    top: 3,
                                                                  ),
                                                                  child: Text(
                                                                    snapshot
                                                                        .data
                                                                        .docs[
                                                                            index]
                                                                        .get(
                                                                            'favorite')[indexlikes],
                                                                    style:
                                                                        TextStyle(
                                                                      color:
                                                                          white,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  width: size.width * 0.2,
                                                  child: Center(
                                                    child: Icon(
                                                      Icons.info,
                                                      color: white,
                                                      size: 28,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              right: 25, left: 25, bottom: 12),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: List.generate(5, (index) {
                                              return Container(
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: white,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: grey
                                                            .withOpacity(0.1),
                                                        spreadRadius: 5,
                                                        blurRadius: 10,
                                                      ),
                                                    ]),
                                                child: Center(
                                                    child: IconButton(
                                                  onPressed: () {},
                                                  icon: SvgPicture.asset(
                                                    item_icons[index]['icon'],
                                                  ),
                                                )),
                                              );
                                            }),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          totalNum: snapshot.data.docs.length,
                          swipeCompleteCallback:
                              (CardSwipeOrientation orientation,
                                  int index) async {
                            debugPrint(index.toString());
                            // print(snapshot.data.docs[index].get('uid'));

                            final QuerySnapshot result = await FirebaseFirestore
                                .instance
                                .collection('match')
                                .where(
                                  'uid',
                                  isEqualTo:
                                      snapshot.data.docs[index].get('uid'),
                                )
                                .where('ListUidMatch', arrayContains: user.uid)
                                .limit(1)
                                .get();
                            final List<DocumentSnapshot> documents =
                                result.docs;
                            if (documents.length > 0) {
                              if ((orientation.toString() ==
                                  "CardSwipeOrientation.RIGHT")) {
                                FirebaseFirestore.instance
                                    .collection('match')
                                    .doc(user.uid)
                                    .update({
                                  "ListUidMatch": FieldValue.arrayUnion(
                                      [snapshot.data.docs[index].get('uid')]),
                                  "time": Timestamp.now(),
                                });

                                FirebaseFirestore.instance
                                    .collection('user')
                                    .doc(user.uid)
                                    .update({
                                  "ListUidMatch": FieldValue.arrayUnion(
                                      [snapshot.data.docs[index].get('uid')]),
                                });

                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => MatchPage(
                                        uidCheck: snapshot.data.docs[index]
                                            .get('uid'))));
                              } else {
                                print("không match");
                              }
                            } else {
                              FirebaseFirestore.instance
                                  .collection('match')
                                  .doc(user.uid)
                                  .update({
                                "ListUidMatch": FieldValue.arrayUnion(
                                    [snapshot.data.docs[index].get('uid')]),
                                "time": Timestamp.now(),
                              });
                              FirebaseFirestore.instance
                                  .collection('user')
                                  .doc(user.uid)
                                  .update({
                                "ListUidMatch": FieldValue.arrayUnion(
                                    [snapshot.data.docs[index].get('uid')]),
                              });
                            }

                            // print(snapshot.data.docs[index].get('uid'));

                            debugPrint(orientation.toString());
                          },
                        ),
                      ),
                    );
                  }
                },
              );
            }
          }
        },
      ),
    );
  }
}
