import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_ai/infrastructure/constant/color_constant.dart';
import 'package:history_ai/infrastructure/languages/app_constant.dart';
import 'package:history_ai/infrastructure/model/hostory_model.dart';
import 'package:history_ai/ui/common_widgets/common_text_field.dart';
import 'package:history_ai/ui/main_screen/main_controller.dart';
import 'package:history_ai/ui/main_screen/sub_widgets/add_users_view.dart';
import 'package:history_ai/ui/main_screen/sub_widgets/common_title_add_view.dart';

class AddSubCategoryView extends StatelessWidget {
  const AddSubCategoryView({super.key, required this.catItem, required this.fromPlace});
final bool fromPlace;
  final CatListTextField catItem;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
        init: MainController(),
        builder: (controller) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: catItem.subCategory.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              SubCategoryTextField subCatItem = catItem.subCategory[index];
              return Column(
                children: [
                  CommonTitleAddView(
                    bgColor: ColorConstants.green6BB.withOpacity(0.5),
                    onDeleteTap: () {
                      catItem.subCategory.remove(subCatItem);
                      controller.update();
                    },
                    isDelete: catItem.subCategory.length != 1,
                    onAddTap: () {
                      catItem.subCategory.add(SubCategoryTextField(
                          subCategory: TextEditingController(),
                          userTextField: [UsersTextField(userName: TextEditingController(), desc: TextEditingController())]));
                      controller.update();
                    },
                    title: AppConstants.subCat.tr,
                    onTap: () {
                      subCatItem.isSelected = !subCatItem.isSelected;
                      controller.update();
                    },
                    isSelected: subCatItem.isSelected,
                  ),
                  if (subCatItem.isSelected)
                    Column(
                      children: [
                        CommonTextField(prefixIcon: const SizedBox(width: 15),
                            validator: (value) {
                              if(value==null || value.trim().isEmpty){
                                return AppConstants.subCatError.tr;
                              }
                              return null;
                            },
                            controller: subCatItem.subCategory, hintText: AppConstants.subCatHint.tr),
                        AddUsersView(subCatItem: subCatItem,fromPlace:fromPlace)
                      ],
                    ),
                ],
              );
            },
          );
        });
  }
}
