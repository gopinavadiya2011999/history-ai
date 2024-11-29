import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_ai/infrastructure/constant/color_constant.dart';
import 'package:history_ai/ui/chat/chat_controller.dart';
import 'package:history_ai/ui/common_widgets/headline_body_text.dart';

class UserOwnChatView extends StatelessWidget {
  const UserOwnChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<ChatController>(
      init: ChatController(),
      builder: (controller) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 16),
                decoration: BoxDecoration(
                    border: Border.all(color: ColorConstants.black11),
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(16),
                        bottomLeft:Radius.circular(16),
                        topLeft: Radius.circular(16)
                    )
                ),
                child: const HeadlineBodyOneBaseWidget(
                  title:"Beri saya rekomendasi makanan terenak yang ada di Lombok",
                  titleColor: ColorConstants.black11,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(width: 8),
            CircleAvatar(
              radius: 22,
              child: Image.asset("assets/pngs/user_profile.png"),
            ),
          ],
        );
      }
    );
  }
}
