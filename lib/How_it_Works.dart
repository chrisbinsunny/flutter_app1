import 'package:flutter/material.dart';
import 'package:flutter_app1/SignUp.dart';
import 'package:flutter_app1/HomeBase.dart';


class How_it_Works extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<How_it_Works> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.amber,

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60,right: 20,left: 20,bottom: 20),

              child: SingleChildScrollView(
                child: Container(
                    decoration: BoxDecoration(
                      color : Colors.white,
                        boxShadow: [BoxShadow(
                          color: Colors.black87,
                          blurRadius: 10,
                        ),],
                      borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    padding: const EdgeInsets.only(top: 30),
                  child: Column(
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Center(
                        child: Container(
                            width: 150,
                            height: 50,
                            child: new Image.asset('images/applogo.png')),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('How it Works',
                            style: TextStyle(color: Colors.black, fontSize: 20)),
                      ),
                    ),
                Padding(
                  padding: const EdgeInsets.only(left: 30,right: 60),
                   child: Divider(
                        color: Colors.black,thickness: 2,
                    ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 10,right: 30),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('New to renting? You’ve come to the right place. Here you’ll find everything you need to know about how renting your clothes.',
                            style: TextStyle(color: Colors.grey, fontSize: 14)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Choose Your Items.',
                            style: TextStyle(color: Colors.black, fontSize: 16)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 10,right: 30),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Browse through the products and choose your item, event date, quantity. All the items will arrive dry cleaned and ready to wear in our reusable garment bag.',
                            style: TextStyle(color: Colors.grey, fontSize: 14)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Own The Moment',
                            style: TextStyle(color: Colors.black, fontSize: 16)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 10,right: 30),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Style and Wear your item on your special day.',
                            style: TextStyle(color: Colors.grey, fontSize: 14)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Return',
                            style: TextStyle(color: Colors.black, fontSize: 16)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 10,right: 30,bottom: 30),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Dont worry about dry cleaning, we will take care it for you. Return the item in the same bag you received. ',
                            style: TextStyle(color: Colors.grey, fontSize: 14)),
                      ),
                    ),
                  ],
                  ),
                ),
            ),
            ),
          ],
        ),
      ),
    );
  }

}