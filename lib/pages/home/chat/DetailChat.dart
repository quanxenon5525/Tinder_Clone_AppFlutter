import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproject/theme/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailChat extends StatefulWidget {
  DetailChat({Key key, @required this.uid, @required this.idChatRoom})
      : super(key: key);
  final String uid;
  final String idChatRoom;

  @override
  State<DetailChat> createState() => _DetailChatState();
}

class _DetailChatState extends State<DetailChat> {
  TextEditingController _value = TextEditingController();
  User user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppbar(),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('chat')
            // .where('uidSender', isEqualTo: user.uid)
            .where('idChatroom', isEqualTo: widget.idChatRoom)
            // .where('uidRevicer', isEqualTo: widget.uid)
            .orderBy('createAt', descending: false)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data.docs.length > 0) {
            return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, indexMessage) {
                if (snapshot.data.docs[indexMessage].get('uidSender') ==
                    user.uid) {
                  return Container(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue,
                      ),
                      child: Text(
                        snapshot.data.docs[indexMessage].get('content'),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                } else if (snapshot.data.docs[indexMessage].get('uidSender') ==
                    widget.uid) {
                  return Container(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey,
                      ),
                      child: Text(
                        snapshot.data.docs[indexMessage].get('content'),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  );
                }
              },
            );
          } else {
            return StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('user')
                  .where('uid', isEqualTo: widget.uid)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshotUser) {
                if (!snapshotUser.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshotUser.data.docs.length,
                    itemBuilder: (context, indexUser) {
                      return Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 70),
                            child: RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                ),
                                children: <TextSpan>[
                                  TextSpan(text: 'Bạn đã tương hợp với '),
                                  TextSpan(
                                      text: snapshotUser.data.docs[indexUser]
                                          .get('name'),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "1 tháng trước",
                            style: TextStyle(
                              color: black,
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Container(
                            width: 220,
                            height: 220,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(
                                  snapshotUser.data.docs[indexUser]['img'][0],
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 30),
                            child: RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.black,
                                ),
                                children: <TextSpan>[
                                  TextSpan(text: 'Biết khi nào '),
                                  TextSpan(
                                    text: snapshotUser.data.docs[indexUser]
                                        .get('name'),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(text: ' đã xem tin nhắn của bạn'),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            // color: Colors.blue,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            height: 30,
                            width: 230,
                            child: Container(
                              margin: EdgeInsets.only(left: 25),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.done_all,
                                  ),
                                  Text("Bật thông báo đã xem"),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
            );
          }
        },
      ),
      bottomSheet: Container(
        margin: EdgeInsets.only(bottom: 10),
        width: 370,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Color.fromARGB(255, 240, 235, 235),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: TextField(
                autocorrect: false,
                controller: _value,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 15),
                  hintText: "Nhập thông điệp",
                  hintStyle: TextStyle(
                    color: grey,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 15),
              child: InkWell(
                onTap: () async {
                  User user = FirebaseAuth.instance.currentUser;
                  await FirebaseFirestore.instance.collection('chat').add(
                    {
                      'uidSender': user.uid,
                      'content': _value.text,
                      'createAt': Timestamp.now(),
                      'idChatroom': widget.idChatRoom,
                      'uidRevicer': widget.uid,
                    },
                  );
                  _value.clear();
                },
                child: Text(
                  "Gửi",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: getNavigationBar(),
    );
  }

  AppBar getAppbar() {
    return AppBar(
      elevation: 0,
      backgroundColor: white,
      toolbarHeight: 100,
      automaticallyImplyLeading: false,
      title: StreamBuilder(
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
          return Row(
            children: List.generate(
              snapshot.data.docs.length,
              (index) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.chevron_left,
                            color: grey,
                          ),
                          iconSize: 40,
                        ),
                        SizedBox(
                          width: 90,
                        ),
                        Column(
                          children: [
                            Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(
                                    snapshot.data.docs[index]['img'][0],
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 70,
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.videocam,
                                color: Colors.blue,
                              ),
                              iconSize: 30,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.shield,
                                color: Colors.blue,
                              ),
                              iconSize: 25,
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Center(
                      child: Text(
                        snapshot.data.docs[index].get('name'),
                        style: TextStyle(color: black, fontSize: 13),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget getNavigationBar() {
    return Row(
      children: [],
    );
  }
}
