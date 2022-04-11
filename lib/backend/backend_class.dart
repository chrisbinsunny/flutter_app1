




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
      rentPrice: json['prod_rental_price'].toString(),
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
  final Attributes attributes;

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
    required this.attributes
  });

  factory ProductInfo.fromJson(Map<String, dynamic> json){
    Iterable list = json['images'];
    List<String> images2 = list.map<String>((i) =>
    i['image_file']).toList();
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
      attributes: Attributes.fromJson(json['attribute_groups'][0])
    );
  }
}

class Attributes {
  final String name;
  final List<Map<String, String>> attribute;

  Attributes({
    required this.attribute,
    required this.name,
  });

  factory Attributes.fromJson(Map<String, dynamic> json){
    print("lol");
    return Attributes(
      attribute: json['attribute'] as List<Map<String, String>>,
      name: json['name'].toString(),
    );
  }
}