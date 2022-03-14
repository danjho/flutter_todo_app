import 'package:todo_app/modules/categories/domain/entities/category.dart';

class CategoryModel extends Category {
  CategoryModel({
    required String id,
    required String name,
    required String color,
  }) : super(id: id, name: name, color: color);

  factory CategoryModel.fromJson(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      color: map['color'] ?? '',
    );
  }

  Map<String, dynamic> toJsom() {
    return {
      'id': id,
      'name': name,
      'color': color,
    };
  }
}
