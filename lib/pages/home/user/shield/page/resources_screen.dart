import 'package:flutter/material.dart';

class ResourcesScreen extends StatefulWidget {
  const ResourcesScreen({Key key}) : super(key: key);

  @override
  State<ResourcesScreen> createState() => _ResourcesScreenState();
}

class _ResourcesScreenState extends State<ResourcesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 22),
        child: Column(
          children: [
            Text(
              "Nguồn tham khảo",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: FlatButton(
                onPressed: () {},
                color: Colors.black,
                child: Text(
                  "Truy cập trang web",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
