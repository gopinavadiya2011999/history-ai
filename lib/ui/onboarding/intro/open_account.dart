import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:history_ai/infrastructure/constant/color_constant.dart';
import 'package:history_ai/infrastructure/constant/image_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_ai/infrastructure/languages/app_constant.dart';
import 'package:history_ai/ui/common_widgets/common_button.dart';
import 'package:history_ai/ui/onboarding/intro/intro_controller.dart';
import 'package:history_ai/ui/onboarding/login_register/login_screen.dart';
import 'package:history_ai/ui/onboarding/login_register/register_screen.dart';
import 'package:history_ai/ui/onboarding/widgets/common_animated_text_view.dart';
import 'package:history_ai/ui/onboarding/widgets/common_logo_text_view.dart';

class OpenAccountScreen extends GetView<IntroController> {
  const OpenAccountScreen({super.key});

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
                      title: AppConstants.openAccountTitle.tr,
                      desc: AppConstants.openAccountDesc.tr,
                    )),
                    CommonButton(
                      onTap: () {
                        Get.to(const LoginScreen(),
                            transition: Transition.rightToLeftWithFade, // Add a transition here
                            duration: const Duration(milliseconds: 500));
                      },
                      buttonText: AppConstants.openAccount.tr,
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: RichText(
                          text:
                              TextSpan(style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 14, color: ColorConstants.gray3D), children: [
                        TextSpan(text: AppConstants.noAccount.tr),
                        TextSpan(
                          text: AppConstants.registerNow.tr,
                          style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 14, color: ColorConstants.gray3D),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.to(const RegisterScreen(),
                                  transition: Transition.leftToRightWithFade, // Add a transition here
                                  duration: const Duration(milliseconds: 500));
                            },
                        ),
                      ])),
                    ),
                    const SizedBox(height: 20),
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
