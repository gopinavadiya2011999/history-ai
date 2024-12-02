import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:history_ai/infrastructure/constant/color_constant.dart';
import 'package:history_ai/infrastructure/constant/image_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_ai/ui/chat/sub_widgets/send_message_view.dart';
import 'package:history_ai/ui/chat/sub_widgets/user_own_chat_view.dart';
import 'package:history_ai/ui/chat/sub_widgets/welcome_chat_view.dart';
import 'package:history_ai/ui/common_widgets/headline_body_text.dart';
import 'package:history_ai/ui/main_screen/sub_widgets/ask_anything_app_bar.dart';
import 'package:lottie/lottie.dart';
import 'chat_controller.dart';

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
                          child: Column(
                            children: [
                              const UserOwnChatView(),
                              const SizedBox(height: 24),
                              //AiResponseChatView(),
                              //SizedBox(height: 24),
                              if (controller.response != null)
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: ColorConstants.black11),
                                      borderRadius: const BorderRadius.only(
                                          bottomRight: Radius.circular(16), bottomLeft: Radius.circular(16), topRight: Radius.circular(16))),
                                  child: Markdown(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    data: controller.response!,
                                    selectable: true,
                                  ),
                                )
                              else
                                Center(
                                    child: Container(
                                        margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height / 4.2),
                                        child: Column(
                                          children: [
                                            Lottie.asset(ImageConstant.aiBot, height: 150, width: 150, fit: BoxFit.fill),
                                            const HeadlineBodyOneBaseWidget(title: "Search something ..."),
                                          ],
                                        )))
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
