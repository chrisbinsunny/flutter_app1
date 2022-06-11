import 'package:flutter/material.dart';
import 'package:flutter_app1/HomeBase.dart';
import 'package:flutter/cupertino.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  top: 60, right: 10, left: 10, bottom: 20),
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black87,
                          blurRadius: 10,
                        ),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  padding: const EdgeInsets.only(top: 30),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Center(
                          child: Container(
                              width: 150,
                              height: 50,
                              child: new Image.asset('images/applogo.png')),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, top: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Checkout Securely',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 60),
                        child: Divider(
                          color: Colors.black,
                          thickness: 2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, top: 10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('athulasok@gmail.com',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, top: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Shipping Address',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16)),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 30, top: 10, right: 30),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                              '10th Floor, RMZ Latitude Commercial Building, Bellary Road, Hebbal, Bangalore, 560024.'
                              'Third floor, Kadooli tower, Nadakkavu West, Vandipetta, Calicut, 673011.',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12)),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10, left: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Material(
                            elevation: 8,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            shadowColor: Colors.black,
                            color: Colors.amber,
                            child: SizedBox(
                              width: 180,
                              height: 40,
                              child: FlatButton(
                                onPressed: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(builder: (context) => HomeBase()),
                                  // );
                                },
                                child: Text(
                                  'Change Address',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, top: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Shipping Summary',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 60),
                        child: Divider(
                          color: Colors.black,
                          thickness: 2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, top: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Cart Summary',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 60),
                        child: Divider(
                          color: Colors.black,
                          thickness: 2,
                        ),
                      ),
                      _setCartData(),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, top: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Payment',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 60),
                        child: Divider(
                          color: Colors.black,
                          thickness: 2,
                        ),
                      ),
                      Payment(context)
                    ],
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

Widget Payment(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 20.0, bottom: 50, right: 30, left: 30),
    child: Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  'Net Payable',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: Text(
                  'Rs2990.00',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  'Pay using PayU Money:',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 0, top: 10, right: 30),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                  'PayU Money - This page will redirect to PayU Money, do not refresh the page while on the payment or after the payment page.',
                  style: TextStyle(color: Colors.black87, fontSize: 15)),
            ),
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
                  /*Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Checkout()),
                  );*/
                },
                child: Text(
                  'Confirm Payment',
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

Widget _setCartData() {
  return Container(
    child: SizedBox(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: ListView.separated(
                // make sure to add the following lines:
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: 1,
                separatorBuilder: (context, index) =>
                    Divider(height: 10, color: Colors.white),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: _cartListItem(index),
                  );
                }
                // the rest of your list view code
                ),
          ) // ListView
        ],
      ),
    ),
  );
}

Widget _cartListItem(int index) {
  return Container(
    child: Container(
      height: 120,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black87,
              blurRadius: 7,
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(10))),
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
                padding: const EdgeInsets.only(left: 8.0, top: 20),
                child: Text(
                  'Zardozi And Thread Embroidery',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 12),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 3),
                child: Text(
                  'Quantity 1| Free shipping| ',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 12),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 3),
                child: Text(
                  'Event Date 20-10-2022 ',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 12),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                child: Text(
                  'Rental DepositRs 2,999',
                  style: TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: Icon(
              CupertinoIcons.delete_left_fill,
              color: Colors.amber,
            ),
          )
        ],
      ),
    ),
  );
}
