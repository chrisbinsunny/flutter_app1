




import 'package:flutter_app1/fragments/Sample.dart';

class Header {
  final String name;
  final String id;
  final String categoryParent;
  final String categoryDisplayOrder;

  Header({
    required this.id,
    required this.name,
    required this.categoryParent,
    required this.categoryDisplayOrder,
  });

  factory Header.fromJson(Map<String, dynamic> json){
    return Header(
      id: json['id'].toString(),
      name: json['name'].toString(),
      categoryParent: json['category_parent'].toString(),
      categoryDisplayOrder: json['category_display_order'].toString(),
    );
  }
}

class Product {
  final String name;
  final String id;
  final String rentPrice;
  final String salePrice;

  Product({
    required this.id,
    required this.name,
    required this.rentPrice,
    required this.salePrice,
  });

  factory Product.fromJson(Map<String, dynamic> json){
    return Product(
      id: json['prod_id'].toString(),
      name: json['prod_name'].toString(),
      rentPrice: json['prod_rental_price_used'].toString(),
      salePrice: json['prod_sale_price'].toString(),
    );
  }
}

class ProductInfo {
  final String name;
  final String id;
  final String rentPrice;
  final String salePrice;
  final String desc;
  final List<String> images;
  final String security;
  final String brand;
  final String condition;
  final String sku;
  final List<Map<String, String>> filter;
  //final Attributes attributes;

  ProductInfo({
    required this.id,
    required this.name,
    required this.rentPrice,
    required this.salePrice,
    required this.images,
    required this.desc,
    required this.security,
    required this.brand,
    required this.condition,
    required this.sku,
    required this.filter
    //required this.attributes
  });

  factory ProductInfo.fromJson(Map<String, dynamic> json){
    Iterable list = json['images'];
    List<String> images2 = list.map<String>((i) =>
    i['image_file']).toList();
    List filterList = json['filter'][0]['filters'];
    List<Map<String, String>> filter2 = filterList.map<Map<String, String>>((i) =>
    {
      "id":i['filter_id'],
      "name":i['filter_name']
    }).toList();
    return ProductInfo(
      id: json['prod_id'].toString(),
      name: json['prod_name'].toString(),
      rentPrice: json['prod_rental_price_used'].toString().split(".")[0],
      salePrice: json['prod_sale_price'].toString().split(".")[0],
      images: images2,
      desc: json['prod_long_desc'].toString(),
      security: json['prod_rental_security'].toString().split(".")[0],
      brand:  json['brand_name'].toString(),
      condition: json['prod_condition'].toString(),
      sku: json['product_sku'].toString(),
      filter: filter2
      //attributes: Attributes.fromJson(json['attribute_groups'][0])
    );
  }
}

class Attributes {
  final String name;
  final List attribute;

  Attributes({
    required this.attribute,
    required this.name,
  });

  factory Attributes.fromJson(Map<String, dynamic> json){
    // Iterable list = json['attribute'];
    // print(list.toString());
    // List attribute2 = list.map((i) =>
    // i
    // ).toList();
    return Attributes(
      attribute: json['attribute'],
      name: json['name'].toString(),
    );
  }
}

class CartSummaryData {
  final String price;
  final String total;
  final String tax;
  final String rentalSecurity;
  //final List<Product> products;

  CartSummaryData({
    required this.total,
    required this.price,
    required this.tax,
    required this.rentalSecurity,
    //required this.products
  });

  factory CartSummaryData.fromJson(Map<String, dynamic> json){
    // Iterable list = json['images'];
    // List<String> images2 = list.map<String>((i) =>
    // i['image_file']).toList();
    return CartSummaryData(
      total: json['cart_summary']['total_include_shipping_charge'].toString(),
      price: json['cart_summary']['cart_product_price_total'].toString(),
      tax: json['cart_summary']['cart_tax_total'].toString(),
      rentalSecurity: json['cart_summary']['rental_security'].toString(),

    );
  }
}