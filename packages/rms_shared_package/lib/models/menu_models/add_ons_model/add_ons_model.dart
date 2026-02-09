class AddOnsModel {
  final String name;
  final double price;

  AddOnsModel({required this.name, required this.price});

  factory AddOnsModel.fromJson(Map<String, dynamic> json) {
    return AddOnsModel(name: json['name'], price: json['price']);
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'price': price};
  }
}
