import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:todo_app/core/utils/constants.dart';
import 'package:todo_app/modules/categories/domain/entities/category.dart';
import 'package:todo_app/modules/tasks/domain/entities/task.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    required this.category,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final Category category;
  final Function(Task task)? onTap;
  final double radius = 10;

  @override
  Widget build(BuildContext context) {
    final totalTasks = category.totalTasks;
    final doneTasks = category.totalDoneTasks;
    final isNaN = totalTasks == 0 && doneTasks == 0;
    double percent = isNaN ? 0 : doneTasks / totalTasks;
    
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
              '$totalTasks tasks',
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
              percent: percent,
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
