




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