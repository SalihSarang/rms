class PortionAndPrice {
  final String name;
  final double price;

  PortionAndPrice({required this.name, required this.price});

  factory PortionAndPrice.fromJson(Map<String, dynamic> json) {
    return PortionAndPrice(name: json['name'], price: json['price']);
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'price': price};
  }
}
