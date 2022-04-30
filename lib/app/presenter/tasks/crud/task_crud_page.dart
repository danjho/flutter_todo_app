import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/domain/entities/category.dart';
import 'package:todo_app/app/presenter/tasks/crud/local_widgets/tag_card.dart';
import 'package:todo_app/app/presenter/tasks/crud/task_crud_controller.dart';
import 'package:todo_app/core/extensions/date_time_ext.dart';
import 'package:todo_app/core/utils/constants.dart';
import 'package:todo_app/core/utils/position.dart';

class TaskCrudPage extends GetView<TaskCrudController> {
  const TaskCrudPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      if (controller.isLoading) {
        return Center(child: CircularProgressIndicator());
      }

      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: DEFAULT_PADDING * 3,
          vertical: DEFAULT_PADDING * 3,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildCloseButton(),
            Expanded(
              child: Column(
                children: [
                  Spacer(flex: 2),
                  _buildTextField(context),
                  const SizedBox(height: DEFAULT_PADDING),
                  Row(
                    children: [
                      _buildDateButton(context),
                      const SizedBox(width: DEFAULT_PADDING / 2),
                      _buildCategoryButton(context),
                    ],
                  ),
                  Spacer(),
                  _buildButtonsRow(),
                  Spacer(),
                ],
              ),
            ),
            _buildSaveButton(context),
          ],
        ),
      );
    }));
  }

  Row _buildButtonsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.create_new_folder_outlined,
          color: Colors.grey[400],
        ),
        const SizedBox(width: DEFAULT_PADDING * 2),
        Icon(
          Icons.flag_outlined,
          color: Colors.grey[400],
        ),
        const SizedBox(width: DEFAULT_PADDING * 2),
        Icon(
          Icons.notifications_off_outlined,
          color: Colors.grey[400],
        ),
      ],
    );
  }

  TextFormField _buildTextField(BuildContext context) {
    return TextFormField(
      maxLines: 2,
      initialValue: controller.dto.title,
      onChanged: (v) => controller.dto.title = v,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        labelStyle: Theme.of(context).textTheme.titleLarge,
        hintStyle: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(color: Colors.grey[400]!),
        hintText: 'Enter new task',
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
    );
  }

  Widget _buildDateButton(BuildContext context) {
    return TagCard(
      child: Row(
        children: [
          Icon(Icons.calendar_month, size: 16, color: Colors.grey),
          SizedBox(width: DEFAULT_PADDING / 4),
          Text(
            controller.selectedDate.toStringValue(),
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall,
          )
        ],
      ),
      onPressed: () async {
        final selectedDate = await showDatePicker(
          context: context,
          initialDate: controller.dto.date,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(
            Duration(days: 365),
          ),
        );
        if (selectedDate != null) {
          controller.selectedDate = selectedDate;
        }
      },
    );
  }

  Widget _buildCategoryButton(BuildContext context) {
    final key = GlobalKey();
    return TagCard(
      key: key,
      onPressed: () async {
        final selectedCategory = await showMenu<Category>(
            context: context,
            position: Position.getWidgetPosition(key),
            items: [
              PopupMenuItem(child: Text('Sem categoria')),
              ...controller.categories.map((e) {
                return PopupMenuItem<Category>(
                  value: e,
                  child: Text(e.name));
              }).toList(),
            ]);
        if (selectedCategory != null) {
          controller.selectedCategory = selectedCategory;
        }
      },
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: controller.selectedCategory.color,
            maxRadius: 6,
          ),
          SizedBox(width: DEFAULT_PADDING / 4),
          Text(
            controller.selectedCategory.name,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  Widget _buildCloseButton() {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: IconButton(
        onPressed: Get.back,
        icon: Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey[400]!),
          ),
          child: Icon(Icons.close_rounded, size: 24),
        ),
      ),
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Theme.of(context).primaryColor,
          padding: EdgeInsets.symmetric(
            horizontal: DEFAULT_PADDING * 2,
            vertical: DEFAULT_PADDING,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        ),
        onPressed: controller.saveTask,
        child: Text('Save task'),
      ),
    );
  }
}
