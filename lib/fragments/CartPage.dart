
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/Resources/AppColors.dart';

class CartPage extends StatefulWidget{
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
              Expanded(child: _setCartData()),
            Checkout()
          ],
        ),
      ),
    );
  }
}

Widget _setCartData() {
  return Container(
    child: SizedBox(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 13.0,right: 13.0,top: 40.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Text('Your shopping cart',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 16)),
                ),
              ],
            ),
          ),

          Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: ListView.separated(
                  // make sure to add the following lines:
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: 2,
                    separatorBuilder: (context, index) =>Divider(height: 10, color: Colors.white),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: _cartListItem(index),
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

Widget _cartListItem(int index){

  return Container(

      child: Container(
        height: 120,

        decoration: BoxDecoration(
            color : Colors.white,
            boxShadow: [BoxShadow(
              color: Colors.black87,
              blurRadius: 7,
            ),],
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: AssetImage('images/feature_img.png'),
              width: 100,
              height: 100,
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,top: 20),
                  child: Text('Zardozi And Thread Embroidery',style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 12),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 8.0,top: 3),
                  child: Text('Quantity 1| Free shipping| ',style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 12),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,top: 3),
                  child: Text('Event Date 20-10-2022 ',style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 12),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 8.0,top: 8.0),
                  child: Text('Rental DepositRs 2,999',style: TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                  ),
                ),

              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: Icon(CupertinoIcons.delete_left_fill,color: Colors.amber,),
            )

          ],
        ),
      ),
  );
}

Widget Checkout() {
  return Padding(
    padding: const EdgeInsets.only(top: 20.0,bottom: 50,right: 30,left: 30),
  child: Container(

    child: Column(
      children: [
     Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            'Price',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 16
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 30.0),
          child: Text(
            'Rs2990.00',
            style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.black54,
                fontSize: 16
            ),
          ),
        ),

      ],
    ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                'Tax ( 18% )',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 16
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Text(
                'Rs381.00',
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black54,
                    fontSize: 16
                ),
              ),
            ),

          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                'Refundable Rental Security',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 16
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Text(
                '+Rs4,000.00',
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black54,
                    fontSize: 16
                ),
              ),
            ),

          ],
        ),
        Divider(
            color: Colors.black
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                'Total',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 16
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Text(
                'Rs6,000.00',
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black54,
                    fontSize: 16
                ),
              ),
            ),

          ],
        ),
        SizedBox(height: 30),
        Material(
          elevation: 8,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          shadowColor: Colors.black,
          color: Colors.amber,
          child: SizedBox(
            width: 200,
            child: FlatButton(
              onPressed: () {
              /*  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeBase()),
                );*/
              },
              child: Text(
                'Proceed To PAY',
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