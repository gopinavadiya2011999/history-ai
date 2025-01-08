import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_ai/infrastructure/constant/color_constant.dart';
import 'package:history_ai/infrastructure/languages/app_constant.dart';
import 'package:history_ai/infrastructure/model/hostory_model.dart';
import 'package:history_ai/infrastructure/routes/route_constants.dart';
import 'package:history_ai/ui/chat/chat_controller.dart';
import 'package:history_ai/ui/common_widgets/common_button.dart';
import 'package:history_ai/ui/common_widgets/common_inkwell.dart';
import 'package:history_ai/ui/common_widgets/common_text_field.dart';
import 'package:history_ai/ui/main_screen/sub_widgets/ask_anything_app_bar.dart';
import 'package:history_ai/ui/person/search_by_person_controller.dart';

class ChooseOwnPersonView extends StatelessWidget {
  const ChooseOwnPersonView({super.key});
  static final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchByPersonController>(
      init: SearchByPersonController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              width: double.infinity,
              height: double.infinity,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const AskAnythingAppBar(),
                    const SizedBox(height: 50),
                    Expanded(
                        child: SingleChildScrollView(
                      child: Column(
                        children: [
                          CommonInkwell(
                            onTap: () async {

                            },
                            child: SizedBox(
                                height: 100,
                                width: 108,
                                child: Stack(
                                  children: [
                                    Positioned(
                                        width: 100,
                                        height: 100,
                                        child: Container(
                                          decoration: BoxDecoration(border: Border.all(color: ColorConstants.grey8B), shape: BoxShape.circle),
                                          child: ClipRRect(
                                              borderRadius: BorderRadius.circular(100),
                                              child:const Icon(Icons.person)),
                                        )),
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
                              prefixIcon: const SizedBox(width: 15),
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return AppConstants.nameError.tr;
                                }
                                return null;
                              },
                              controller: controller.nameController,
                              hintText: AppConstants.nameHint.tr),
                          const SizedBox(height: 10),
                          CommonTextField(
                              prefixIcon: const SizedBox(width: 15),
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return AppConstants.descHint.tr;
                                }
                                return null;
                              },
                              controller: controller.descController,
                              hintText: AppConstants.descHint.tr),
                          const SizedBox(height: 10),
                          CommonTextField(
                              prefixIcon: const SizedBox(width: 15),
                              controller: controller.categoryController,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return AppConstants.enterCat.tr;
                                }
                                return null;
                              },
                              hintText: AppConstants.addCatHint.tr),
                          const SizedBox(height: 30),
                          CommonButton(
                            buttonText: "Done",
                            textColor: ColorConstants.black11,
                            fillColor: ColorConstants.green6BB,
                            onTap: () {
                              if (_formKey.currentState!.validate() /*&& controller.file != null*/) {
                                ChatController chatController = Get.put(ChatController());
                                chatController.selectedCategory = Category(
                                    id: DateTime.now().microsecondsSinceEpoch.toString(),
                                    name: controller.categoryController.text.trim(),
                                    subCategory: []);
                                chatController.selectedUser = User(
                                    name: controller.nameController.text.trim(),
                                    userDesc: controller.descController.text.trim(),
                                    photo: ""/*controller.file!.path*/,
                                    userId: DateTime.now().microsecondsSinceEpoch.toString());
                                chatController.update();
                                if (chatController.selectedUser != null && chatController.selectedCategory != null) {
                                  Get.toNamed(RouteConstants.chatScreen);
                                }
                              } else {
                                // if (controller.file == null) {
                                //   showTopToast(msg: "Please select your fav user profile.", context: context);
                                // }
                              }
                            },
                          )
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
