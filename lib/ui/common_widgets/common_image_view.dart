import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_ai/infrastructure/constant/color_constant.dart';
import 'package:history_ai/infrastructure/languages/app_constant.dart';
import 'package:history_ai/ui/common_widgets/common_inkwell.dart';
import 'package:history_ai/ui/common_widgets/headline_body_text.dart';
import 'package:history_ai/ui/onboarding/login_register/login_register_controller.dart';
import 'package:history_ai/ui/popups/character_popup.dart';

class CommonImageView extends StatelessWidget {
  const CommonImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginRegisterController>(
        init: LoginRegisterController(),
        builder: (controller) {
          return Center(
            child: Column(
              children: [
                controller.selectedCharacter != null
                    ? CommonInkwell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return const CharacterPopup();
                            },
                          );
                        },
                        child: Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(border: Border.all(color: Colors.grey), shape: BoxShape.circle),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100), child: Image.asset(controller.selectedCharacter!.photo, fit: BoxFit.cover)),
                        ),
                      )
                    : CommonInkwell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return const CharacterPopup();
                            },
                          );
                        },
                        child: Stack(
                          children: [
                            Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(color: ColorConstants.black.withOpacity(0.1), shape: BoxShape.circle),
                              child: const Icon(Icons.person, size: 40),
                            ),
                            Positioned(
                                top: 0,
                                right: 0,
                                child: Container(
                                    padding: const EdgeInsets.all(2),
                                    decoration: const BoxDecoration(color: ColorConstants.black, shape: BoxShape.circle),
                                    child: const Icon(
                                      Icons.add,
                                      color: ColorConstants.white,
                                    )))
                          ],
                        ),
                      ),
                const SizedBox(height: 10),
                HeadlineBodyOneBaseWidget(
                  title: controller.selectedCharacter != null ? controller.selectedCharacter!.name : AppConstants.choosePhoto.tr,
                  titleColor: ColorConstants.black,
                  fontWeight: FontWeight.w400,
                  titleTextAlign: TextAlign.center,
                  fontSize: 14,
                ),
              ],
            ),
          );
        });
  }
}
