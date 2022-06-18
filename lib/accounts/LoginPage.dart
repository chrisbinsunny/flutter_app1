import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../HomeBase.dart';
import '../Resources/AppColors.dart';
import '../accounts/RegisterPage.dart';
import '../backend/backend_data.dart';
import '../sizes.dart';
import '../widgets.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailId = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth(context),
          height: screenHeight(context),
          padding: EdgeInsets.only(
            top: screenHeight(context, mulBy: 0.03)
          ),
          color: AppColors.commonOrange,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _loginComponents(),
              _toRegister()
            ],
          ),
        ),
      ),
    );
  }

  Widget _toRegister() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an Account?"),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RegisterPage()),
            );
          },
          child: Text(
            "Sign Up Here",
            style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        )
      ],
    );
  }

  Widget _loginComponents() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: screenHeight(context, mulBy: 0.03),
          horizontal: screenWidth(context, mulBy: 0.08)
      ),
      width: screenWidth(context, mulBy: 0.9),
      height: screenHeight(context, mulBy: 0.75),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 8,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('images/app_logo.png'),

          _socialMedia(),

          Column(
            children: [
              Material(
                shadowColor: Colors.black,
                elevation: 8,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: TextField(
                controller: emailId,
                  decoration: InputDecoration(
                    hintText: 'Enter Email Address',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    // ),
                    // enabledBorder: OutlineInputBorder(
                    //   borderSide: BorderSide(
                    //       color: Color(AppColors.grey), width: 1.0),
                    //   borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    // ),
                    // focusedBorder: OutlineInputBorder(
                    //   borderSide: BorderSide(
                    //       color: AppColors.commonOrange, width: 2.0),
                    //   borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    // ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight(context, mulBy: 0.015)),
              Material(
                shadowColor: Colors.black,
                elevation: 8,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: TextField(
                    controller: password,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Password',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                    ),

                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    obscuringCharacter: '*'),
              ),
              SizedBox(height: screenHeight(context, mulBy: 0.04)),
              ConstrainedBox(
                constraints:
                BoxConstraints.tightFor(width: screenWidth(context), height: screenHeight(context, mulBy: 0.07)),
                child: ElevatedButton(
                  style: ButtonStyle(
                      shape:
                      MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          )),
                      backgroundColor: MaterialStateProperty.all(
                          AppColors.commonOrange)),
                  onPressed: () async{
                    if(emailId.text.isValidEmail()) {
                      showLoaderDialog(context);
                      login(emailId.text, password.text).then((value)
                      {
                        if(value==200) {
                          Navigator.pop(context);
                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                          HomeBase()), (Route<dynamic> route) => false);
                        }
                        else {
                          if(value==401) {
                            Navigator.pop(context);
                            showAlertDialog1(context, "Invalid Credentials", "Please check the data you entered. Or Register Now.");
                          }
                          else{
                            Navigator.pop(context);
                            showAlertDialog1(context, "Error Occurred", "Some error occurred. Please try again.");
                          }
                        }
                      }
                      );

                    }
                    else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please check your email."),
                        ),
                      );
                    }
                  },
                  child: Text("Login"),
                ),
              ),
            ],
          ),
          _orBox(),
        ],
      ),
    );
  }

  Widget _orBox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'Forgot Password?',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.commonOrange),
        ),
      ],
    );
  }

  Widget _socialMedia() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
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
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(
            'images/fb_ico_png.png',
            fit: BoxFit.cover,
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
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(
            'images/google_ico.png',
            fit: BoxFit.cover,
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
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(
            'images/apple_ico.png',
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
