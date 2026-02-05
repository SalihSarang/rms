class CategoryModel {
  final String id;
  final String name;
  final int sortOrder;
  final bool isActive;

  CategoryModel({
    required this.id,
    required this.name,
    required this.sortOrder,
    required this.isActive,
  });

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] as String,
      name: map['name'] as String,
      sortOrder: map['sortOrder'] ?? 0,
      isActive: map['isActive'] ?? true,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'sortOrder': sortOrder,
      'isActive': isActive,
    };
  }
}
