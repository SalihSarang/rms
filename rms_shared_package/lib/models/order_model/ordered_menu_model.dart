import 'package:rms_shared_package/models/menu_models/food_model/food_model.dart';

class OrderedMenuModel {
  final FoodModel food;
  final int quantity;
  final double price;

  OrderedMenuModel({
    required this.food,
    required this.quantity,
    required this.price,
  });

  factory OrderedMenuModel.fromJson(Map<String, dynamic> json) {
    return OrderedMenuModel(
      food: FoodModel.fromJson(json['food']),
      quantity: json['quantity'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'food': food, 'quantity': quantity, 'price': price};
  }

  Map<String, dynamic> toKitchenJson() {
    return {'food': food, 'quantity': quantity};
  }
}
