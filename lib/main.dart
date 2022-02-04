import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app1/Contact_Us.dart';
import 'package:flutter_app1/Dashboard.dart';
import 'package:flutter_app1/Login.dart';
import 'package:flutter_app1/product_detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
        const Duration(seconds: 3),
            () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Login()),
        ));

    return Scaffold(
        body: Center(
          child: Image(
            image: AssetImage('images/applogo.png'),
            width: 200,
            height: 150,
          ),
        )
    );
  }
}
