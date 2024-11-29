import 'package:history_ai/infrastructure/constant/image_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_ai/ui/chat/sub_widgets/send_message_view.dart';
import 'package:history_ai/ui/chat/sub_widgets/user_own_chat_view.dart';
import 'package:history_ai/ui/chat/sub_widgets/welcome_chat_view.dart';
import 'package:history_ai/ui/main_screen/sub_widgets/ask_anything_app_bar.dart';
import 'chat_controller.dart';
import 'sub_widgets/ai_response_chat_view.dart';

class ChatScreen extends GetView<ChatController> {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(
      init: ChatController(),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage(ImageConstant.homeBg), fit: BoxFit.fill)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const AskAnythingAppBar(),
                  Expanded(
                      child: Column(
                    children: [
                      const WelcomeChatView(),
                      Expanded(
                          child: SingleChildScrollView(
                        child: Container(
                          margin: const EdgeInsets.only(top: 14),
                          child: const Column(
                            children: [
                              UserOwnChatView(),
                              SizedBox(height: 24),
                              AiResponseChatView(),
                              SizedBox(height: 24),

                            ],
                          ),
                        ),
                      ))
                    ],
                  )),
                  const SendMessageView(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
