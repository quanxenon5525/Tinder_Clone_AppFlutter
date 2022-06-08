import 'package:finalproject/pages/home/user/shield/widget/confirming_tools.dart';
import 'package:finalproject/pages/home/user/shield/widget/disconnect_tools.dart';
import 'package:finalproject/pages/home/user/shield/widget/private_tools.dart';
import 'package:finalproject/pages/home/user/shield/widget/report_tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ToolsScreen extends StatefulWidget {
  const ToolsScreen({Key key}) : super(key: key);

  @override
  State<ToolsScreen> createState() => _ToolsScreenState();
}

class _ToolsScreenState extends State<ToolsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReportMethod(),
    );
  }

  ListView ReportMethod() {
    return ListView(
      children: [
        Baocao(),
        SizedBox(
          height: 20,
        ),
        Private(),
        SizedBox(
          height: 20,
        ),
        Disconect(),
        SizedBox(
          height: 20,
        ),
        Conf_tools(),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
