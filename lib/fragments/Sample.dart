
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/Resources/AppColors.dart';


class Sample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final myImageAndCaption = [
      ["images/recomended_img.png", "caption1"],
      ["images/recomended_img.png", "caption1"],
      ["images/recomended_img.png", "caption1"],
      ["images/recomended_img.png", "caption1"],
      ["images/recomended_img.png", "caption1"],
      ["images/recomended_img.png", "caption1"],
      ["images/recomended_img.png", "caption1"],
      ["images/recomended_img.png", "caption1"],
      ["images/recomended_img.png", "caption1"],
      ["images/recomended_img.png", "caption1"],

    ];
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: GridView.count(
          crossAxisCount: 2,
          children: [
            ...myImageAndCaption.map(
                  (i) => Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Material(
                    shape: CircleBorder(),
                    elevation: 3.0,
                    child: Image.asset(
                      i.first,
                      fit: BoxFit.fitWidth,
                      height: 100,
                      width: 100,
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(i.last),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}