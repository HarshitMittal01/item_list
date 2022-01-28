import 'package:flutter/material.dart';
import 'package:dsc/screens/login_page.dart';
import 'package:dsc/screens/home_page.dart';
import 'package:dsc/screens/add_item.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      //home: AddItem(),
      //home: HomePage(),
      home: LoginPage(),
    );
  }
}


