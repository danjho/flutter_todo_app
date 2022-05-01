import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/presenter/categories/list/category_management_controller.dart';
import 'package:todo_app/core/utils/constants.dart';
import 'package:todo_app/themes/app_colors.dart';

class CategoryManagementPage extends GetView<CategoryManagementController> {
  const CategoryManagementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(DEFAULT_PADDING),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              IconButton(
                onPressed: Get.back,
                alignment: AlignmentDirectional.centerStart,
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.grey,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.all(DEFAULT_PADDING * 2),
                    child: Text(
                      'Categories management',
                      style: Get.textTheme.titleLarge?.copyWith(
                        color: AppColors.welcomeTextColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Obx(() {
                    if (controller.$isLoading()) {
                      return SizedBox(
                          height: 200,
                          child: Center(child: CircularProgressIndicator()));
                    }

                    return Column(
                      children: [
                        ...controller.categories.map((c) {
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundColor: c.color,
                              radius: 10,
                            ),
                            title: Text(c.name),
                            subtitle: Text('Total tasks: ${c.totalTasks}'),
                            trailing: PopupMenuButton(
                              child: Icon(Icons.more_vert_outlined),
                              itemBuilder: (_) {
                                return [
                                  _buildMenuItem('Edit', Icons.edit, 0),
                                  _buildMenuItem('Delete', Icons.delete, 1),
                                ];
                              },
                            ),
                          );
                        }).toList(),
                        TextButton(
                          onPressed: () {},
                          child: Text('Add new category'),
                        ),
                      ],
                    );
                  })
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  PopupMenuItem _buildMenuItem(String title, IconData icon, int value) {
    return PopupMenuItem(
      value: value,
      padding: EdgeInsets.zero,
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
      ),
    );
  }
}
