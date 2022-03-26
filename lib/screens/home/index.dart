import 'package:dro_health/helper/helper.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: sText("HOME",color: Colors.black,weight: FontWeight.bold),
      ),
    );
  }
}
