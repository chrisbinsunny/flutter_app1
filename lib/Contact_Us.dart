import 'package:flutter/material.dart';
import 'package:flutter_app1/HomeBase.dart';


class Contact_Us extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<Contact_Us> {
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
                        child: Text('Contact Us',
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
                        child: Text('Contact for Orders?',
                            style: TextStyle(color: Colors.black, fontSize: 16)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 10,right: 30),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Have a question about the order you placed? Please check your email and if you do not find the answer please write us at contact@poshrobe.com or call or whatsapp us at 813-699-6669',
                            style: TextStyle(color: Colors.grey, fontSize: 12)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Contact for Payments?',
                            style: TextStyle(color: Colors.black, fontSize: 16)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 10,right: 30),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Have a question for PoshRobe Support with respect to payment?  contact us at contact@poshrobe.com or call or whatsapp us at 813-699-6669',
                            style: TextStyle(color: Colors.grey, fontSize: 12)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Our Address',
                            style: TextStyle(color: Colors.black, fontSize: 16)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 10,right: 30),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('10th Floor, RMZ Latitude Commercial Building, Bellary Road, Hebbal, Bangalore, 560024.'
                            'Third floor, Kadooli tower, Nadakkavu West, Vandipetta, Calicut, 673011.',
                            style: TextStyle(color: Colors.grey, fontSize: 12)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Drop us a Line',
                            style: TextStyle(color: Colors.black, fontSize: 20)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30,right: 60),
                      child: Divider(
                        color: Colors.black,thickness: 2,
                      ),
                    ),

                    SizedBox(height: 20),

                    Material(
                      elevation: 8,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      shadowColor: Colors.black,
                      child: SizedBox(
                        width: 330,
                        child: TextField(
                            textAlign: TextAlign.left,
                            decoration: new InputDecoration(
                                border: InputBorder.none,hintText: "Your Name", contentPadding: const EdgeInsets.all(20.0))
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                     Material(
                      elevation: 8,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      shadowColor: Colors.black,
                      child: SizedBox(
                        width: 330,
                        child: TextField(
                            textAlign: TextAlign.left,
                            decoration: new InputDecoration(
                                border: InputBorder.none,hintText: "Your Email", contentPadding: const EdgeInsets.all(20.0))
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                     Material(
                      elevation: 8,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      shadowColor: Colors.black,
                      child: SizedBox(
                        width: 330,
                        child: TextField(
                            textAlign: TextAlign.left,
                            decoration: new InputDecoration(
                                border: InputBorder.none,hintText: "Your Phone", contentPadding: const EdgeInsets.all(20.0))
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Material(
                      elevation: 8,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      shadowColor: Colors.black,
                      child: SizedBox(
                        width: 330,
                        height: 150,
                        child: TextField(
                            textAlign: TextAlign.left,
                            decoration: new InputDecoration(
                                border: InputBorder.none,hintText: "Your Message", contentPadding: const EdgeInsets.all(20.0))
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                Padding(
                  padding:
                  const EdgeInsets.only(left: 30.0, right: 30.0, top: 15,bottom: 20),
                    child: Material(
                      elevation: 8,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      shadowColor: Colors.black,
                      color: Colors.amber,
                      child: SizedBox(
                        width: 200,
                        child: FlatButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomeBase()),
                            );
                          },
                          child: Text(
                            'Submit',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ),
                      ),
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