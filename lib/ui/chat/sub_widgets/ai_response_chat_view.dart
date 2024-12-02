import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:history_ai/infrastructure/constant/color_constant.dart';
import 'package:history_ai/infrastructure/constant/image_constant.dart';
import 'package:history_ai/ui/chat/chat_controller.dart';
import 'package:history_ai/ui/common_widgets/headline_body_text.dart';

class AiResponseChatView extends StatelessWidget {
  const AiResponseChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<ChatController>(
        init: ChatController(),
        builder: (controller) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: Colors.transparent,
                child: SvgPicture.asset(ImageConstant.appLogo),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 16),
                    decoration: BoxDecoration(
                        border: Border.all(color: ColorConstants.black11),
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(16),
                            bottomLeft:Radius.circular(16),
                            topRight: Radius.circular(16)
                        )
                    ),
                  child: const HeadlineBodyOneBaseWidget(
                    title:"Lombok adalah pulau indah di Indonesia yang terkenal dengan keindahan alamnya, termasuk pantai-pantai yang menakjubkan. Selain pemandangan alamnya, Lombok juga memiliki beragam kuliner lezat yang patut dicoba. Berikut beberapa makanan enak yang bisa Anda nikmati di Lombok Ayam Taliwang Sate rembig Plecing kankung Beberuk Sate bulayak",
                    titleColor: ColorConstants.black11,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ),


            ],
          );
        }
    );
  }
}
