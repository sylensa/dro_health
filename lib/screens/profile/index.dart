import 'package:dro_health/helper/helper.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: sText("PROFILE",color: Colors.black,weight: FontWeight.bold),
      ),
    );
  }
}
