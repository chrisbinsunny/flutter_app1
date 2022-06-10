import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app1/product_detail.dart';
import 'package:flutter_app1/widgets.dart';
import '../Resources/AppColors.dart';
import '../accounts/LoginPage.dart';
import '../backend/backend_class.dart';
import '../backend/backend_data.dart';
import '../shared_pref.dart';

import '../sizes.dart';

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

  List<Tab> tabs = [];
  List<Header> headers = [];
  List<Product> featuredProducts = [];
  List<Product> recommendedProducts = [];
  late TabController tabController;
  ScrollController scrollController = ScrollController();

  late Future _future;
  String selectedCategory = "475";

  Future _getHomeContents() async {
    try {
      await Future.wait([
        getHeaderCategories().then((value) {
          value.forEach((element) {
            tabs.add(Tab(
              text: element.name,
            ));
            headers.add(element);
          });
          tabController = TabController(length: tabs.length, vsync: this);
        }),
        getFeaturedProducts().then((value) {
          value.forEach((element) {
            featuredProducts.add(element);
          });
        }),
        getRecommendedProducts().then((value) {
          value.forEach((element) {
            recommendedProducts.add(element);
          });
        }),
      ]);
      return tabs;
    } catch (e) {
      rethrow;
    }
  }

  @override
  void initState() {
    _future = _getHomeContents();
    super.initState();
  }

  @override
  void dispose() {
    tabs.clear();
    headers.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    HelperFunctions.saveUserLoggedIn(false);
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => LoginPage()),
                        (Route<dynamic> route) => false);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Image(
                      image: AssetImage('images/hamburger_ico.png'),
                    ),
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
          FutureBuilder(
            future: _future,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                    child: ListView(
                  padding: const EdgeInsets.all(8),
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  children: <Widget>[
                    //_topbar(),
                    _tabLayouts(),
                    _tabProducts(),
                    //_categoryWidget(),
                    _setFeaturedProduct(),
                    //_banner(),
                    _setRecommendedList()
                  ],
                ));
              }
              return SizedBox(
                  height: screenHeight(context, mulBy: 0.3),
                  child: Center(
                      child: CircularProgressIndicator(
                    color: Color(AppColors.commonOrange),
                  )));
            },
          ),
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
    return TabBar(
      isScrollable: true,
      unselectedLabelColor: Colors.grey,
      labelColor: Colors.white,
      indicatorSize: TabBarIndicatorSize.tab,
      onTap: (no) {
        setState(() {
          selectedCategory = headers[no].id;
          scrollController.animateTo(0,
              duration: Duration(milliseconds: 50), curve: Curves.ease);
        });
      },
      controller: tabController,
      indicator: BubbleTabIndicator(
        indicatorHeight: 25.0,
        indicatorColor: Color(AppColors.commonOrange),
        tabBarIndicatorSize: TabBarIndicatorSize.tab,
      ),
      tabs: tabs,
    );
  }

  Widget _tabProducts() {
    return Container(
      height: screenHeight(context, mulBy: 0.9),
      child: FutureBuilder(
        future: getCategoryProducts(selectedCategory),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              controller: scrollController,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1.5, crossAxisCount: 2),
              itemBuilder: (context, index) {
                return ProductView(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ProductDetailsPage(
                                id: snapshot.data[index].id,
                              )));
                    },
                    imgId: snapshot.data[index].id,
                    rentPrice: snapshot.data[index].rentPrice,
                    salePrice: snapshot.data[index].salePrice,
                    name: snapshot.data[index].name);
              },
            );
          }
          return SizedBox(
              height: screenHeight(context, mulBy: 0.3),
              child: Center(
                  child: CircularProgressIndicator(
                color: Color(AppColors.commonOrange),
              )));
        },
      ),
    );
  }

  Widget _categoryWidget() {
    return Container(
      margin: EdgeInsets.all(1),
      width: double.infinity,
      height: 180,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: homeArray.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: setHomeBanner(index),
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
                    padding: const EdgeInsets.only(top: 8.0, left: 10),
                    child: SizedBox(
                      width: 185.0,
                      child: Text(
                        "Zardozi And Thread Embroidery Imported Green Sherwani",
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 19.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Row(
                      children: [
                        Text('Shop Now',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Icon(
                            CupertinoIcons.arrow_right,
                            color: Colors.white,
                          ),
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

  Widget _setFeaturedProduct() {
    return Container(
      child: SizedBox(
        height: 320,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 13.0, top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Featured Products',
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
                child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: _featureListData(),
            ) // ListView
                )
          ],
        ),
      ),
    );
  }

  Widget _featureListData() {
    return ListView.builder(
        itemCount: featuredProducts.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return ProductView(
            onTap: () {},
            imgId: featuredProducts[index].id,
            rentPrice: featuredProducts[index].rentPrice,
            salePrice: featuredProducts[index].salePrice,
            name: featuredProducts[index].name,
          );
        });
  }

  Widget _setRecommendedList() {
    return Container(
      child: SizedBox(
        height: 320,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(left: 5.0, right: 13.0, top: 10.0),
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
              child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: _recommendedListData(),
          ) // ListView
              )
        ]),
      ),
    );
  }

  Widget _banner() {
    return Container(
      margin: EdgeInsets.all(1),
      width: double.infinity,
      height: 160,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: homeArray.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: setMiddleBanner(index),
            );
          }),
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

  Widget _recommendedListData() {
    return ListView.builder(
        itemCount: recommendedProducts.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return ProductView(
            onTap: () {},
            imgId: recommendedProducts[index].id,
            rentPrice: recommendedProducts[index].rentPrice,
            salePrice: recommendedProducts[index].salePrice,
            name: recommendedProducts[index].name,
          );
        });
  }
}
