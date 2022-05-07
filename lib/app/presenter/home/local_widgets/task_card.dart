import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/app/domain/entities/task.dart';
import 'package:todo_app/app/presenter/home/local_widgets/task_check_box.dart';
import 'package:todo_app/core/utils/constants.dart';

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
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
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
              TaskCheckBox(
                value: task.done,
                color: task.color,
              ),
              const SizedBox(width: DEFAULT_PADDING),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      task.title,
                      style: Get.textTheme.bodyMedium?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        decoration: (task.done)
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    const SizedBox(height: DEFAULT_PADDING / 4),
                    Text(
                      DateFormat.yMEd('pt_Br').format(task.date),
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
