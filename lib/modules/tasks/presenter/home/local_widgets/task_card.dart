import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/core/utils/constants.dart';
import 'package:todo_app/modules/tasks/domain/entities/task.dart';
import 'package:todo_app/modules/tasks/presenter/home/local_widgets/task_check_box.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    required this.task,
    this.onTap,
    this.color,
    Key? key,
  }) : super(key: key);

  final Task task;
  final Color? color;
  final Function(Task task)? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(DEFAULT_PADDING),
      margin: EdgeInsets.symmetric(vertical: DEFAULT_PADDING / 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: InkWell(
        onTap: () => onTap?.call(task),
        child: Row(
          children: [
            TaskCheckBox(value: task.done ?? false),
            const SizedBox(width: DEFAULT_PADDING),
            Text(
              task.title ?? '',
              style: Get.textTheme.bodyMedium?.copyWith(
                color: Colors.black,
                decoration: (task.done ?? false)
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}