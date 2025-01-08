import 'package:history_ai/infrastructure/constant/color_constant.dart';
import 'package:history_ai/ui/common_widgets/headline_body_text.dart';
import 'package:flutter/material.dart';

class ChatAppbar extends StatelessWidget {
  const ChatAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: const HeadlineBodyOneBaseWidget(
        title: "Choose character",
        titleColor: ColorConstants.black11,
        fontSize: 32,
        titleTextAlign: TextAlign.center,

        fontWeight: FontWeight.w700,
      ),
    );
  }
}
