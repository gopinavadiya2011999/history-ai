
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:history_ai/infrastructure/constant/color_constant.dart';
import 'package:history_ai/infrastructure/constant/image_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_ai/ui/chat/sub_widgets/send_message_view.dart';
import 'package:history_ai/ui/chat/sub_widgets/user_own_chat_view.dart';
import 'package:history_ai/ui/chat/sub_widgets/welcome_chat_view.dart';
import 'package:history_ai/ui/common_widgets/common_inkwell.dart';
import 'package:history_ai/ui/common_widgets/common_profile_view.dart';
import 'package:history_ai/ui/common_widgets/headline_body_text.dart';
import 'package:history_ai/ui/main_screen/main_controller.dart';
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
                        CommonInkwell(
                            onTap: () {
                              if (Get.put(MainController()).userModel != null) {
                                Get.put(MainController()).editData();
                              }
                            },
                            child: const WelcomeChatView()),
                        Expanded(
                          child: controller.response != null
                              ? SingleChildScrollView(
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 14),
                                    child: Column(
                                      children: [
                                        const UserOwnChatView(),
                                        const SizedBox(height: 24),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            if (controller.selectedUser != null && controller.selectedUser!.photo != null)
                                              CommonInkwell(
                                                  onTap: () {
                                                    if(controller.selectedUser!=null){
                                                      Get.back();
                                                    }
                                                  },
                                                  child: CommonProfileView(imageUrl: controller.selectedUser!.photo, height: 40, width: 40)),
                                            if (controller.selectedUser == null || controller.selectedUser!.photo == null)
                                              CircleAvatar(
                                                  radius: 22, backgroundColor: Colors.transparent, child: SvgPicture.asset(ImageConstant.appLogo)),
                                            const SizedBox(width: 8),
                                            Expanded(
                                              child: Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                                                decoration: BoxDecoration(
                                                    border: Border.all(color: ColorConstants.black11),
                                                    borderRadius: const BorderRadius.only(
                                                        bottomRight: Radius.circular(16),
                                                        bottomLeft: Radius.circular(16),
                                                        topRight: Radius.circular(16))),
                                                child: Markdown(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  physics: const NeverScrollableScrollPhysics(),
                                                  data: controller.response ?? "",
                                                  selectable: true,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 20),
                                      ],
                                    ),
                                  ),
                                )
                              : Center(
                                  child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Lottie.asset(ImageConstant.aiBot, height: 150, width: 150, fit: BoxFit.fill),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        if (controller.selectedUser != null) ...[
                                          CommonInkwell(
                                            onTap: () {
                                              Get.back();
                                            },
                                            child: CommonProfileView(imageUrl: controller.selectedUser!.photo, height: 35, width: 35),
                                          ),
                                          const SizedBox(width: 5)
                                        ],
                                        HeadlineBodyOneBaseWidget(
                                          title: controller.selectedUser != null
                                              ? "Talk with ${controller.selectedUser!.name.split(" ").first}..."
                                              : "Search something ...",
                                          style: GoogleFonts.inter(fontSize: 14, color: ColorConstants.black, fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                        )
                      ],
                    ),
                  ),
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
