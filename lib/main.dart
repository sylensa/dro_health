
import 'package:dro_health/helper/helper.dart';
import 'package:dro_health/screens/index.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); //Ensure plugin services are initialized
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  void initState() {
    // check();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light().copyWith(secondary: dPurple),
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Color(0xFFF4F4F4),
        hintColor: Color(0xFFcdcdcd),
        secondaryHeaderColor: Color(0xFFE0E4E8),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFFF4F4F4),
          brightness: Brightness.dark,
          iconTheme: IconThemeData(
            color: dPurple,
          ),
        ),
        bottomSheetTheme: BottomSheetThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            backgroundColor: Colors.white),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: solonGray500,
          selectionColor: solonGray200,
          selectionHandleColor: dPurple,
        ),
      ),
      home: Index(initialIndex: 2,) ,
    );
  }
}
