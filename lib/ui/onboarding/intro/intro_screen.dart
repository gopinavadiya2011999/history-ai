import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:history_ai/infrastructure/constant/color_constant.dart';
import 'package:history_ai/infrastructure/constant/image_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_ai/infrastructure/languages/app_constant.dart';
import 'package:history_ai/ui/common_widgets/common_inkwell.dart';
import 'package:history_ai/ui/onboarding/intro/intro_controller.dart';
import 'package:history_ai/ui/onboarding/intro/open_account.dart';
import 'package:history_ai/ui/onboarding/widgets/common_animated_text_view.dart';
import 'package:history_ai/ui/onboarding/widgets/common_logo_text_view.dart';

class IntroScreen extends GetView<IntroController> {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IntroController>(
      init: IntroController(),
      builder: (controller) {
        return Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage(ImageConstant.mainBg), fit: BoxFit.fill)),
            child: SafeArea(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    const CommonLogoTextView(),
                    Expanded(
                        child: CommonAnimatedTextView(
                      title: AppConstants.title.tr,
                      desc: AppConstants.description.tr,
                    )),
                    CommonInkwell(
                      onTap: () {
                        Get.to(const OpenAccountScreen(),
                            transition: Transition.rightToLeftWithFade, // Add a transition here
                            duration: const Duration(milliseconds: 500));
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AnimatedTextKit(
                              animatedTexts: [
                                ColorizeAnimatedText(AppConstants.getStarted.tr,
                                    textStyle: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.w600, color: ColorConstants.black11),
                                    colors: [
                                      ColorConstants.black11,
                                      ColorConstants.grey8B,
                                    ]),

                              ],
                              onTap: () {
                                Get.to(const OpenAccountScreen(),
                                    transition: Transition.rightToLeftWithFade, // Add a transition here
                                    duration: const Duration(milliseconds: 500));
                              },
                            ),
                            const SizedBox(width: 16),
                            Container(
                              decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: ColorConstants.black11)),
                              padding: const EdgeInsets.all(15),
                              child: SvgPicture.asset(ImageConstant.arrowShort),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
