import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app1/Resources/AppColors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  var homeArray = [
    'Joey Tribbiani',
    'Chandler Bing',
    'Ross Geller',
    'Rachel Green',
    'Pheobe Buffe',
    'Monica Geller'
  ];

  final List<Tab> tabs = <Tab>[
    new Tab(text: "Sherwani"),
    new Tab(text: "Indo Western"),
    new Tab(text: "Tuxedo"),
    new Tab(text: "Suits"),
    new Tab(text: "Jodhpuri"),
    new Tab(text: "Kurtha Pyjama"),
    new Tab(text: "Bundi Jacket")
  ];

  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: tabs.length);
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  image: AssetImage('images/applogo.png'),
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
          Flexible(
              child: ListView(
                padding: const EdgeInsets.all(8),
                shrinkWrap: true,
                physics: ScrollPhysics(),
                children: <Widget>[
                  _topbar(),
                  _tabLayouts(),
                  _categoryWidget(),
                  _setFeaturedProduct(),
                  _banner(),
                  _setRecommendedList()
                ],
              )
          )

        ],
      ),
    );
  }

  Widget _topbar() {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Hi Jhon Doe',
                  style: TextStyle(color: Colors.black, fontSize: 18)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'What are you looking for today?',
                style: TextStyle(color: Colors.black, fontSize: 27),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 10),
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
          ),
        ],
      ),
    );
  }

  Widget _tabLayouts() {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(AppColors.homeboxGrey),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  )),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: new TabBar(
                        isScrollable: true,
                        unselectedLabelColor: Colors.grey,
                        labelColor: Colors.white,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: new BubbleTabIndicator(
                          indicatorHeight: 25.0,
                          indicatorColor: Colors.amber,
                          tabBarIndicatorSize: TabBarIndicatorSize.tab,
                          // Other flags
                          // indicatorRadius: 1,
                          // insets: EdgeInsets.all(1),
                          // padding: EdgeInsets.all(10)
                        ),
                        tabs: tabs,
                        controller: _tabController),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _categoryWidget() {
    return Container(
      margin: EdgeInsets.all(1),
      width: double.infinity,
      height:180,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: homeArray.length,
          itemBuilder: (BuildContext context, int index) {
        return Container(
          child: setHomeBanner(index),
        );
      }),
    );
  }
  Widget _banner() {
    return Container(
      margin: EdgeInsets.all(1),
      width: double.infinity,
      height:160,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: homeArray.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: setMiddleBanner(index),
            );
          }),
    );
  }

  Widget setHomeBanner(int index) {
    return Container(
      width: 326,
      height: 178,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/home_banner.png"),
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
          ),
          child: Row(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0,left: 10),
                    child: SizedBox(
                      width: 185.0,
                      child: Text(
                        "Zardozi And Thread Embroidery Imported Green Sherwani",
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 19.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Row(
                      children: [
                        Text('Shop Now',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Icon(CupertinoIcons.arrow_right,color: Colors.white,),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Image(image: AssetImage('images/sher_img.png'))
            ],
          ),
        ),
      ),

    );
  }
  Widget setMiddleBanner(int index) {
    return Container(
      width: 390,
      height: 160,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/banner1.jpg"),
              fit: BoxFit.fill,
              alignment: Alignment.center,
            ),
          ),
          /*child: Row(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0,left: 10),
                    child: SizedBox(
                      width: 185.0,
                      child: Text(
                        "Zardozi And Thread Embroidery Imported Green Sherwani",
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 19.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Row(
                      children: [
                        Text('Shop Now',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Icon(CupertinoIcons.arrow_right,color: Colors.white,),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Image(image: AssetImage('images/sher_img.png'))
            ],
          ),*/
        ),
      ),

    );
  }

  Widget _setFeaturedProduct() {
    return Container(
      child: SizedBox(
        height: 320,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 13.0,right: 13.0,top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Featured Products',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 16)),

                  Text('See All',
                      style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold,fontSize: 16)),
                ],
              ),
            ),

            Flexible(
                child:
                Padding(
                  padding: const EdgeInsets.only(left: 13.0,right: 13.0,top: 10.0),
                  child: ListView.builder(
                    // make sure to add the following lines:
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                      itemCount: homeArray.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          child: Container(
                            child: _featureListData(index),
                          ),
                        );
                      }
                    // the rest of your list view code
                  ),
                ) // ListView
            )

          ],
        ),
      ),

    );
  }

  Widget _featureListData(int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        width: 155,
        height: 248,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage('images/feature_img.png'),
              width: 155,
              height: 173,
            ),
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
                        fontSize: 13),),
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

          ],
        ),
      ),
    );
  }

  Widget _setRecommendedList() {
    return Container(
      child: SizedBox(
        height: 320,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(left: 13.0, right: 13.0, top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Recommended Products',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
                Text('See All',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
              ],
            ),
          ),

          Flexible(
              child:
              Padding(
                padding: const EdgeInsets.only(left: 13.0,right: 13.0,top: 10.0),
                child: ListView.builder(
                  // make sure to add the following lines:
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: homeArray.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: _recommendedListData(index),
                      );
                    }
                  // the rest of your list view code
                ),
              ) // ListView
          )

        ]),
      ),
    );
  }

  Widget _recommendedListData(int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        width: 155,
        height: 248,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage('images/recomended_img.png'),
              width: 155,
              height: 173,
            ),
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
                        fontSize: 13),),
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

          ],
        ),
      ),
    );
  }
}
