import 'package:shared_preferences/shared_preferences.dart';



class HelperFunctions{

  /// saving data
  static Future<bool> saveUserLoggedIn(bool isUserLoggedIn) async{

    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool("ISLOGGEDIN", isUserLoggedIn);
  }


  ///get data


  static Future getUserLoggedIn() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getBool("ISLOGGEDIN");
  }


}