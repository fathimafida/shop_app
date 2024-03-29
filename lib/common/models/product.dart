class Product {
  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });
  late final int id;
  late final String title;
  late final double price; // Ensure this is a double
  late final String description;
  late final String category;
  late final String image;
  late final Rating rating;

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'] is double
        ? json['price']
        : double.tryParse(json['price'].toString()) ??
            0.0; // Parse price to double
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating = Rating.fromJson(json['rating']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['price'] = price;
    _data['description'] = description;
    _data['category'] = category;
    _data['image'] = image;
    _data['rating'] = rating.toJson();
    return _data;
  }
}

class Rating {
  Rating({
    required this.rate,
    required this.count,
  });
  late final double rate; // Ensure this is a double
  late final int count;

  Rating.fromJson(Map<String, dynamic> json) {
    rate = json['rate'] is double
        ? json['rate']
        : double.tryParse(json['rate'].toString()) ??
            0.0; // Parse rate to double
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['rate'] = rate;
    _data['count'] = count;
    return _data;
  }
}
