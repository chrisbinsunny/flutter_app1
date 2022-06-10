import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_app1/Resources/AppColors.dart';
import 'package:flutter_app1/backend/backend_data.dart';
import 'package:flutter_app1/model/data.dart';
import 'package:flutter_app1/sizes.dart';
import 'package:flutter_app1/themes/light_color.dart';
import 'package:flutter_app1/themes/theme.dart';
import 'package:flutter_app1/title_text.dart';
import 'package:flutter_app1/extentions.dart';

import 'backend/backend_class.dart';

class ProductDetailsPage extends StatefulWidget {
  String id;
  ProductDetailsPage({Key? key, required this.id}) : super(key: key);

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> with TickerProviderStateMixin{

  List<String> imgList = [];

  final CarouselController _controller = CarouselController();
  bool rent= true;
  late TabController controller;
  late Future<ProductInfo> _future;

  @override
  void initState() {
    controller= TabController(length: 3, vsync: this,);
    _future = getDetailedProduct(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("images/app_logo.png"),
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: screenWidth(context, mulBy: 0.02), ),
        child: FutureBuilder<ProductInfo>(
          future: _future,
            builder: (BuildContext context, AsyncSnapshot snapshot)
            {
          if(snapshot.hasData){
            imgList=snapshot.data.images;
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  CarouselSlider(
                    items: imgList.map((item) => Container(
                      child: Container(
                        margin: EdgeInsets.all(5.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                            child: Image.network("https://poshrobe.com/image/product/LARGE/$item", fit: BoxFit.fitHeight, height: screenHeight(context, mulBy: 0.4),)),
                      ),
                    ))
                        .toList(),
                    options: CarouselOptions(enlargeCenterPage: true, height: screenHeight(context, mulBy: 0.35), ),
                    carouselController: _controller,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ...Iterable<int>.generate(imgList.length).map(
                            (int pageIndex) => Flexible(
                          child: InkWell(
                            onTap: () => _controller.animateToPage(pageIndex),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth(context, mulBy: 0.00),
                                  vertical: screenHeight(context, mulBy: 0.002)
                              ),
                              width: screenWidth(context,)/imgList.length,
                              height: screenWidth(context,)/imgList.length,
                              // decoration: BoxDecoration(
                              //   border: Border.all(
                              //     color: Colors.brown
                              //   )
                              // ),
                              child: Image.network("https://poshrobe.com/image/product/THUMB/${imgList[pageIndex]}", fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight(context, mulBy: 0.02),
                  ),
                  Text(
                    snapshot.data.name,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    height: screenHeight(context, mulBy: 0.02),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: (){
                          setState(() {
                            rent=true;
                          });
                        },
                        child: Container(
                          width: screenWidth(context, mulBy: 0.4),
                          height: screenHeight(context, mulBy: 0.13),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: rent?Colors.grey.withOpacity(0.5):Colors.white,
                              border: Border.all(
                                  color: rent?Colors.transparent:Colors.grey.withOpacity(0.5),
                                  width: 1.5
                              )
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "For Rental",
                                style: TextStyle(
                                  fontSize: 16,

                                ),
                              ),
                              Text(
                                "Rs ${snapshot.data.rentPrice}",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                "per event",
                                style: TextStyle(
                                  fontSize: 16,

                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          setState(() {
                            rent=false;
                          });
                        },
                        child: Container(
                          width: screenWidth(context, mulBy: 0.4),
                          height: screenHeight(context, mulBy: 0.13),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: !rent?Colors.grey.withOpacity(0.5):Colors.white,
                              border: Border.all(
                                  color: !rent?Colors.transparent:Colors.grey.withOpacity(0.5),
                                  width: 1.5
                              )
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "For Buying",
                                style: TextStyle(
                                  fontSize: 16,

                                ),
                              ),
                              Text(
                                "Rs ${snapshot.data.salePrice}",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                "per event",
                                style: TextStyle(
                                  fontSize: 16,

                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: screenHeight(context, mulBy: 0.02),
                  ),
                  rent?
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Rent the product for 3 Days.",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold
                          ),
                        ),

                        SizedBox(
                          height: screenHeight(context, mulBy: 0.012),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Rental Security: Rs ${snapshot.data.security}",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              "Brand: ${snapshot.data.brand}",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),

                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Condition: ${snapshot.data.condition}",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              "SKU: ${snapshot.data.sku}",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),

                          ],
                        ),
                        SizedBox(
                          height: screenHeight(context, mulBy: 0.015),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Size: ",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Container(
                              width: screenWidth(context, mulBy: 0.27),
                              height: screenHeight(context, mulBy: 0.05),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.withOpacity(0.2),
                              ),
                            ),
                            SizedBox(
                              width: screenWidth(context, mulBy: 0.05),
                            ),
                            Text(
                              "Quantity: ",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Container(
                              width: screenWidth(context, mulBy: 0.27),
                              height: screenHeight(context, mulBy: 0.05),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.withOpacity(0.2),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenHeight(context, mulBy: 0.015),
                        ),
                        Row(
                          children: [
                            Text(
                              "Pin: ",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Container(
                              width: screenWidth(context, mulBy: 0.27),
                              height: screenHeight(context, mulBy: 0.05),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.withOpacity(0.2),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenHeight(context, mulBy: 0.015),
                        ),
                        Text(
                          "Expected Delivery Date: ??",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "Expected Return Date: ??",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "Rental Price: Rs ${snapshot.data.rentPrice} + Rental Security: Rs ${snapshot.data.security}",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "Total Payable Amount: Rs ${int.parse(snapshot.data.rentPrice) + int.parse(snapshot.data.security)} (Taxes included)",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(
                          height: screenHeight(context, mulBy: 0.02),
                        ),
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Color(AppColors.commonOrange)
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: screenHeight(context, mulBy: 0.02),
                                horizontal: screenWidth(context, mulBy: 0.04)
                            ),
                            child: Text("Add to Cart", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
                          ),
                        ),
                        SizedBox(
                          height: screenHeight(context, mulBy: 0.015),
                        ),
                        // ClipRRect(
                        //   borderRadius: BorderRadius.circular(15),
                        //   child: Column(
                        //     children: [
                        //       TabBar(
                        //         labelColor: Colors.white,
                        //         unselectedLabelColor: Colors.black,
                        //         controller: controller,
                        //
                        //         indicator: const BoxDecoration(
                        //           color: Colors.grey,
                        //         ),
                        //         tabs: [
                        //           ClipRRect(
                        //             borderRadius: BorderRadius.circular(50),
                        //             child: Tab(
                        //
                        //               text: 'Description',
                        //               height: screenHeight(context, mulBy: 0.07),
                        //
                        //             ),
                        //           ),
                        //           Tab(
                        //             text: 'Specifications',
                        //             height: screenHeight(context, mulBy: 0.07),
                        //
                        //           ),
                        //           Tab(
                        //             height: screenHeight(context, mulBy: 0.07),
                        //             text: 'Shipping & Policies',
                        //           ),
                        //         ],
                        //       ),
                        //       Container(
                        //         height: screenHeight(context, mulBy: .3),
                        //         padding: EdgeInsets.only(
                        //             left: screenWidth(context,mulBy: 0.03),
                        //             right: screenWidth(context,mulBy: 0.03),
                        //             top: screenHeight(context, mulBy: 0.02)
                        //         ),
                        //         child: TabBarView(
                        //           physics: const BouncingScrollPhysics(),
                        //           controller: controller,
                        //           children: <Widget>[
                        //             SingleChildScrollView(
                        //               child: Text(
                        //                 snapshot.data.desc
                        //               ),
                        //             ),
                        //             Row(
                        //               crossAxisAlignment: CrossAxisAlignment.center,
                        //               mainAxisAlignment: MainAxisAlignment.center,
                        //               children: [
                        //                 Text(snapshot.data.attributes.name,
                        //                   style: TextStyle(
                        //                       fontWeight: FontWeight.bold,
                        //                       fontSize: 16,
                        //                       color: Colors.black),),
                        //
                        //                 SizedBox(
                        //                   width: screenWidth(context, mulBy: 0.04),
                        //                 ),
                        //                 Expanded(
                        //                   child: ListView.builder(
                        //                       itemCount: 4,
                        //                       shrinkWrap: true,
                        //                       itemBuilder: (BuildContext context, i)
                        //                       => RichText(
                        //                         text: TextSpan(
                        //                           text: '${snapshot.data.attributes.attribute[i]["name"]}: ',
                        //                           style: TextStyle(
                        //                               fontWeight: FontWeight.bold,
                        //                               fontSize: 15,
                        //                               color: Colors.black),
                        //                           children: <TextSpan>[
                        //                             TextSpan(
                        //                                 text: snapshot.data.attributes.attribute[i]["text"],
                        //                                 style: TextStyle(fontWeight: FontWeight.normal)),
                        //                           ],
                        //                         ),
                        //                       )
                        //                   ),
                        //                 )
                        //               ],
                        //             ),
                        //             SingleChildScrollView(
                        //               child: Text("This product is available for Free Shipping above 0."))
                        //           ],
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        SizedBox(
                          height: screenHeight(context, mulBy: 0.015),
                        ),
                      ],
                    ),
                  ):
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Buy Brand New Product and keep it.",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold
                          ),
                        ),

                        SizedBox(
                          height: screenHeight(context, mulBy: 0.012),
                        ),
                        Text(
                          "Brand: ${snapshot.data.brand}",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "Condition:  New (Never Used)",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "SKU: ${snapshot.data.sku}",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: screenHeight(context, mulBy: 0.015),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Size: ",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Container(
                              width: screenWidth(context, mulBy: 0.27),
                              height: screenHeight(context, mulBy: 0.05),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.withOpacity(0.2),
                              ),
                            ),
                            SizedBox(
                              width: screenWidth(context, mulBy: 0.05),
                            ),
                            Text(
                              "Quantity: ",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Container(
                              width: screenWidth(context, mulBy: 0.27),
                              height: screenHeight(context, mulBy: 0.05),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.withOpacity(0.2),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenHeight(context, mulBy: 0.015),
                        ),
                        Row(
                          children: [
                            Text(
                              "Pin: ",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Container(
                              width: screenWidth(context, mulBy: 0.27),
                              height: screenHeight(context, mulBy: 0.05),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.withOpacity(0.2),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenHeight(context, mulBy: 0.015),
                        ),
                        Text(
                          "Expected Delivery Date: ??",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "Total Payable Amount: Rs ${snapshot.data.salePrice} (Taxes included)",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(
                          height: screenHeight(context, mulBy: 0.02),
                        ),
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Color(AppColors.commonOrange)
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: screenHeight(context, mulBy: 0.02),
                                horizontal: screenWidth(context, mulBy: 0.04)
                            ),
                            child: Text("Add to Cart", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
                          ),
                        ),
                        SizedBox(
                          height: screenHeight(context, mulBy: 0.015),
                        ),
                        // ClipRRect(
                        //   borderRadius: BorderRadius.circular(15),
                        //   child: Column(
                        //     children: [
                        //       TabBar(
                        //         labelColor: Colors.white,
                        //         unselectedLabelColor: Colors.black,
                        //         controller: controller,
                        //
                        //         indicator: const BoxDecoration(
                        //           color: Colors.grey,
                        //         ),
                        //         tabs: [
                        //           ClipRRect(
                        //             borderRadius: BorderRadius.circular(50),
                        //             child: Tab(
                        //
                        //               text: 'Description',
                        //               height: screenHeight(context, mulBy: 0.07),
                        //
                        //             ),
                        //           ),
                        //           Tab(
                        //             text: 'Specifications',
                        //             height: screenHeight(context, mulBy: 0.07),
                        //
                        //           ),
                        //           Tab(
                        //             height: screenHeight(context, mulBy: 0.07),
                        //             text: 'Shipping & Policies',
                        //           ),
                        //         ],
                        //       ),
                        //       Container(
                        //         height: screenHeight(context, mulBy: .3),
                        //         padding: EdgeInsets.only(
                        //             left: screenWidth(context,mulBy: 0.03),
                        //             right: screenWidth(context,mulBy: 0.03),
                        //             top: screenHeight(context, mulBy: 0.02)
                        //         ),
                        //         child: TabBarView(
                        //           physics: const BouncingScrollPhysics(),
                        //           controller: controller,
                        //           children: <Widget>[
                        //             SingleChildScrollView(
                        //               child: Text(
                        //                   snapshot.data.desc
                        //               ),
                        //             ),
                        //             Row(
                        //               crossAxisAlignment: CrossAxisAlignment.center,
                        //               mainAxisAlignment: MainAxisAlignment.center,
                        //               children: [
                        //                 Text(snapshot.data.attributes.name,
                        //                   style: TextStyle(
                        //                       fontWeight: FontWeight.bold,
                        //                       fontSize: 16,
                        //                       color: Colors.black),),
                        //
                        //                 SizedBox(
                        //                   width: screenWidth(context, mulBy: 0.04),
                        //                 ),
                        //                 Expanded(
                        //                   child: ListView.builder(
                        //                       itemCount: 4,
                        //                       shrinkWrap: true,
                        //                       itemBuilder: (BuildContext context, i)
                        //                       => RichText(
                        //                         text: TextSpan(
                        //                           text: '${snapshot.data.attributes.attribute[i]["name"]}: ',
                        //                           style: TextStyle(
                        //                               fontWeight: FontWeight.bold,
                        //                               fontSize: 15,
                        //                               color: Colors.black),
                        //                           children: <TextSpan>[
                        //                             TextSpan(
                        //                                 text: snapshot.data.attributes.attribute[i]["text"],
                        //                                 style: TextStyle(fontWeight: FontWeight.normal)),
                        //                           ],
                        //                         ),
                        //                       )
                        //                   ),
                        //                 )
                        //               ],
                        //             ),
                        //             SingleChildScrollView(
                        //                 child: Text("This product is available for Free Shipping above 0."))
                        //           ],
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        SizedBox(
                          height: screenHeight(context, mulBy: 0.015),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(
              color: Color(0xff0FAA51B),
            ),
          );
        }
        )
      ),
    );
  }
}

