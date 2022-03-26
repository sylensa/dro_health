import 'package:dro_health/helper/helper.dart';
import 'package:dro_health/screens/community/index.dart';
import 'package:dro_health/screens/doctors/index.dart';
import 'package:dro_health/screens/home/index.dart';
import 'package:dro_health/screens/pharmacy/index.dart';
import 'package:dro_health/screens/profile/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';




class Index extends StatefulWidget {
  int initialIndex = 0;
  int orderIndex = 0;
  Index({this.initialIndex = 0});
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      initialIndex: widget.initialIndex,
      length: 5,
      child: Scaffold(
        bottomNavigationBar: TabBar(
          labelColor:  dPurple ,
          unselectedLabelColor: Colors.red,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorPadding: EdgeInsets.all(5.0),
          indicatorColor: Colors.white,
          labelPadding: appPadding(0),
          padding: bottomPadding(20),
          tabs: [
             Tab(
              icon:Image.asset("assets/images/Home.png"),

            ),
             Tab(
                 icon:Image.asset("assets/images/Doctors.png",width: 50,height: 50,)
             ),

             Tab(
                 icon:Image.asset("assets/images/Pharmacy.png",width: 50,height: 50,)
            ),
             Tab(
                 icon:Image.asset("assets/images/Community.png",width: 50,height: 50,)

            ),
            Tab(
                icon:Image.asset("assets/images/Profile.png",width: 50,height: 50,)

            ),
          ],
        ),
        body:  TabBarView(
          children: [
            Home(),
            DoctorsPage(),
            PharmacyPage(),
            CommunityPage(),
            ProfilePage(),
          ],
        ),


      ),
    );
  }
}

