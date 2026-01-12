class ProductModel {
  final int id;
  final String title;
  final dynamic price;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"],
      title: json["title"] ?? "No Title",
      price: json["price"] ?? 0,
    );
  }


  static List<ProductModel> mapList(List<dynamic> data) {
    return data.map((item) => ProductModel.fromJson(item)).toList();
  }
}
