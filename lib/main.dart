import 'package:flutter/material.dart';
import 'package:this_is_king/pg/test.dart';
import 'package:this_is_king/pg/test2.dart';
import './pg/homepage.dart';
import './pg/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: new MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Generated App',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: const Color(0xFF2196f3),
          accentColor: const Color(0xFF2196f3),
          canvasColor: const Color(0xFFfafafa),
        ),
        home: ConvexAppExample(),
      ),
    );
  }
}
