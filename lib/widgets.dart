import 'package:flutter/material.dart';
import '../sizes.dart';
import 'Resources/AppColors.dart';



showLoaderDialog(BuildContext context){
  AlertDialog alert= AlertDialog(
    shape: CircleBorder(),
    content:
    Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularProgressIndicator(
          color: Color(AppColors.commonOrange),
        ),
      ],
    ),

  );
  showDialog(
    barrierDismissible: false,
    context:context,
    builder:(BuildContext context){
      return alert;
    },
  );
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

showAlertDialog1(
    BuildContext context,  String title, String content, ) {

  Widget cancelButton = TextButton(
    child: Text("Cancel",
      style: TextStyle(color: Theme.of(context).primaryColor),
    ),
    onPressed:  () {
      Navigator.of(context).pop();
    },
  );


  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(content),
    actions: [
      cancelButton,
    ],
  );


  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}