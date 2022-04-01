import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/core/utils/constants.dart';
import 'package:todo_app/modules/tasks/presenter/home/home_controller.dart';
import 'package:todo_app/themes/app_colors.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

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

        return _buildBody(controller);
      }),
    );
  }

  Widget _buildBody(HomeController controller) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Icon(Icons.menu, color: Colors.grey),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.all(DEFAULT_PADDING * 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Bem-vindo, ${controller.user.name!.split(' ')[0]}',
                      style: Get.textTheme.titleLarge?.copyWith(
                        color: AppColors.welcomeTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
