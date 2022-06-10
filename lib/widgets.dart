import 'package:flutter/material.dart';
import '../sizes.dart';
import 'Resources/AppColors.dart';



showLoaderDialog(BuildContext context){
  AlertDialog alert= AlertDialog(
    shape: CircleBorder(),
    content:
    Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularProgressIndicator(
          color: Color(AppColors.commonOrange),
        ),
      ],
    ),

  );
  showDialog(
    barrierDismissible: false,
    context:context,
    builder:(BuildContext context){
      return alert;
    },
  );
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

showAlertDialog1(
    BuildContext context,  String title, String content, ) {

  Widget cancelButton = TextButton(
    child: Text("Cancel",
      style: TextStyle(color: Theme.of(context).primaryColor),
    ),
    onPressed:  () {
      Navigator.of(context).pop();
    },
  );


  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(content),
    actions: [
      cancelButton,
    ],
  );


  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

class ProductView extends StatelessWidget {
  ProductView({Key? key, required this.onTap, required this.imgId, required this.rentPrice, required this.salePrice, required this.name}) : super(key: key);
  VoidCallback onTap;
  String imgId, rentPrice, salePrice, name;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        //width: screenWidth(context, mulBy: 0.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              width: screenWidth(context, mulBy: 0.4),
              clipBehavior: Clip.hardEdge,
              child: Image.network(
                "https://poshrobe.com/image/product_image/$imgId/MEDIUM",
                height: screenHeight(context, mulBy: 0.27),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                children: [
                  Text("Rs. ${rentPrice.split(".")[0]}",style: TextStyle(
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
                  Text("Rs. ${salePrice.split(".")[0]}",style: TextStyle(
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
                  name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  style: TextStyle(color: Colors.black87, fontSize: 12.0),
                ),
              ),
            ),
            // Container(
            //   height: screenHeight(context, mulBy: 0.15),
            //   alignment: Alignment.bottomCenter,
            //   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            //   decoration: BoxDecoration(
            //     gradient: LinearGradient(
            //         begin: Alignment.bottomCenter,
            //         end: Alignment.topCenter,
            //         colors: [Colors.black, Colors.transparent]),
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     mainAxisSize: MainAxisSize.min,
            //     children: [
            //       Row(
            //         children: [
            //           Text("Rs. ${snapshot.data[index].rentPrice.toString().split(".")[0]}",style: TextStyle(
            //               color: Colors.white,
            //               fontWeight: FontWeight.bold,
            //               fontSize: 16),),
            //           Text(' / Rental',style: TextStyle(
            //               color: Colors.grey,
            //               fontSize: 13),),
            //         ],
            //       ),
            //
            //       Row(
            //         children: [
            //           Text("Rs. ${snapshot.data[index].salePrice.toString().split(".")[0]}",style: TextStyle(
            //               color: Colors.white,
            //               fontWeight: FontWeight.bold,
            //               fontSize: 16),),
            //           Text(' / Sale',style: TextStyle(
            //               color: Colors.grey,
            //               fontSize: 13),),
            //         ],
            //       ),
            //
            //       Text(
            //         snapshot.data[index].name,
            //         maxLines: 2,
            //         overflow: TextOverflow.ellipsis,
            //         softWrap: false,
            //         style: TextStyle(color: Colors.white60, fontSize: 12.0),
            //       ),
            //
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
