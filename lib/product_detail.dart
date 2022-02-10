import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_app1/Resources/AppColors.dart';
import 'package:flutter_app1/model/data.dart';
import 'package:flutter_app1/sizes.dart';
import 'package:flutter_app1/themes/light_color.dart';
import 'package:flutter_app1/themes/theme.dart';
import 'package:flutter_app1/title_text.dart';
import 'package:flutter_app1/extentions.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({Key? key}) : super(key: key);

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> with TickerProviderStateMixin{

  final List<String> imgList = [
    'https://poshrobe.com/image/product/LARGE/Mens-Sherwani-In-Black-Sssh1044Bla40-n01.jpg',
    'https://poshrobe.com/image/product/LARGE/Mens-Sherwani-In-Black-Sssh1044Bla40-n03.jpg',
    'https://poshrobe.com/image/product/LARGE/Mens-Sherwani-In-Black-Sssh1044Bla40-n06.jpg',
    'https://poshrobe.com/image/product/LARGE/Mens-Sherwani-In-Black-Sssh1044Bla40-n04.jpg',
    'https://poshrobe.com/image/product/LARGE/Mens-Sherwani-In-Black-Sssh1044Bla40-n05.jpg'
  ];

  final CarouselController _controller = CarouselController();
  bool rent= true;
  late TabController controller;

  @override
  void initState() {
    controller= TabController(length: 3, vsync: this,);
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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: screenWidth(context, mulBy: 0.02), ),
          child: Column(
            children: <Widget>[
              CarouselSlider(
                items: imgList.map((item) => Container(
                  child: Container(
                    margin: EdgeInsets.all(5.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        child: Image.network(item, fit: BoxFit.fitHeight, height: screenHeight(context, mulBy: 0.4),)),
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
                            horizontal: screenWidth(context, mulBy: 0.015),
                            vertical: screenHeight(context, mulBy: 0.005)
                          ),
                          width: screenWidth(context,)/imgList.length,
                          height: screenWidth(context,)/imgList.length,
                          child: Image.network(imgList[pageIndex], fit: BoxFit.fitHeight,
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
                              "Rs 2,499.00",
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
                            "Rs 18,000.00",
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
                height: screenHeight(context, mulBy: 0.015),
              ),
              rent?
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Rent the product for 3 Days.",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Rental Security: Rs 3000",
                          style: TextStyle(
                              fontSize: 15,
                          ),
                        ),
                        Text(
                          "Brand: Indian Dynasty",
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
                          "Condition: Used(Like new)",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "SKU: SSSH1045BL",
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
                      "Expected Delivery Date: 05-03-2022",
                      style: TextStyle(
                          fontSize: 15,
                      ),
                    ),
                    Text(
                      "Expected Return Date: 09-03-2022",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      "Rental Price: Rs 2,499.00 + Rental Security: Rs 3,000.00",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      "Total Payable Amount: Rs 5,499.00 (Taxes included)",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      ),
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
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Column(
                        children: [
                          TabBar(
                            labelColor: Colors.white,
                            unselectedLabelColor: Colors.black,
                            controller: controller,

                            indicator: const BoxDecoration(
                              color: Colors.grey,
                            ),
                            tabs: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Tab(

                                  text: 'Description',
                                  height: screenHeight(context, mulBy: 0.07),

                                ),
                              ),
                              Tab(
                                text: 'Specifications',
                                height: screenHeight(context, mulBy: 0.07),

                              ),
                              Tab(
                                height: screenHeight(context, mulBy: 0.07),
                                text: 'Shipping & Policies',
                              ),
                            ],
                          ),
                          Container(
                            height: screenHeight(context, mulBy: .3),
                            padding: EdgeInsets.only(
                                left: screenWidth(context,mulBy: 0.03),
                                right: screenWidth(context,mulBy: 0.03),
                                top: screenHeight(context, mulBy: 0.02)
                            ),
                            child: TabBarView(
                              physics: const BouncingScrollPhysics(),
                              controller: controller,
                              children: <Widget>[
                                SingleChildScrollView(
                                  child: Text("This exemplary black Sherwani is designed in a way to give your looks a polished traditional look. The fancy metal buttons upfront go well with the imported fabric. Rest assured, when you wear this Sherwani, there are more than ever chances of people approaching you and asking about the website you've bought it from. Moreover, to add sparkle to the outfit the sherwani is accompanied by a churidar."),
                                ),
                                SingleChildScrollView(
                                  child: Text("This exemplary black Sherwani is designed in a way to give your looks a polished traditional look. The fancy metal buttons upfront go well with the imported fabric. Rest assured, when you wear this Sherwani, there are more than ever chances of people approaching you and asking about the website you've bought it from. Moreover, to add sparkle to the outfit the sherwani is accompanied by a churidar."),
                                ),
                                SingleChildScrollView(
                                  child: Text("This exemplary black Sherwani is designed in a way to give your looks a polished traditional look. The fancy metal buttons upfront go well with the imported fabric. Rest assured, when you wear this Sherwani, there are more than ever chances of people approaching you and asking about the website you've bought it from. Moreover, to add sparkle to the outfit the sherwani is accompanied by a churidar."),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenHeight(context, mulBy: 0.015),
                    ),
                  ],
                ),
              ):
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}

