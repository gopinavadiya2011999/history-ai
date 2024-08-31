import 'package:character_ai/inftrastructure/constant/color_constant.dart';
import 'package:character_ai/ui/common_widgets/common_button.dart';
import 'package:character_ai/ui/common_widgets/common_inkwell.dart';
import 'package:character_ai/ui/onboarding/create_character/create_character_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CharacterPopup extends StatelessWidget {
  const CharacterPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateCharacterController>(
      init: CreateCharacterController(),
      builder: (controller) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            insetPadding: const EdgeInsets.all(20),
            contentPadding: EdgeInsets.zero,
            actionsPadding: EdgeInsets.zero,
            content: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              height: MediaQuery.of(context).size.height * .5,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Wrap(
                        children: List.generate(
                          controller.characterModelData.length,
                          (index) {
                            return CommonInkwell(
                              onTap: () {
                                for (var element in controller.characterModelData) {
                                  element.selectedCharacter = false;
                                }
                                controller.characterModelData[index].selectedCharacter = !controller.characterModelData[index].selectedCharacter;
                                controller.update();
                                setState(() {});
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: controller.characterModelData[index].selectedCharacter
                                            ? ThemeColors.primary(context)
                                            : Colors.transparent,
                                        width: 2)),
                                child: Image.asset(
                                  controller.characterModelData[index].characterImage,
                                  width: 50,
                                  height: 50,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              Container(
                margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                child: CommonButton(

                    buttonText: "Choose",
                    onTap: () {
                      controller.selectedCharacter = controller.characterModelData.where((element) => element.selectedCharacter).first;
                      controller.update();
                      setState(() {});
                      Get.back();
                    }),
              )
            ],
          );
        });
      },
    );
  }
}
