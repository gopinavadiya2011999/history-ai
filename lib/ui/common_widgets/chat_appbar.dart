import 'package:character_ai/inftrastructure/constant/color_constant.dart';
import 'package:character_ai/ui/common_widgets/headline_body_text.dart';
import 'package:character_ai/ui/main_controller.dart';
import 'package:character_ai/ui/onboarding/create_character/create_character_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatAppbar extends StatelessWidget {
  const ChatAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: HeadlineBodyOneBaseWidget(
        title: "Choose character",
        titleColor: ThemeColors.primary(context),
        fontSize: 32,
        titleTextAlign: TextAlign.center,

        fontWeight: FontWeight.w700,
      ),
    );
  }
}
