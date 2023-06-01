class Product {
  String? type;
  String? name;
  List<String>? images;

  Product({
    this.type,
    this.name,
    this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        type: json["type"],
        name: json["name"],
        images: List<String>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "name": name,
        "images": List<dynamic>.from(images!.map((x) => x)),
      };
}
