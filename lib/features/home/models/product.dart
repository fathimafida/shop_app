class Product {
  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.image,
  });
  late final int id;
  late final String name;
  late final int price;
  late final String description;
  late final String image;

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['price'] = price;
    _data['description'] = description;
    _data['image'] = image;
    return _data;
  }
}
