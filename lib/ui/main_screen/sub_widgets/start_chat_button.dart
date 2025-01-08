import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:history_ai/infrastructure/constant/color_constant.dart';
import 'package:history_ai/infrastructure/constant/image_constant.dart';
import 'package:history_ai/infrastructure/languages/app_constant.dart';
import 'package:history_ai/infrastructure/routes/route_constants.dart';
import 'package:history_ai/ui/common_widgets/common_inkwell.dart';
import '../../common_widgets/headline_body_text.dart';

class StartChatButton extends StatelessWidget {
  const StartChatButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonInkwell(
      onTap: () => Get.toNamed(RouteConstants.chatScreen)/*Get.toNamed(RouteConstants.askAnything)*/,
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), border: Border.all(color: ColorConstants.black)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HeadlineBodyOneBaseWidget(
                    title: AppConstants.startNewChat.tr,
                    style: GoogleFonts.archivo(color: ColorConstants.black11, fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(width: 8),
                  SvgPicture.asset(ImageConstant.forwardArrow)
                ],
              )),
              SvgPicture.asset(ImageConstant.chatIcon),
            ],
          )),
    );
  }
}
