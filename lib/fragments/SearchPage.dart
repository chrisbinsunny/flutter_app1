
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/Resources/AppColors.dart';

class SearchPage extends StatefulWidget{
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            _topBar(),
            _searchBar(),
            Expanded(child: _gridView())
          ],
        ),
      ),
    );
  }

  Widget _topBar() {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Image(
                    image: AssetImage('images/hamburger_ico.png'),

                  ),
                ),
                Image(
                  image: AssetImage('images/app_logo.png'),
                  width: 120,
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Image(image: AssetImage('images/avatar_ico.png')),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _searchBar(){
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20),
      child: TextField(
        onChanged: (value) {
          //Do something with the user input.
        },
        decoration: InputDecoration(
          hintText: 'Search Items',
          contentPadding:
          EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: Color(AppColors.grey), width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: Color(AppColors.grey), width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
        ),
      ),
    );
  }
}

Widget _gridView(){
  return Container(
      height: 800,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (_, index) => _recommendedListData(),
        itemCount: 4,
      ),
    );
  
}

Widget _recommendedListData() {

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: 155,
      height: 248,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: [
          Expanded(
            child: Image.asset('images/recomended_img.png'),
          ),
          // Image(
          //   image: AssetImage('images/recomended_img.png'),
          //   fit: BoxFit.cover,
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              children: [
                Text('Rs 2,999',style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Text('/ Rental',style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13),),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 3.0),
            child: Row(
              children: [
                Text('Rs 28,999',style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Text('/ Sale',style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: SizedBox(
              width: 185.0,
              child: Text(
                "Embroidered Pista Green Sherwani",
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                style: TextStyle(color: Colors.black87, fontSize: 12.0),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: SizedBox(
              width: 185.0,
              child: Text(
                "Embroidered Pista Green Sherwani",
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                style: TextStyle(color: Colors.black87, fontSize: 12.0),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
