import 'package:flutter/material.dart';
import 'package:flutter_app1/Login.dart';



class SignUp extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.amber,

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60,right: 20,left: 20),

              child: Center(
                child: Container(
                  height: 560,
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



                    SizedBox(height: 40),

                    Material(
                    elevation: 8,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    shadowColor: Colors.black,
                    child: SizedBox(
                      width: 350,
                      child: TextField(
                          textAlign: TextAlign.left,
                          decoration: new InputDecoration(
                              border: InputBorder.none,hintText: "Your Name", contentPadding: const EdgeInsets.all(20.0))
                      ),
                    ),
                    ),
                    SizedBox(height: 30),
                      //padding: EdgeInsets.symmetric(horizontal: 15),
                      Material(
                        elevation: 8,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        shadowColor: Colors.black,
                        child: SizedBox(
                          width: 350,
                      child: TextField(
                        obscureText: true,
                          decoration: new InputDecoration(
                              border: InputBorder.none,hintText: "Email Id", contentPadding: const EdgeInsets.all(20.0))
                      )
                      )
                      ),
                    SizedBox(height: 30),
                    //padding: EdgeInsets.symmetric(horizontal: 15),
                    Material(
                        elevation: 8,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        shadowColor: Colors.black,
                        child: SizedBox(
                            width: 350,
                            child: TextField(
                                obscureText: true,
                                decoration: new InputDecoration(
                                    border: InputBorder.none,hintText: "Password", contentPadding: const EdgeInsets.all(20.0))
                            )
                        )
                    ),
                    SizedBox(height: 30),
                    //padding: EdgeInsets.symmetric(horizontal: 15),
                    Material(
                        elevation: 8,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        shadowColor: Colors.black,
                        child: SizedBox(
                            width: 350,
                            child: TextField(
                                obscureText: true,
                                decoration: new InputDecoration(
                                    border: InputBorder.none,hintText: "Confirm Password", contentPadding: const EdgeInsets.all(20.0))
                            )
                        )
                    ),



                    SizedBox(height: 30),
                    Material(
                      elevation: 8,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      shadowColor: Colors.black,
                      color: Colors.amber,
                      child: SizedBox(
                        width: 200,
                      child: FlatButton(
                        onPressed: () {

                        },
                        child: Text(
                          'Register',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                      ),
                    ),








                  ],


                  ),





                ),
            ),



            ),


            Center(child: _toRegister())
          ],




        ),

      ),
    );
  }


  Widget _toRegister() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Already have an Account?"),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
              child: Text(
                "Login Here",
                style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}