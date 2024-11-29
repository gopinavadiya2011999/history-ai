import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:history_ai/infrastructure/constant/color_constant.dart';
import 'package:history_ai/infrastructure/constant/image_constant.dart';
import 'package:history_ai/infrastructure/firestore/firebase_methods.dart';
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
                  suffixIcon: CommonInkwell(
                      onTap: () {}, child: Container(margin: const EdgeInsets.only(right: 10, left: 8), child: SvgPicture.asset(ImageConstant.send))),
                  controller: controller.messageController,
                ),
              ),
              const SizedBox(width: 8),
              CommonInkwell(
                onTap: () async {

                  await FirebaseMethods.writeData();
                  await FirebaseMethods.fetchAllCategories();

                },
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
