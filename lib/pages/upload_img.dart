import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproject/pages/addImage.dart';
import 'package:finalproject/pages/root_app.dart';
import 'package:finalproject/theme/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:transparent_image/transparent_image.dart';

class UploadImage_Page extends StatefulWidget {
  const UploadImage_Page({Key key}) : super(key: key);
  @override
  State<UploadImage_Page> createState() => _UploadImage_PageState();
}

class _UploadImage_PageState extends State<UploadImage_Page> {
  bool tmp = false;

  User user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        iconTheme: IconThemeData(
          color: black,
        ),
        title: Center(
          child: Text(
            'Thêm Ảnh',
            style: TextStyle(color: black, fontSize: 24),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: CircleAvatar(
          radius: 30,
          backgroundColor: Color.fromARGB(255, 255, 25, 75),
          child: Icon(
            Icons.add,
            color: white,
          ),
        ),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddImage()));
        },
      ),
      bottomNavigationBar: getContinute(),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('user')
            .where('uid', isEqualTo: user.uid)
            .snapshots(),
        builder: (context, snapshot) {
          // Get docs from collection reference

          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container(
              padding: EdgeInsets.all(4),
              child: GridView.builder(
                itemCount: snapshot.data.docs[0].get("img").length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  // List<dynamic> imglists =
                  //     snapshot.data.docs[0].get('img');
                  // int check = snapshot.data.docs[0].get('img').length;
                  // if (snapshot.data.docs[0].get("img").length > 1) {
                  //   FirebaseFirestore.instance
                  //       .collection('user')
                  //       .doc(user.uid)
                  //       .update({
                  //     "img": FieldValue.arrayRemove(
                  //         ['https://www.w3schools.com/w3images/avatar2.png'])
                  //   });
                  // }
                  FirebaseFirestore.instance
                      .collection('match')
                      .doc(user.uid)
                      .update({
                    "imgUid": snapshot.data.docs[0].get('img')[0],
                  });
                  return Container(
                    // color: Color.fromARGB(255, 255, 25, 75),
                    // decoration: BoxDecoration(
                    //   border: Border.all(
                    //     color: Color.fromARGB(255, 255, 25, 75),
                    //     width: 2,
                    //   ),
                    //   borderRadius: BorderRadius.circular(5),
                    // ),

                    child: Stack(
                      children: <Widget>[
                        Center(
                          child: FadeInImage.memoryNetwork(
                            fit: BoxFit.cover,
                            placeholder: kTransparentImage,
                            image: snapshot.data.docs[0].get('img')[index],
                            imageCacheHeight: 200,
                            imageCacheWidth: 160,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.blue,
                            ),
                            onPressed: () {
                              FirebaseFirestore.instance
                                  .collection('user')
                                  .doc(user.uid)
                                  .update({
                                "img": FieldValue.arrayRemove([
                                  snapshot.data.docs[0]
                                      .get('img')[index]
                                      .toString()
                                ])
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  );

                  // print(i);
                },
              ),
            );
          }
        },
      ),
    );
  }

  Widget getContinute() {
    return InkWell(
      borderRadius: BorderRadius.circular(60),
      onTap: (() {
        // if (_formKey.currentState!.validate()) {

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RootApp()),
        );
        // } else {
        //   return;
        // }
      }),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 25, 75),
        ),
        height: 60,
        child: Center(
          child: Text(
            "Tiếp tục",
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  // AppBar getAppbar() {
  //   return AppBar(
  //     elevation: 0,
  //     backgroundColor: white,
  //     iconTheme: IconThemeData(
  //       color: black,
  //     ),
  //     title: Text('Home Page'),
  //   );
  // }

//   Widget getBody() {
//     return StreamBuilder(
//       stream: FirebaseFirestore.instance.collection('user').snapshots(),
//       builder: (context, snapshot) {
//         return !snapshot.hasData
//             ? Center(
//                 child: CircularProgressIndicator(),
//               )
//             : Container(
//                 padding: EdgeInsets.all(4),
//                 child: GridView.builder(
//                     itemCount: snapshot.data.docs.length,
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 3),
//                     itemBuilder: (context, index) {
//                       return Container(
//                         margin: EdgeInsets.all(3),
//                         child: FadeInImage.memoryNetwork(
//                             fit: BoxFit.cover,
//                             placeholder: kTransparentImage,
//                             image: snapshot.data.docs[index].get('img')),
//                       );
//                     }),
//               );
//       },
//     );
//   }
// }

}
