import 'package:dro_health/helper/helper.dart';
import 'package:flutter/material.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: sText("COMMUNITY",color: Colors.black,weight: FontWeight.bold),
      ),
    );
  }
}
