import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_ai/infrastructure/constant/color_constant.dart';
import 'package:history_ai/infrastructure/languages/app_constant.dart';
import 'package:history_ai/infrastructure/routes/route_constants.dart';
import 'package:history_ai/ui/chat/chat_controller.dart';
import 'package:history_ai/ui/common_widgets/common_button.dart';
import 'package:history_ai/ui/common_widgets/common_profile_view.dart';
import 'package:history_ai/ui/common_widgets/headline_body_text.dart';
import 'package:history_ai/ui/main_screen/sub_widgets/ask_anything_app_bar.dart';
import 'package:history_ai/ui/person/search_by_person_controller.dart';

class PersonProfileView extends StatelessWidget {
  const PersonProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchByPersonController>(
        init: SearchByPersonController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: ColorConstants.white,
            body: SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Container(padding: const EdgeInsets.symmetric(horizontal: 24), child: const AskAnythingAppBar()),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        children: [
                          const SizedBox(height: 15),
                          CommonProfileView(
                            imageUrl: controller.selectedUser!.photo,
                            width: 120,
                            height: 120,
                          ),
                          const SizedBox(height: 10),
                          HeadlineBodyOneBaseWidget(
                            title: controller.selectedUser!.name,
                            titleColor: ColorConstants.black11,
                            fontWeight: FontWeight.w600,
                            titleTextAlign: TextAlign.center,
                            fontSize: 20,
                          ),
                          const SizedBox(height: 10),
                          Expanded(
                            child: SingleChildScrollView(
                              child: HeadlineBodyOneBaseWidget(
                                title: controller.selectedUser!.userDesc,
                                titleColor: ColorConstants.grey8B,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    child: CommonButton(
                      buttonText: AppConstants.letsChat.tr,
                      onTap: () {
                        ChatController chatController = Get.put(ChatController());
                        chatController.selectedUser = controller.selectedUser;
                        chatController.message = null;
                        chatController.response = null;
                        chatController.selectedCategory = controller.selectedCategory;
                        chatController.update();
                        Get.toNamed(RouteConstants.chatScreen);
                      },
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          );
        });
  }
}
