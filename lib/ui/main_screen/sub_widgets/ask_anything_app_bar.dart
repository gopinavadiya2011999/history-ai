import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_ai/infrastructure/constant/color_constant.dart';
import 'package:history_ai/ui/common_widgets/common_icon_btn.dart';
import 'package:history_ai/ui/common_widgets/headline_body_text.dart';

class AskAnythingAppBar extends StatelessWidget {
  const AskAnythingAppBar({super.key, this.white = false});
  final bool white;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CommonIconBtn(
          iconData: Icons.arrow_back_ios_new,
          color: white ? ColorConstants.white : ColorConstants.black11,
          onTap: () => Get.back(),
        ),
        Expanded(
          child: HeadlineBodyOneBaseWidget(
            title: "Chat AI",
            titleTextAlign: TextAlign.center,
            titleColor: white ? ColorConstants.white : ColorConstants.black11,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        CommonIconBtn(iconData: Icons.settings, color: white ? ColorConstants.white : ColorConstants.black11),
      ],
    );
  }
}
