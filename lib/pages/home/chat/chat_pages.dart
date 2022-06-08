import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproject/data/chats_json.dart';
import 'package:finalproject/pages/DetailChat.dart';
import 'package:finalproject/theme/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  User user = FirebaseAuth.instance.currentUser;

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: white,
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('match')
            .where('ListUidMatch', arrayContains: user.uid)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Messages",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: primary),
                    ),
                    Container(
                      height: 25,
                      width: 1,
                      decoration: BoxDecoration(color: black.withOpacity(0.15)),
                    ),
                    Text(
                      "Matches",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: black.withOpacity(0.5)),
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
                padding: const EdgeInsets.only(left: 8, top: 0, right: 8),
                child: Container(
                  height: 38,
                  decoration: BoxDecoration(
                      color: grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(5)),
                  child: TextField(
                    cursorColor: black.withOpacity(0.5),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search,
                          color: black.withOpacity(0.5),
                        ),
                        hintText: "Search 0 Matches"),
                  ),
                ),
              ),
              Divider(
                thickness: 0.8,
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "Tương hợp mới",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: primary),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 200),
                          child: Row(
                            children: List.generate(
                              snapshot.data.docs.length,
                              (index) {
                                return StreamBuilder(
                                  stream: FirebaseFirestore.instance
                                      .collection('match')
                                      .where(
                                        'ListUidMatch',
                                        arrayContains: snapshot.data.docs[index]
                                            .get('uid'),
                                      )
                                      .snapshots(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<QuerySnapshot> snapshot2) {
                                    if (!snapshot2.hasData) {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                    // int sum = snapshot2.data.docs.length + 1;
                                    if (snapshot2.data.docs.length == 1) {
                                      return Row(
                                        children: List.generate(
                                          snapshot2.data.docs.length,
                                          (index2) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                right: 10,
                                              ),
                                              child: Column(
                                                children: <Widget>[
                                                  Container(
                                                    width: 70,
                                                    height: 70,
                                                    child: Stack(
                                                      children: <Widget>[
                                                        GestureDetector(
                                                          onTap: () {
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        DetailChat(
                                                                  uid: snapshot
                                                                      .data
                                                                      .docs[
                                                                          index]
                                                                      .get(
                                                                          'uid'),
                                                                  idChatRoom:
                                                                      "\$#@!#!@#!@#@!#!@!@%",
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          child: Container(
                                                            width: 65,
                                                            height: 65,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              image:
                                                                  DecorationImage(
                                                                image:
                                                                    NetworkImage(
                                                                  snapshot
                                                                      .data
                                                                      .docs[
                                                                          index]
                                                                      .get(
                                                                          'imgUid'),
                                                                ),
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  SizedBox(
                                                    width: 70,
                                                    child: Align(
                                                      child: Text(
                                                        snapshot
                                                            .data.docs[index]
                                                            .get('name'),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 30,
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    }

                                    return Text("");
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
