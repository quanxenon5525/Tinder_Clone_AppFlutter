import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproject/pages/home/chat/chat_pages.dart';
import 'package:finalproject/pages/home/explore_page.dart';
import 'package:finalproject/pages/home/like_pages.dart';
import 'package:finalproject/pages/home/user/user_pages.dart';
import 'package:finalproject/theme/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../category/category_home.dart';

class RootApp extends StatefulWidget {
  const RootApp({key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  User user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      bottomNavigationBar: getBottom(),
      appBar: getAppBar(),
      body: getBody(),
    );
  }

  Widget getBottom() {
    var items = [
      pageIndex == 0
          ? "assets/images/explore_active_icon.svg"
          : "assets/images/explore_icon.svg",
      pageIndex == 1
          ? "assets/images/iconsearchactive.svg"
          : "assets/images/dashboard.svg",
      pageIndex == 2
          ? "assets/images/likes_active_icon.svg"
          : "assets/images/likes_icon.svg",
      pageIndex == 3
          ? "assets/images/chat_active_icon.svg"
          : "assets/images/chat_icon.svg",
      pageIndex == 4
          ? "assets/images/account_active_icon.svg"
          : "assets/images/account_icon.svg",
    ];

    return Container(
      height: 80,
      child: Padding(
        padding: const EdgeInsets.only(left: 50, right: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(items.length, (index) {
            return IconButton(
              onPressed: () {
                setState(() {
                  pageIndex = index;
                });
              },
              icon: SvgPicture.asset(items[index]),
            );
          }),
        ),
      ),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: [
        ExplorePage(),
        DiscoveryScreen(),
        LikePage(),
        ChatPage(),
        UserPage(),
      ],
    );
  }

  AppBar getAppBar() {
    return AppBar(
      backgroundColor: white,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Container(
        child: Center(
          child: IconButton(
            onPressed: () {},
            icon: Image.asset(
              "assets/images/logo.png",
            ),
            iconSize: 150,
          ),
        ),
      ),
    );
  }
}
