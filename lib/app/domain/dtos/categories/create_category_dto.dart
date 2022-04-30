class CreateCategoryDto {
  CreateCategoryDto({
    required this.name,
    required this.color,
  });

  String name;
  String color;

  Map<String, dynamic> toJson() {
    return {'name': name, 'color': color};
  }
}
