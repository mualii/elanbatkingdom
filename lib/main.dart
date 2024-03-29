import 'package:elanbatkingdom/homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(
        411.42857142857144,
        820.5714285714286,
      ),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'الانباط',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(body: HomePage()),
      ),
    );
  }
}
