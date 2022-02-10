import 'package:flutter/material.dart';
import '../HomeBase.dart';
import '../accounts/LoginPage.dart';
import '../fragments/HomePage.dart';
import 'package:flutter/services.dart';
import '../shared_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  bool? userLoggedIn= await HelperFunctions.getUserLoggedIn();
  runApp(
      MaterialApp(
        title: 'PoshRobe',
        home: (userLoggedIn??false)? HomeBase(): LoginPage(),
      ));
}