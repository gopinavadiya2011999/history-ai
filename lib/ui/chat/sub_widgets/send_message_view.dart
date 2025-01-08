import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:history_ai/infrastructure/apis/get_audio_from_ai.dart';
import 'package:history_ai/infrastructure/constant/color_constant.dart';
import 'package:history_ai/infrastructure/constant/image_constant.dart';
import 'package:history_ai/infrastructure/languages/app_constant.dart';
import 'package:history_ai/ui/chat/chat_controller.dart';
import 'package:history_ai/ui/common_widgets/common_inkwell.dart';
import 'package:history_ai/ui/common_widgets/common_text_field.dart';

class SendMessageView extends StatelessWidget {
  const SendMessageView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(
        init: ChatController(),
        builder: (controller) {
          return Row(
            children: [
              Expanded(
                child: CommonTextField(
                  hintText: AppConstants.sendAMessage.tr,
                  maxLines: 6,
                  radius: 10,
                  suffixIcon: CommonInkwell(
                      onTap: () async {
                        controller.isMessageSending = true.obs;
                        controller.message = controller.messageController.text.trim();
                        controller.update();
                       controller.response= await ApiMethods.getTextFromAI(
                            text: controller.messageController.text.trim(),
                            userName: controller.selectedUser!.name,
                            userDetail: controller.selectedCategory!.name);
                        controller.isMessageSending = false.obs;
                        controller.messageController.clear();
                        controller.update();
                      },
                      child: Container(
                          margin: const EdgeInsets.only(right: 10, left: 8),
                          child: controller.isMessageSending.value
                              ? const CircularProgressIndicator(
                                  color: ColorConstants.black11,
                                  strokeWidth: 3,
                                )
                              : SvgPicture.asset(ImageConstant.send))),
                  controller: controller.messageController,
                ),
              ),
              const SizedBox(width: 8),
              CommonInkwell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: const BoxDecoration(color: ColorConstants.green6BB, shape: BoxShape.circle),
                  child: const Icon(Icons.keyboard_voice_outlined, size: 24),
                ),
              )
            ],
          );
        });
  }
}
