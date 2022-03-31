import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:todo_app/core/utils/constants.dart';
import 'package:todo_app/modules/categories/data/models/category_model.dart';
import 'package:todo_app/modules/tasks/data/models/task_model.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    required this.category,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final CategoryModel category;
  final Function(TaskModel task)? onTap;
  final double radius = 10;

  @override
  Widget build(BuildContext context) {
    final totalTasks = category.tasks.length;
    final doneTasks = category.tasks.where((e) => e.done ?? false).length;
    return Card(
      margin: EdgeInsets.all(DEFAULT_PADDING / 2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Container(
        width: 150,
        padding: EdgeInsets.all(DEFAULT_PADDING),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${category.tasks.length} tasks',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey,
                  ),
            ),
            Text(
              category.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            LinearPercentIndicator(
              lineHeight: 4,
              percent: doneTasks / totalTasks,
              progressColor: HexColor(category.color),
              backgroundColor: Colors.grey[300],
              padding: EdgeInsets.zero,
              barRadius: Radius.circular(radius),
            )
          ],
        ),
      ),
    );
  }
}
