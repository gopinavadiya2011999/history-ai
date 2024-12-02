import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:history_ai/infrastructure/constant/color_constant.dart';
import 'package:history_ai/infrastructure/constant/image_constant.dart';
import 'package:history_ai/ui/common_widgets/common_icon_btn.dart';
import 'package:history_ai/ui/common_widgets/common_inkwell.dart';
import 'package:history_ai/ui/common_widgets/headline_body_text.dart';
import 'package:history_ai/ui/main_screen/sub_files/menu_view.dart';

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
        CommonInkwell(
            onTap: () {
              Get.to(const MenuView(),
                  transition: Transition.rightToLeftWithFade, // Add a transition here
                  duration: const Duration(milliseconds: 500));
            },
            child: SvgPicture.asset(ImageConstant.menu))      ],
    );
  }
}
