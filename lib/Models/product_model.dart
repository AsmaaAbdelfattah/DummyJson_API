class ProductModel {
  final int id;
  final String title;
  final dynamic price;
  final String image;
  final double rating;
  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"],
      title: json["title"] ?? "No Title",
      price: json["price"] ?? 0,
      image: json["thumbnail"] ?? "https://via.placeholder.com/150",
      rating: json["rating"] ?? 0,
    );
  }


  static List<ProductModel> mapList(List<dynamic> data) {
    return data.map((item) => ProductModel.fromJson(item)).toList();
  }
}
