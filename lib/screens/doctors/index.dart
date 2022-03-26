import 'package:dro_health/helper/helper.dart';
import 'package:flutter/material.dart';

class DoctorsPage extends StatefulWidget {
  const DoctorsPage({Key? key}) : super(key: key);

  @override
  _DoctorsPageState createState() => _DoctorsPageState();
}

class _DoctorsPageState extends State<DoctorsPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: sText("DOCTOR",color: Colors.black,weight: FontWeight.bold),
      ),
    );
  }
}
