import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:history_ai/infrastructure/constant/color_constant.dart';
import 'package:history_ai/infrastructure/constant/image_constant.dart';
import 'package:history_ai/infrastructure/routes/route_constants.dart';
import 'package:history_ai/ui/common_widgets/common_inkwell.dart';
import 'package:history_ai/ui/common_widgets/headline_body_text.dart';
import 'package:history_ai/ui/main_screen/sub_files/menu_view.dart';

class AppbarProfileRow extends StatelessWidget {
  const AppbarProfileRow({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonInkwell(
      onTap: () {
        Get.toNamed(RouteConstants.createCharacter);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 20,
              child: Image.asset("assets/pngs/user_profile.png"),
            ),
            const SizedBox(width: 10),
            HeadlineBodyOneBaseWidget(
              title: "Titik Ceria",
              style: GoogleFonts.inter(color: ColorConstants.black11, fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            CommonInkwell(
                onTap: () {
                  Get.to(const MenuView(),
                      transition: Transition.rightToLeftWithFade, // Add a transition here
                      duration: const Duration(milliseconds: 500));
                },
                child: SvgPicture.asset(ImageConstant.menu))
          ],
        ),
      ),
    );
  }
}
