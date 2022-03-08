import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:todo_app/modules/home/ui/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('ToDo APP'),
      ),
    );
  }
}
