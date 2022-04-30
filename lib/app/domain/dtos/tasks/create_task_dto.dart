class CreateTaskDto {
  CreateTaskDto({
    required this.title,
    required this.date,
    required this.category,
  });

  factory CreateTaskDto.empty() => CreateTaskDto(
        title: '',
        date: DateTime.now(),
        category: '',
      );

  String title;
  DateTime date;
  String category;

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'date': date.toIso8601String(),
      'category': category,
    };
  }
}
