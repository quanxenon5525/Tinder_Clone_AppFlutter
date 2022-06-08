import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproject/data/account_json.dart';
import 'package:finalproject/pages/login.dart';
import 'package:finalproject/theme/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class UserPage extends StatefulWidget {
  const UserPage({key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  User user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: grey.withOpacity(0.2),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('user')
            .where('uid', isEqualTo: user.uid)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          for (var index = 0; index < snapshot.data.docs.length; index++) {
            return ClipPath(
              clipper: OvalBottomBorderClipper(),
              child: Container(
                width: size.width,
                height: size.height * 0.60,
                decoration: BoxDecoration(color: white, boxShadow: [
                  BoxShadow(
                    color: grey.withOpacity(0.1),
                    spreadRadius: 10,
                    blurRadius: 10,
                    // changes position of shadow
                  ),
                ]),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 30, right: 30, bottom: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(
                                    snapshot.data.docs[index]['img'][0]),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        snapshot.data.docs[index]['name'],
                        // snapshot.data.docs[index]['birthday'],
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: grey.withOpacity(0.1),
                                        spreadRadius: 10,
                                        blurRadius: 15,
                                        // changes position of shadow
                                      ),
                                    ]),
                                child: Icon(
                                  Icons.settings,
                                  size: 35,
                                  color: grey.withOpacity(0.5),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "SETTINGS",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: grey.withOpacity(0.8)),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Column(
                              children: [
                                Container(
                                  width: 85,
                                  height: 85,
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: 80,
                                        height: 80,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            gradient: LinearGradient(
                                              colors: [
                                                primary_one,
                                                primary_two
                                              ],
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: grey.withOpacity(0.1),
                                                spreadRadius: 10,
                                                blurRadius: 15,
                                                // changes position of shadow
                                              ),
                                            ]),
                                        child: Icon(
                                          Icons.camera_alt,
                                          size: 45,
                                          color: white,
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 8,
                                        right: 0,
                                        child: Container(
                                          width: 25,
                                          height: 25,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: grey.withOpacity(0.1),
                                                  spreadRadius: 10,
                                                  blurRadius: 15,
                                                  // changes position of shadow
                                                ),
                                              ]),
                                          child: Center(
                                            child:
                                                Icon(Icons.add, color: primary),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "ADD MEDIA",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: grey.withOpacity(0.8)),
                                )
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: grey.withOpacity(0.1),
                                        spreadRadius: 10,
                                        blurRadius: 15,
                                        // changes position of shadow
                                      ),
                                    ]),
                                child: Icon(
                                  Icons.edit,
                                  size: 35,
                                  color: grey.withOpacity(0.5),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "EDIT INFO",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: grey.withOpacity(0.8)),
                              )
                            ],
                          )
                        ],
                      ),
                      Expanded(
                          child: TextButton(
                              onPressed: () {
                                FirebaseAuth.instance.currentUser.delete();
                                Navigator.pop(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginPage(),
                                  ),
                                );
                              },
                              child: Text(
                                'SIGN OUT',
                                style: TextStyle(color: Colors.pinkAccent),
                              ))),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
