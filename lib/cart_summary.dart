import 'package:flutter/material.dart';
import 'package:flutter_app1/backend/backend_class.dart';
import 'package:flutter_app1/backend/backend_data.dart';
import 'package:flutter_app1/sizes.dart';

import 'Resources/AppColors.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {

  late Future<CartSummaryData> _future;

  @override
  void initState() {
    _future = cartSummary();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<CartSummaryData>(
    future: _future,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.hasData) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: Text("Your Cart", style: TextStyle(
              color: Colors.black
          ),),
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
                color: AppColors.commonOrange),
            padding: EdgeInsets.symmetric(
                vertical: screenHeight(context, mulBy: 0.02),
                horizontal: screenWidth(context, mulBy: 0.04)),
            child: Text(
              "Proceed to Pay",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ),
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Cart()));
          },
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth(context, mulBy: 0.05),
          ),
          children: [
            SizedBox(
              height: screenHeight(context, mulBy: 0.05),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 3,
                        spreadRadius: 3
                    ),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              height: screenHeight(context, mulBy: 0.3),
              width: 50,
            ),
            SizedBox(
              height: screenHeight(context, mulBy: 0.05),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Price:",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                Text(
                  "Rs. ${snapshot.data.price}",
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
                  "Tax(18%):",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                Text(
                  "Rs. ${snapshot.data.tax}",
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
                  "Rental Security:",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                Text(
                  "Rs. ${snapshot.data.rentalSecurity}",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            Divider(color: Colors.black26,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total:",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  "Rs. ${snapshot.data.total}",
                  style: TextStyle(
                    fontSize: 15,
                      fontWeight: FontWeight.bold

                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenHeight(context, mulBy: 0.15),
            ),
          ],
        ),
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
}
