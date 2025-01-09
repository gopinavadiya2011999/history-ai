import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:history_ai/infrastructure/constant/color_constant.dart';
import 'package:history_ai/infrastructure/constant/image_constant.dart';
import 'package:history_ai/infrastructure/constant/method_constant.dart';
import 'package:history_ai/infrastructure/model/character_model.dart';
import 'package:history_ai/ui/common_widgets/common_inkwell.dart';
import 'package:history_ai/ui/common_widgets/headline_body_text.dart';
import 'package:history_ai/ui/main_screen/main_controller.dart';
import 'package:history_ai/ui/main_screen/sub_files/menu_view.dart';

class AppbarProfileRow extends StatelessWidget {
  const AppbarProfileRow({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
        init: MainController(),
        builder: (controller) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                if (controller.userModel != null)
                  CommonInkwell(
                    onTap: () {
                      controller.editData();
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      padding: const EdgeInsets.only(bottom: 0),
                      decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: ColorConstants.black)),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(charData.where((element) => element.id == controller.userModel?.profilePic).first.photo)),
                    ),
                  ),
                const SizedBox(width: 10),
                if (controller.userModel != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeadlineBodyOneBaseWidget(
                        title: MethodConstant.toTitleCase("Hello,"),
                        style: GoogleFonts.inter(color: ColorConstants.black11, fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      HeadlineBodyOneBaseWidget(
                        title: MethodConstant.toTitleCase("${controller.userModel!.firstName} ${controller.userModel!.lastName}"),
                        style: GoogleFonts.inter(color: ColorConstants.black11.withOpacity(0.8), fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ],
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
          );
        });
  }
}
