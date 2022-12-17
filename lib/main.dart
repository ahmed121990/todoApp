import 'package:flutter/material.dart';
import 'package:todoapp/Home/home_screen.dart';
import 'package:todoapp/theme.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    routes: {
      HomeScreen.routeName : (_) => HomeScreen()
    },
      initialRoute: HomeScreen.routeName ,
      theme: Mytheme.lightTheme ,
    );
  }
}