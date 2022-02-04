import 'package:flutter/material.dart';

import 'custom_header.dart';


class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() =>
      _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  @override
  Widget build(BuildContext context) {
    tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              key: UniqueKey(),
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset('images/applogo.png'),
                          Expanded(child: Container()),
                          FittedBox(child: Text("Cancel", style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),))
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0,top: 20,bottom: 20),
                        child: FittedBox(child: Text("Account Information", style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),)),
                      )
                    ],
                  ),
                ),


              ),
            ),

            //tabbar
            SliverPersistentHeader(
                pinned: true,
                floating: true,
                delegate: MyCustomHeader(
                    expandedHeight: kToolbarHeight,
                    tabs: TabBar(overlayColor: null,
                      indicatorColor: Colors.black,
                      unselectedLabelColor: Colors.black,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorWeight: 10,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(10), // Creates border
                          color: Colors.black),
                      controller: tabController,
                      tabs: [
                        tabText("Personal Information"),
                        tabText("Measurement"),
                      ],
                    ),)),
            //children
            SliverFillRemaining(
              child: TabBarView(
                controller: tabController,
                children: [
                  _personelinformation(),
                  _measurements()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget tabText(txt){
    return FittedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
        child: Text(txt, style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400)),
      ),
    );
  }
  Widget _topPart() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 0, right: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              // onTap: () => onProfileClick(context), // choose image on click of profile
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("images/sample_pro_pic.jpeg"),
                        fit: BoxFit.cover),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 8,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ]
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 10),
              child: Text('Jhon Doe',
                  style: TextStyle(color: Colors.black, fontSize: 18)),
            )
          ],
        ),
      ),
    );
  }
  Widget _personelinformation() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Column(
          children: [
            _topPart(),

            SizedBox(height: 10),
            Material(
              elevation: 8,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              shadowColor: Colors.black,
              child: SizedBox(
                width: 380,
                child: TextField(
                    textAlign: TextAlign.left,
                    decoration: new InputDecoration(
                        border: InputBorder.none,hintText: "Email", contentPadding: const EdgeInsets.all(20.0))
                ),
              ),
            ),
            SizedBox(height: 10),
            Material(
              elevation: 8,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              shadowColor: Colors.black,
              child: SizedBox(
                width: 380,
                child: TextField(
                    textAlign: TextAlign.left,
                    decoration: new InputDecoration(
                        border: InputBorder.none,hintText: "Name", contentPadding: const EdgeInsets.all(20.0))
                ),
              ),
            ),
            SizedBox(height: 10),
            Material(
              elevation: 8,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              shadowColor: Colors.black,
              child: SizedBox(
                width: 380,
                child: TextField(
                    textAlign: TextAlign.left,
                    decoration: new InputDecoration(
                        border: InputBorder.none,hintText: "Phone Number", contentPadding: const EdgeInsets.all(20.0))
                ),
              ),
            ),

            SizedBox(height: 10),
            Material(
              elevation: 8,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              shadowColor: Colors.black,
              child: SizedBox(
                width: 380,
                child: TextField(
                    textAlign: TextAlign.left,
                    decoration: new InputDecoration(
                        border: InputBorder.none,hintText: "State", contentPadding: const EdgeInsets.all(20.0))
                ),
              ),
            ),

            SizedBox(height: 10),
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
                    'Save Changes',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _measurements() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Shirt Measurements',
                    style: TextStyle(color: Colors.black, fontSize: 20)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 60),
              child: Divider(
                color: Colors.black,thickness: 2,
              ),
            ),
            SizedBox(height: 10),
            Material(
              elevation: 8,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              shadowColor: Colors.black,
              child: SizedBox(
                width: 380,
                child: TextField(
                    textAlign: TextAlign.left,
                    decoration: new InputDecoration(
                        border: InputBorder.none,hintText: "Sleeve length", contentPadding: const EdgeInsets.all(20.0))
                ),
              ),
            ),
            SizedBox(height: 10),
            Material(
              elevation: 8,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              shadowColor: Colors.black,
              child: SizedBox(
                width: 380,
                child: TextField(
                    textAlign: TextAlign.left,
                    decoration: new InputDecoration(
                        border: InputBorder.none,hintText: "Chest around", contentPadding: const EdgeInsets.all(20.0))
                ),
              ),
            ),
            SizedBox(height: 10),
            Material(
              elevation: 8,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              shadowColor: Colors.black,
              child: SizedBox(
                width: 380,
                child: TextField(
                    textAlign: TextAlign.left,
                    decoration: new InputDecoration(
                        border: InputBorder.none,hintText: "Waist around", contentPadding: const EdgeInsets.all(20.0))
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30,top: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Trouser Measurements',
                    style: TextStyle(color: Colors.black, fontSize: 20)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 60),
              child: Divider(
                color: Colors.black,thickness: 2,
              ),
            ),
            SizedBox(height: 10),
            Material(
              elevation: 8,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              shadowColor: Colors.black,
              child: SizedBox(
                width: 380,
                child: TextField(
                    textAlign: TextAlign.left,
                    decoration: new InputDecoration(
                        border: InputBorder.none,hintText: "Length", contentPadding: const EdgeInsets.all(20.0))
                ),
              ),
            ),
            SizedBox(height: 10),
            Material(
              elevation: 8,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              shadowColor: Colors.black,
              child: SizedBox(
                width: 380,
                child: TextField(
                    textAlign: TextAlign.left,
                    decoration: new InputDecoration(
                        border: InputBorder.none,hintText: "Hip", contentPadding: const EdgeInsets.all(20.0))
                ),
              ),
            ),
            SizedBox(height: 10),
            Material(
              elevation: 8,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              shadowColor: Colors.black,
              child: SizedBox(
                width: 380,
                child: TextField(
                    textAlign: TextAlign.left,
                    decoration: new InputDecoration(
                        border: InputBorder.none,hintText: "Waist", contentPadding: const EdgeInsets.all(20.0))
                ),
              ),
            ),
            SizedBox(height: 10),
            Material(
              elevation: 8,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              shadowColor: Colors.black,
              child: SizedBox(
                width: 380,
                child: TextField(
                    textAlign: TextAlign.left,
                    decoration: new InputDecoration(
                        border: InputBorder.none,hintText: "Thighs", contentPadding: const EdgeInsets.all(20.0))
                ),
              ),
            ),
            SizedBox(height: 10),
            Material(
              elevation: 8,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              shadowColor: Colors.black,
              child: SizedBox(
                width: 380,
                child: TextField(
                    textAlign: TextAlign.left,
                    decoration: new InputDecoration(
                        border: InputBorder.none,hintText: "Hem", contentPadding: const EdgeInsets.all(20.0))
                ),
              ),
            ),
            SizedBox(height: 10),
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
                    'Save Changes',
                    style: TextStyle(color: Colors.white, fontSize: 14),
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


