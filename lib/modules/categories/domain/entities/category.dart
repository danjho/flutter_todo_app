class Category {
  Category({
    this.id = '',
    this.name = '',
    this.color = '',
    this.totalTasks = 0,
    this.totalDoneTasks = 0,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['id'],
        name: json['name'],
        color: json['color'],
        totalTasks: json['totalTasks'],
        totalDoneTasks: json['totalDoneTasks'],
      );

  String id;
  String name;
  String color;
  int totalTasks;
  int totalDoneTasks;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'color': color,
        'totalTasks': totalTasks,
        'totalDoneTasks': totalDoneTasks,
      };

  static List<Category> fromList(List list) {
    return List<Category>.from(list.map((x) => Category.fromJson(x)));
  }
}
