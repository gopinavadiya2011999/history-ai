import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_ai/infrastructure/constant/color_constant.dart';
import 'package:history_ai/infrastructure/model/hostory_model.dart';
import 'package:history_ai/ui/common_widgets/common_inkwell.dart';
import 'package:history_ai/ui/common_widgets/common_text_field.dart';
import 'package:history_ai/ui/main_screen/main_controller.dart';
import 'package:history_ai/ui/main_screen/sub_widgets/common_title_add_view.dart';

class AddUsersView extends StatelessWidget {
  const AddUsersView({super.key, required this.subCatItem});
  final SubCategoryTextField subCatItem;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
        init: MainController(),
        builder: (controller) {
          return ListView.builder(
            itemCount: subCatItem.userTextField.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              UsersTextField userItem = subCatItem.userTextField[index];
              return Column(
                children: [
                  const SizedBox(height: 10),
                  CommonTitleAddView(
                    bgColor: ColorConstants.greenEF,
                    onDeleteTap: () {
                      subCatItem.userTextField.remove(userItem);
                      controller.update();
                    },
                    isDelete: subCatItem.userTextField.length != 1,
                    onAddTap: () {
                      subCatItem.userTextField.add(UsersTextField(userName: TextEditingController(), desc: TextEditingController()));
                      controller.update();
                    },
                    title: "Users",
                    onTap: () {
                      userItem.isSelected = !userItem.isSelected;
                      controller.update();
                    },
                    isSelected: userItem.isSelected,
                  ),
                  if (userItem.isSelected)
                    Column(
                      children: [
                        CommonInkwell(
                          onTap: () {},
                          child: SizedBox(
                              height: 100,
                              width: 108,
                              child: Stack(
                                children: [
                                  Positioned(
                                      width: 100,
                                      height: 100,
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(100),
                                          child: Image.network('https://picsum.photos/200/300', fit: BoxFit.cover))),
                                  Positioned(
                                      right: 0,
                                      top: 0,
                                      child: Container(
                                        decoration: const BoxDecoration(color: ColorConstants.black11, shape: BoxShape.circle),
                                        padding: const EdgeInsets.all(8),
                                        child: const Icon(Icons.add, color: Colors.white, size: 18),
                                      ))
                                ],
                              )),
                        ),
                        const SizedBox(height: 20),
                        CommonTextField(
                            controller: userItem.userName,
                            prefixIcon: const SizedBox(width: 15),
                            hintText: "Enter your choice of name"),
                        const SizedBox(height: 10),
                        CommonTextField(
                            prefixIcon: const SizedBox(width: 15), controller: userItem.desc, hintText: "Enter descriptive detail"),
                        const SizedBox(height: 10),
                      ],
                    )
                ],
              );
            },
          );
        });
  }
}
