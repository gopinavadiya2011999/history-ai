import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_ai/infrastructure/constant/color_constant.dart';
import 'package:history_ai/infrastructure/model/character_model.dart';
import 'package:history_ai/ui/chat/chat_controller.dart';
import 'package:history_ai/ui/common_widgets/headline_body_text.dart';
import 'package:history_ai/ui/main_screen/main_controller.dart';

class UserOwnChatView extends StatelessWidget {
  const UserOwnChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(
        init: ChatController(),
        builder: (controller) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  decoration: BoxDecoration(
                      border: Border.all(color: ColorConstants.black11),
                      borderRadius:
                          const BorderRadius.only(bottomRight: Radius.circular(16), bottomLeft: Radius.circular(16), topLeft: Radius.circular(16))),
                  child: HeadlineBodyOneBaseWidget(
                    title: controller.message,
                    titleColor: ColorConstants.black11,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                height: 40,
                width: 40,
                padding: const EdgeInsets.only(bottom: 0),
                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: ColorConstants.black.withOpacity(0.5))),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(Get.put(MainController()).userModel != null
                      ? charData.where((element) => element.id == Get.put(MainController()).userModel?.profilePic).first.photo
                      : "assets/pngs/user_profile.png"),
                ),
              ),
            ],
          );
        });
  }
}
