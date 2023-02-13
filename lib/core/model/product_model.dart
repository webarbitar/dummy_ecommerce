class ProductModel {
  int? id;
  String title;
  String description;
  int? price;
  double discountPercentage;
  double rating;
  int stock;
  String brand;
  String category;
  String thumbnail;
  List<String> images;

  ProductModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? "0",
        title = json['title'] ?? "",
        description = json['description'] ?? "",
        price = json['price'] ?? 0,
        discountPercentage = json['discountPercentage'] ?? 0,
        rating = (json['rating'] ?? 0).toDouble(),
        stock = json['stock'] ?? 0,
        brand = json['brand'] ?? "",
        category = json['category'] ?? "",
        thumbnail = json['thumbnail'] ?? "",
        images = (json['images'] ?? []).cast<String>();

  static List<ProductModel> jsonToList(List json) {
    return json.map((e) {
      return ProductModel.fromJson(e);
    }).toList();
  }
}
