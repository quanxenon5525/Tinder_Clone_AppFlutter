import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../network/foryou_network.dart';

class ForyouCategory extends StatelessWidget {
  const ForyouCategory({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchForyou(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              GridView.builder(
                physics: ScrollPhysics(),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute<void>(
                        builder: (BuildContext context) {
                          return Scaffold(
                            appBar: AppBar(
                              elevation: 20,
                              leading: IconButton(
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              titleTextStyle: TextStyle(color: Colors.white),
                              backgroundColor: Colors.pinkAccent,
                              title: Text(
                                snapshot.data[index].title,
                              ),
                            ),
                            body: ListView(
                              children: [],
                            ),
                          );
                        },
                      ));
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width / 0.5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          image: DecorationImage(
                              image: NetworkImage(
                                snapshot.data[index].image,
                              ),
                              fit: BoxFit.fitWidth)),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 8,
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(colors: [
                                      Colors.pinkAccent,
                                      Colors.orangeAccent
                                    ])),
                                child: Center(
                                  child: Text(
                                    snapshot.data[index].textbutton,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Expanded(
                                child: Text(
                              snapshot.data[index].title,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            )),
                            SizedBox(
                              height: 5,
                            ),
                            Expanded(
                              child: Text(
                                snapshot.data[index].subtitle,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ]),
                    ),
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
                padding: EdgeInsets.all(10),
                shrinkWrap: true,
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Container(
            child: Center(
              child: Text("Not found!!"),
            ),
          );
        } else {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
