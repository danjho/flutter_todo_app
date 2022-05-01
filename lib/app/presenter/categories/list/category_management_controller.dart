import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/domain/entities/category.dart';
import 'package:todo_app/app/domain/interfaces/i_category_repository.dart';
import 'package:todo_app/app/domain/use_cases/categories/get_all_categories.dart';
import 'package:todo_app/core/errors/errors.dart';

class CategoryManagementController extends GetxController {
  CategoryManagementController(this.categoryRepo);

  final ICategoryRepository categoryRepo;

  final RxBool $isLoading = false.obs;
  List<Category> categories = [];

  @override
  void onReady() {
    _fetchAll();
    super.onReady();
  }

  Future<void> _fetchAll() async {
    $isLoading(true);

    final getAll = GetAllCategories(repo: categoryRepo);
    final res = await getAll();

    if (res.isLeft()) {
      final error = res.fold(id, id) as Failure;
      Get
        ..back()
        ..showSnackbar(GetSnackBar(
          message: error.message ?? 'Unexpected error',
        ));
      return;
    }

    categories = res.fold(id, id) as List<Category>;
    $isLoading(false);
  }
}
