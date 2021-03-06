import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/presenter/home/home_controller.dart';
import 'package:todo_app/app/presenter/home/local_widgets/category_card.dart';
import 'package:todo_app/app/presenter/home/local_widgets/task_card.dart';
import 'package:todo_app/core/utils/constants.dart';
import 'package:todo_app/routes/app_routes.dart';
import 'package:todo_app/themes/app_colors.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  final double horizontalPadding = 2 * DEFAULT_PADDING;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.state == HomeState.requesting) {
          return Center(child: CircularProgressIndicator());
        }

        if (controller.state == HomeState.error) {
          return Center(child: Text('Deu erro'));
        }

        return _buildBody(context, controller);
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: controller.newTask,
      ),
    );
  }

  Widget _buildBody(BuildContext context, HomeController controller) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: InkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.categoryManagement);
                },
                child: Icon(Icons.menu, color: Colors.grey)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildWelcomeText(controller),
              _buildCategoryListPanel(context),
              const SizedBox(height: DEFAULT_PADDING * 2),
              _buildTaskListPanel(context),
            ],
          ),
        ],
      ),
    );
  }

  Padding _buildWelcomeText(HomeController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: DEFAULT_PADDING * 2,
        horizontal: horizontalPadding,
      ),
      child: Text(
        'Bem-vindo, ${controller.user?.name.split(' ')[0]}',
        style: Get.textTheme.titleLarge?.copyWith(
          color: AppColors.welcomeTextColor,
          fontWeight: FontWeight.bold,
          fontSize: 28,
        ),
      ),
    );
  }

  Widget _buildCategoryListPanel(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Text(
            'CATEGORIES',
            style: Theme.of(context).textTheme.caption?.copyWith(
                  color: Colors.grey[400],
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        const SizedBox(height: DEFAULT_PADDING),
        SizedBox(
          height: 106,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: DEFAULT_PADDING),
            children: controller.categories.map((c) {
              return CategoryCard(category: c);
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildTaskListPanel(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Text(
            "TODAY'S TASKS",
            style: Theme.of(context).textTheme.caption?.copyWith(
                  color: Colors.grey[400],
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        const SizedBox(height: DEFAULT_PADDING),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: DEFAULT_PADDING),
          child: Column(
            children: controller.tasks.map((t) {
              return TaskCard(
                  task: t,
                  onTap: (t) {
                    t.done = !t.done;
                    controller.updateTask(t);
                  });
            }).toList(),
          ),
        ),
      ],
    );
  }
}
