import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/data/repositories/categories/category_repository.dart';
import 'package:todo_app/app/presenter/categories/crud/category_crud_controller.dart';
import 'package:todo_app/core/utils/constants.dart';
import 'package:todo_app/core/validations/empty_fild_validation.dart';

class CategoryCrudDialog {
  static Future<void> show(BuildContext context) async {
    await Get.dialog(GetX<CategoryCrudController>(
        init: CategoryCrudController(Get.find<CategoryRepository>()),
        builder: (controller) {
          return _dialog(context, controller);
        }));
  }

  static Widget _dialog(BuildContext context, CategoryCrudController ctrl) {
    var bgColor = Theme.of(context).scaffoldBackgroundColor;
    var border = OutlineInputBorder(
      borderSide: BorderSide(color: bgColor),
      borderRadius: BorderRadius.circular(8),
    );

    return SimpleDialog(
      contentPadding: const EdgeInsets.all(DEFAULT_PADDING),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Text('Create new category'),
      children: [
        Column(
          children: [
            if (ctrl.$isLoading())
              SizedBox(
                height: 190,
                child: Center(child: CircularProgressIndicator()),
              )
            else
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildTextField(ctrl, bgColor, border),
                  const SizedBox(height: DEFAULT_PADDING),
                  Text(
                    'Category color',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: DEFAULT_PADDING / 2),
                  _buildColorPicker(ctrl),
                  _buildActionButtonsRow(ctrl),
                ],
              ),
          ],
        ),
      ],
    );
  }

  static Row _buildActionButtonsRow(CategoryCrudController ctrl) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(child: Text('Cancel'), onPressed: Get.back),
        const SizedBox(width: DEFAULT_PADDING),
        TextButton(child: Text('SAVE'), onPressed: ctrl.save),
      ],
    );
  }

  static ColorPicker _buildColorPicker(CategoryCrudController controller) {
    double size = 28;
    return ColorPicker(
      width: size,
      height: size,
      padding: EdgeInsets.zero,
      color: Colors.grey,
      borderRadius: size / 2,
      enableShadesSelection: false,
      onColorChanged: (c) => controller.dto.color = c,
      pickersEnabled: const <ColorPickerType, bool>{
        ColorPickerType.primary: false,
        ColorPickerType.accent: true,
      },
    );
  }

  static Widget _buildTextField(
    CategoryCrudController controller,
    Color bgColor,
    OutlineInputBorder border,
  ) {
    return Form(
      key: controller.formKey,
      child: TextFormField(
        initialValue: controller.dto.name,
        onChanged: (v) => controller.dto.name = v,
        maxLength: 30,
        validator: (value) => EmptyFildValidation.validate('Name', value),
        decoration: InputDecoration(
          hintText: 'Category name',
          fillColor: bgColor,
          filled: true,
          border: border,
          enabledBorder: border,
          disabledBorder: border,
          focusedBorder: border,
          focusColor: bgColor,
          contentPadding: EdgeInsets.symmetric(horizontal: DEFAULT_PADDING),
        ),
      ),
    );
  }
}
