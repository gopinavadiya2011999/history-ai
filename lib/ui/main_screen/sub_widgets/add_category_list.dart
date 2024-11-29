import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_ai/infrastructure/model/hostory_model.dart';
import 'package:history_ai/ui/common_widgets/common_text_field.dart';
import 'package:history_ai/ui/main_screen/main_controller.dart';
import 'package:history_ai/ui/main_screen/sub_widgets/add_sub_category_view.dart';
import 'package:history_ai/ui/main_screen/sub_widgets/common_title_add_view.dart';

class AddCategoryList extends StatelessWidget {
  const AddCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
        init: MainController(),
        builder: (controller) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: controller.catTextList.length,
            itemBuilder: (context, index) {
              CatListTextField catItem = controller.catTextList[index];
              return Column(
                children: [
                  CommonTitleAddView(
                    onDeleteTap: () {
                      controller.catTextList.removeAt(index);
                      controller.update();
                    },
                    isDelete: controller.catTextList.length != 1,
                    onAddTap: () {
                      controller.catTextList.add(CatListTextField(subCategory: [
                        SubCategoryTextField(
                            subCategory: TextEditingController(),
                            userTextField: [UsersTextField(userName: TextEditingController(), desc: TextEditingController())])
                      ], category: TextEditingController()));
                      controller.update();
                    },
                    title: "Category",
                    onTap: () {
                      catItem.isSelected = !catItem.isSelected;
                      controller.update();
                    },
                    isSelected: catItem.isSelected,
                  ),
                  if (catItem.isSelected)
                    Column(
                      children: [
                        CommonTextField(prefixIcon: const SizedBox(width: 15), controller: catItem.category, hintText: "Enter category"),
                        const SizedBox(height: 10),
                        AddSubCategoryView(catItem: catItem),
                      ],
                    )
                ],
              );
            },
          );
        });
  }
}
