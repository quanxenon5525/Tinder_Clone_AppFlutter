import 'dart:io';

import 'package:finalproject/theme/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
import 'package:cloud_firestore/cloud_firestore.dart';

class AddImage extends StatefulWidget {
  const AddImage({Key key}) : super(key: key);

  @override
  State<AddImage> createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  bool uploading = false;
  double val = 0;
  CollectionReference imgRef;
  firebase_storage.Reference ref;
  User user = FirebaseAuth.instance.currentUser;

  List<File> _image = [];
  ImagePicker picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: white,
          iconTheme: IconThemeData(
            color: black,
          ),
          title: Text(
            'Thêm ảnh',
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            FlatButton(
                onPressed: () {
                  setState(() {
                    uploading = true;
                  });
                  uploadFile().whenComplete(() => Navigator.of(context).pop());
                },
                child: Text(
                  'Tải lên',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ))
          ],
        ),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(4),
              child: GridView.builder(
                  itemCount: _image.length + 1,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return index == 0
                        ? Center(
                            child: Container(
                              height: 100,
                              width: 100,
                              color: Color.fromARGB(255, 255, 25, 75),

                              // decoration: BoxDecoration(
                              //     border: Border.all(
                              //         color: Color.fromARGB(255, 255, 25, 75))),
                              child: IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () =>
                                      !uploading ? chooseImage() : null),
                            ),
                          )
                        : Container(
                            margin: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: FileImage(_image[index - 1]),
                                    fit: BoxFit.cover)),
                          );
                  }),
            ),
            uploading
                ? Center(
                    child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        child: Text(
                          'uploading...',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CircularProgressIndicator(
                        value: val,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                      )
                    ],
                  ))
                : Container(),
          ],
        ));
  }

  chooseImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image.add(File(pickedFile?.path));
    });
    if (pickedFile.path == null) retrieveLostData();
  }

  Future<void> retrieveLostData() async {
    final LostData response = await picker.getLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      setState(() {
        _image.add(File(response.file.path));
      });
    } else {
      print(response.file);
    }
  }

  Future uploadFile() async {
    int i = 1;

    for (var img in _image) {
      setState(() {
        val = i / _image.length;
      });
      ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('image_user/${Path.basename(img.path)}');
      await ref.putFile(img).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          FirebaseFirestore.instance.collection('user').doc(user.uid).update({
            "img": FieldValue.arrayUnion([value])
          });
          i++;
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }
}
