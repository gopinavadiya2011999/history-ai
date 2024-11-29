import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:history_ai/infrastructure/constant/color_constant.dart';
import 'package:history_ai/infrastructure/constant/image_constant.dart';
import 'package:history_ai/infrastructure/languages/app_constant.dart';
import 'package:history_ai/ui/common_widgets/headline_body_text.dart';

class CommonLogoTextView extends StatelessWidget {
  const CommonLogoTextView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(ImageConstant.appLogo),
        const SizedBox(width: 10),
        HeadlineBodyOneBaseWidget(
          title: AppConstants.appTitle.tr,
      style: GoogleFonts.plusJakartaSans(
        fontSize: 20,
        color: ColorConstants.black11,
        fontWeight: FontWeight.w600,
      ),
        )
      ],
    );
  }
}
