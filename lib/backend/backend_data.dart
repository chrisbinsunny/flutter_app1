import 'dart:convert';
import 'dart:developer';


import 'package:http/http.dart' as http;
import '../backend/backend_class.dart';
import '../shared_pref.dart';



Future<int> login(String email, String password) async {
  final http.Response response = await http.post(
    Uri.parse('https://poshrobe.com/user/mobile_login/$email/$password'),
  );
  if (response.statusCode == 200) {
    HelperFunctions.saveUserLoggedIn(true);
    print(response.body);
    //TODO Save user
  }

  return response.statusCode;
}

Future<List<Header>> getHeaderCategories() async {
  final http.Response response = await http.get(
    Uri.parse('https://poshrobe.com/common/headercategories'),
  );
  var headers = <Header>[];
  if (response.statusCode == 200) {

    var headerJson = json.decode(response.body);
    headers= List<Header>.from(headerJson.map((model)=> Header.fromJson(model)));
  }
  return headers;
}

Future<List<Product>> getCategoryProducts(String catID) async {
  final http.Response response = await http.get(
    Uri.parse('https://poshrobe.com/products/get_category_product/$catID'),
  );
  var products = <Product>[];
  if (response.statusCode == 200) {

    var productJson = json.decode(response.body);
    products= List<Product>.from(productJson.map((model)=> Product.fromJson(model)));
  }
  return products;
}

Future<List<Product>> getFeaturedProducts() async {
  final http.Response response = await http.get(
    Uri.parse('https://poshrobe.com/home/homepage_featured_products'),
  );
  var products = <Product>[];
  if (response.statusCode == 200) {

    var productJson = json.decode(response.body);
    products= List<Product>.from(productJson.map((model)=> Product.fromJson(model)));
  }
  return products;
}

Future<ProductInfo> getDetailedProduct(String id) async {
  final http.Response response = await http.get(
    Uri.parse('https://poshrobe.com/products/product_view/$id'),
  );
  late ProductInfo productInfo;
  if (response.statusCode == 200) {
    var productInfoJson = json.decode(response.body)[0]['productInfo'];
    productInfo = ProductInfo.fromJson(productInfoJson);
  }
  return productInfo;
}


Future addToCart(Map data) async {
  var url = 'https://poshrobe.com/cart/cart_add';
  var response = await http.post(Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data)
  );
  if (response.statusCode == 200) {
    return true;
  }
  else return false;
}

Future<CartSummaryData> cartSummary() async {
  final http.Response response = await http.get(
    Uri.parse('https://poshrobe.com/cart/cart_display'),
  );
  late CartSummaryData data;
  if (response.statusCode == 200) {
    var dataJson = json.decode(response.body);
    data = CartSummaryData.fromJson(dataJson);
  }
  return data;
}


Future<List<Product>> getRecommendedProducts() async {
  final http.Response response = await http.get(
    Uri.parse('https://poshrobe.com/home/homepage_recommended_products'),
  );
  var products = <Product>[];
  if (response.statusCode == 200) {

    var productJson = json.decode(response.body);
    products= List<Product>.from(productJson.map((model)=> Product.fromJson(model)));
  }
  return products;
}