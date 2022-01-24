import 'package:flutter/material.dart';
import 'package:flutter_app1/SignUp.dart';
import 'package:flutter_app1/HomeBase.dart';


class Login extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<Login> {
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
                    height: 520,
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
                    SizedBox(height: 30),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                        children: <Widget> [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 3,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'images/fb_ico_png.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 3,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'images/google_ico.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 3,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'images/apple_ico.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),


                          // Material(
                          //   borderRadius: BorderRadius.all(Radius.circular(20)),
                          //   shadowColor: Colors.black,
                          //   child: SizedBox(
                          //     width: 50,
                          //     child: Container(
                          //         width: 50,
                          //         height: 50,
                          //         child: new Image.asset('images/apple.png')),
                          //
                          //   ),
                          // ),
                        ]
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
                              border: InputBorder.none,hintText: "Enter valid email id", contentPadding: const EdgeInsets.all(20.0))
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
                              border: InputBorder.none,hintText: "Password", contentPadding: const EdgeInsets.all(20.0))
                      )
                      )
                      ),

                    Forget(),


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
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomeBase()),
                          );
                        },
                        child: Text(
                          'Login',
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
  Widget Forget() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: Text(
              'Forgot Password?',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.amber,
                fontSize: 16
            ),
          ),
          )],
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
            Text("Don't have an Account?"),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUp()),
                );
              },
              child: Text(
                "Sign Up Here",
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