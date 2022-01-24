import 'package:flutter/material.dart';
import 'package:flutter_app1/SignUp.dart';
import 'package:flutter_app1/HomeBase.dart';


class About_Us extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<About_Us> {
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
                        child: Text('About-Us',
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
                      padding: const EdgeInsets.only(left: 30, top: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Company Overview',
                            style: TextStyle(color: Colors.black, fontSize: 16)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 10,right: 30),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('We aim to Create Moments and Earn Lifetime Memories to the life of everybody with our high-quality products and innovative services. ',
                            style: TextStyle(color: Colors.grey, fontSize: 14)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('What We Do',
                            style: TextStyle(color: Colors.black, fontSize: 16)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 10,right: 30),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Democratize the Luxury wear - Create economic opportunity for everyone in the globe to access Luxury wears. ',
                            style: TextStyle(color: Colors.grey, fontSize: 14)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 15,right: 30),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Create Moments and Earn Lifetime Memory for many people - We make you feel best on your special days with our luxury products for your price. ',
                            style: TextStyle(color: Colors.grey, fontSize: 14)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 15,right: 30),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('We bring the cultural lineage relevant to this modern life.',
                            style: TextStyle(color: Colors.grey, fontSize: 14)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 15,right: 30,bottom: 30),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Spreading the power of re-usability and bringing sustainability to earth.',
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