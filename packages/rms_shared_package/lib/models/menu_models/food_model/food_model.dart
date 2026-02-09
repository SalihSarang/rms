import 'package:rms_shared_package/models/menu_models/add_ons_model/add_ons_model.dart';
import 'package:rms_shared_package/models/menu_models/category_model/category_model.dart';
import 'package:rms_shared_package/models/menu_models/portions_and_price/portions_and_price.dart';

class FoodModel {
  final String name;
  final String description;
  final String imageUrl;
  final bool isAvailable;
  final bool isFeatured;
  final bool isVeg;
  final bool isCustomNotes;
  final CategoryModel category;
  final List<PortionAndPrice> portions;
  final List<AddOnsModel> addOns;

  FoodModel({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.category,
    required this.isAvailable,
    required this.isFeatured,
    required this.portions,
    required this.addOns,
    required this.isVeg,
    required this.isCustomNotes,
  });

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      name: json['name'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      category: CategoryModel.fromMap(json['category']),
      isAvailable: json['isAvailable'],
      isFeatured: json['isFeatured'],
      portions: json['portions'],
      addOns: json['addOns'],
      isVeg: json['isVeg'],
      isCustomNotes: json['isCustomNotes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'category': category,
      'isAvailable': isAvailable,
      'isFeatured': isFeatured,
      'portions': portions,
      'addOns': addOns,
      'isVeg': isVeg,
      'isCustomNotes': isCustomNotes,
    };
  }
}
