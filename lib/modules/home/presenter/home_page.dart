import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:todo_app/core/utils/constants.dart';
import 'package:todo_app/modules/home/presenter/home_controller.dart';

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

        return ListView(
          padding: EdgeInsets.all(DEFAULT_PADDING),
          children: controller.tasks.map((e) {
            return ListTile(title: Text(e.title));
          }).toList(),
        );
      }),
    );
  }
}
