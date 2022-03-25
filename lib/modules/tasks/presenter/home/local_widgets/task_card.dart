import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/core/utils/constants.dart';
import 'package:todo_app/modules/tasks/data/models/task_model.dart';
import 'package:todo_app/modules/tasks/presenter/home/local_widgets/task_check_box.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    required this.task,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final TaskModel task;
  final Function(TaskModel task)? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(DEFAULT_PADDING),
      margin: EdgeInsets.symmetric(vertical: DEFAULT_PADDING / 2),
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
