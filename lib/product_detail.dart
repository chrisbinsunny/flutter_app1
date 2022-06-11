import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_app1/Checkout.dart';
import 'package:flutter_app1/Resources/AppColors.dart';
import 'package:flutter_app1/backend/backend_data.dart';
import 'package:flutter_app1/cart_summary.dart';
import 'package:flutter_app1/model/data.dart';
import 'package:flutter_app1/sizes.dart';
import 'package:flutter_app1/themes/light_color.dart';
import 'package:flutter_app1/themes/theme.dart';
import 'package:flutter_app1/title_text.dart';
import 'package:flutter_app1/extentions.dart';
import 'package:intl/intl.dart';

import 'backend/backend_class.dart';

class ProductDetailsPage extends StatefulWidget {
  String id;
  ProductDetailsPage({Key? key, required this.id}) : super(key: key);

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage>
    with TickerProviderStateMixin {
  List<String> imgList = [];
  String? selectedSizeId;
  int qty = 1;
  DateTime eventDate= DateTime.now();
  TextEditingController pinController=TextEditingController();


  final CarouselController _controller = CarouselController();
  bool rent = true;
  late TabController controller;
  late Future<ProductInfo> _future;

  @override
  void initState() {
    controller = TabController(
      length: 3,
      vsync: this,
    );
    log(widget.id);
    _future = getDetailedProduct(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ProductInfo>(
        future: _future,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            imgList = snapshot.data.images;
            return Scaffold(
              appBar: AppBar(
                title: Image.asset("images/app_logo.png"),
                elevation: 0,
                backgroundColor: Colors.white,
                automaticallyImplyLeading: false,
              ),
              floatingActionButton: InkWell(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 3,
                            blurRadius: 3
                        )
                      ],
                      color: Color(AppColors.commonOrange)),
                  padding: EdgeInsets.symmetric(
                      vertical: screenHeight(context, mulBy: 0.02),
                      horizontal: screenWidth(context, mulBy: 0.04)),
                  child: Text(
                    "Add to Cart",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                onTap: (){
                  if(selectedSizeId==null) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Please select a size."),
                    ));
                    return;
                  }
                  if(pinController.text==""||pinController.text.length!=6) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Please enter a valid pin code."),
                    ));
                    return;
                  }
                  if(eventDate.isBefore(DateTime.now())) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Please select a valid date."),
                    ));
                    return;
                  }
                  Map<String, dynamic> data={
                    "filter":{"25":selectedSizeId},
                    "pincode":pinController.text,
                    "quantity":qty,
                    "rental_event_date":"${eventDate.year}-${eventDate.month}-${eventDate.day}",
                    "rental_start_date":"${eventDate.year}-${eventDate.month}-${eventDate.day}",
                    "product_id":widget.id,
                    "product_for":"1",
                    "extend_rental":"0",
                    "extend_from_opr_id":"0",
                    "event_date":"${eventDate.year}-${eventDate.month}-${eventDate.day}",
                    "pdetail":"1"
                  };
                  //addToCart(data);
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Cart()));
                },
              ),
              body: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth(context, mulBy: 0.02),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        CarouselSlider(
                          items: imgList
                              .map((item) => Container(
                            child: Container(
                              margin: EdgeInsets.all(5.0),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(5.0)),
                                  child: Image.network(
                                    "https://poshrobe.com/image/product/LARGE/$item",
                                    fit: BoxFit.fitHeight,
                                    height: screenHeight(context,
                                        mulBy: 0.4),
                                  )),
                            ),
                          ))
                              .toList(),
                          options: CarouselOptions(
                            enlargeCenterPage: true,
                            height: screenHeight(context, mulBy: 0.35),
                          ),
                          carouselController: _controller,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            ...Iterable<int>.generate(imgList.length).map(
                                  (int pageIndex) => Flexible(
                                child: InkWell(
                                  onTap: () =>
                                      _controller.animateToPage(pageIndex),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                        screenWidth(context, mulBy: 0.00),
                                        vertical: screenHeight(context,
                                            mulBy: 0.002)),
                                    width: screenWidth(
                                      context,
                                    ) /
                                        imgList.length,
                                    height: screenWidth(
                                      context,
                                    ) /
                                        imgList.length,
                                    // decoration: BoxDecoration(
                                    //   border: Border.all(
                                    //     color: Colors.brown
                                    //   )
                                    // ),
                                    child: Image.network(
                                      "https://poshrobe.com/image/product/THUMB/${imgList[pageIndex]}",
                                      fit: BoxFit.fitHeight,
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
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: screenHeight(context, mulBy: 0.02),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  rent = true;
                                });
                              },
                              child: Container(
                                width: screenWidth(context, mulBy: 0.4),
                                height: screenHeight(context, mulBy: 0.13),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: rent
                                        ? Colors.grey.withOpacity(0.5)
                                        : Colors.white,
                                    border: Border.all(
                                        color: rent
                                            ? Colors.transparent
                                            : Colors.grey.withOpacity(0.5),
                                        width: 1.5)),
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
                                          fontWeight: FontWeight.bold),
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
                              onTap: () {
                                setState(() {
                                  rent = false;
                                });
                              },
                              child: Container(
                                width: screenWidth(context, mulBy: 0.4),
                                height: screenHeight(context, mulBy: 0.13),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: !rent
                                        ? Colors.grey.withOpacity(0.5)
                                        : Colors.white,
                                    border: Border.all(
                                        color: !rent
                                            ? Colors.transparent
                                            : Colors.grey.withOpacity(0.5),
                                        width: 1.5)),
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
                                          fontWeight: FontWeight.bold),
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
                        rent
                            ? rentBuilder(context, snapshot)
                            : buyBuilder(context, snapshot),
                      ],
                    ),
                  )),
            );
          }
          return Container(
            color: Colors.white,
            child: Center(
              child: CircularProgressIndicator(
                color: Color(0xff0FAA51B),
              ),
            ),
          );
        });
  }

  Container buyBuilder(BuildContext context, AsyncSnapshot<dynamic> snapshot) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Buy Brand New Product and keep it.",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
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
            height: screenHeight(context, mulBy: 0.04),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Size: ",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Container(
                width: screenWidth(context, mulBy: 0.27),
                height: screenHeight(context, mulBy: 0.05),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.2),
                ),
                alignment: Alignment.center,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    alignment: Alignment.center,
                    isExpanded: false,
                    items: snapshot.data.filter
                        .map<DropdownMenuItem<String>>((Map<String, String> value) {
                      return DropdownMenuItem(
                        value: value["id"],
                        child: Text(value["name"].toString()),
                      );
                    }).toList(),
                    hint: Text("Select..."),
                    onChanged: (value) {
                      log(value!);
                      setState(() {
                        selectedSizeId = value;
                      });
                    },
                    value: selectedSizeId,
                  ),
                ),
              ),
              SizedBox(
                width: screenWidth(context, mulBy: 0.05),
              ),
              Text(
                "Quantity: ",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: () {
                  setState(() {

                    qty++;

                  });
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Container(
                  height: screenHeight(context, mulBy: 0.05),
                  width: screenWidth(context, mulBy: 0.1),
                  margin: EdgeInsets.symmetric(
                      horizontal: screenWidth(context, mulBy: 0.03)),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15)),
                  child: const Icon(
                    Icons.add,
                  ),
                ),
              ),
              Text(
                qty.toString(),
                style: TextStyle(
                    fontSize: 16
                ),
              ),
              InkWell(
                onTap: () {

                  setState(() {
                    if (qty > 1) {
                      qty--;
                    }
                  });
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Container(
                  height: screenHeight(context, mulBy: 0.05),
                  width: screenWidth(context, mulBy: 0.1),
                  margin: EdgeInsets.symmetric(
                      horizontal: screenWidth(context, mulBy: 0.03)),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15)),
                  child: const Icon(
                    Icons.remove,
                    size: 25,
                  ),
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
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Container(
                  width: screenWidth(context, mulBy: 0.35),
                  height: screenHeight(context, mulBy: 0.06),
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth(context, mulBy: 0.03),),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.2),),
                  child:
                  Center(
                    child: TextFormField(
                      controller: pinController,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.start,
                      autofocus: false,
                      enabled: true,
                      decoration: InputDecoration(
                        isDense: true,
                        counterText: "",
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  )

              ),
            ],
          ),
          SizedBox(
            height: screenHeight(context, mulBy: 0.015),
          ),

          InkWell(
            onTap: () => _selectDate(context) ,
            child: Row(
              children: [
                Text(
                  "Event Date: ",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Container(
                    height: screenHeight(context, mulBy: 0.06),
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth(context, mulBy: 0.03),),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.2),),
                    child: Row(
                      children: [
                        Text(
                          "${eventDate.day} ${DateFormat.MMMM().format(eventDate)} ${eventDate.year}",
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16.5,
                          ),
                        ),
                        SizedBox(
                          width: screenWidth(context, mulBy: 0.04),
                          height: screenHeight(context, mulBy: 0.055),
                        ),
                        const Icon(
                          Icons.date_range,
                          color: Colors.black,
                        )
                      ],
                    )
                ),
              ],
            ),
          ),
          SizedBox(
            height: screenHeight(context, mulBy: 0.04),
          ),
          Text(
            "Expected Delivery Date: ??",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          Text(
            "Total Payable Amount: Rs ${snapshot.data.salePrice} (Taxes included)",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: screenHeight(context, mulBy: 0.02),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(AppColors.commonOrange)),
              padding: EdgeInsets.symmetric(
                  vertical: screenHeight(context, mulBy: 0.02),
                  horizontal: screenWidth(context, mulBy: 0.04)),
              child: Text(
                "Add to Cart",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
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
    );
  }

  Container rentBuilder(BuildContext context, AsyncSnapshot<dynamic> snapshot) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Rent the product for 3 Days.",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
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
            height: screenHeight(context, mulBy: 0.04),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Size: ",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Container(
                width: screenWidth(context, mulBy: 0.27),
                height: screenHeight(context, mulBy: 0.05),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.2),
                ),
                alignment: Alignment.center,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    alignment: Alignment.center,
                    isExpanded: false,
                    items: snapshot.data.filter
                        .map<DropdownMenuItem<String>>((Map<String, String> value) {
                      return DropdownMenuItem(
                        value: value["id"],
                        child: Text(value["name"].toString()),
                      );
                    }).toList(),
                    hint: Text("Select..."),
                    onChanged: (value) {
                      log(value!);
                      setState(() {
                        selectedSizeId = value;
                      });
                    },
                    value: selectedSizeId,
                  ),
                ),
              ),
              SizedBox(
                width: screenWidth(context, mulBy: 0.05),
              ),
              Text(
                "Quantity: ",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: () {
                  setState(() {

                    qty++;

                  });
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Container(
                  height: screenHeight(context, mulBy: 0.05),
                  width: screenWidth(context, mulBy: 0.1),
                  margin: EdgeInsets.symmetric(
                      horizontal: screenWidth(context, mulBy: 0.03)),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15)),
                  child: const Icon(
                    Icons.add,
                  ),
                ),
              ),
              Text(
                qty.toString(),
                style: TextStyle(
                  fontSize: 16
                ),
              ),
              InkWell(
                onTap: () {

                  setState(() {
                    if (qty > 1) {
                      qty--;
                    }
                  });
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Container(
                  height: screenHeight(context, mulBy: 0.05),
                  width: screenWidth(context, mulBy: 0.1),
                  margin: EdgeInsets.symmetric(
                      horizontal: screenWidth(context, mulBy: 0.03)),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15)),
                  child: const Icon(
                    Icons.remove,
                    size: 25,
                  ),
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
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Container(
                  width: screenWidth(context, mulBy: 0.35),
                  height: screenHeight(context, mulBy: 0.06),
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth(context, mulBy: 0.03),),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.2),),
                child:
                Center(
                  child: TextFormField(
                    controller: pinController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        ),
                    textAlign: TextAlign.start,
                    autofocus: false,
                    enabled: true,
                    decoration: InputDecoration(
                      isDense: true,
                      counterText: "",
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                )

              ),
            ],
          ),
          SizedBox(
            height: screenHeight(context, mulBy: 0.015),
          ),

          InkWell(
            onTap: () => _selectDate(context) ,
            child: Row(
              children: [
                Text(
                  "Event Date: ",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Container(
                    height: screenHeight(context, mulBy: 0.06),
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth(context, mulBy: 0.03),),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.2),),
                    child: Row(
                      children: [
                        Text(
                          "${eventDate.day} ${DateFormat.MMMM().format(eventDate)} ${eventDate.year}",
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16.5,
                          ),
                        ),
                        SizedBox(
                          width: screenWidth(context, mulBy: 0.04),
                          height: screenHeight(context, mulBy: 0.055),
                        ),
                        const Icon(
                          Icons.date_range,
                          color: Colors.black,
                        )
                      ],
                    )
                ),
              ],
            ),
          ),
          SizedBox(
            height: screenHeight(context, mulBy: 0.04),
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
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: screenHeight(context, mulBy: 0.15),
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
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: eventDate,
        firstDate: DateTime(2022, 1),
        lastDate: DateTime(2101));
    if (picked != null && picked != eventDate) {
      setState(() {
        eventDate = picked;
      });
    }
  }
}
