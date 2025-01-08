import 'package:history_ai/infrastructure/constant/color_constant.dart';
import 'package:history_ai/ui/common_widgets/common_button.dart';
import 'package:history_ai/ui/common_widgets/common_inkwell.dart';
import 'package:history_ai/ui/common_widgets/headline_body_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_ai/ui/onboarding/login_register/login_register_controller.dart';

class CharacterPopup extends StatelessWidget {
  const CharacterPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginRegisterController>(
      init: LoginRegisterController(),
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
                        spacing: 10,
                        runSpacing: 10,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        alignment: WrapAlignment.center,
                        runAlignment: WrapAlignment.center,
                        children: List.generate(
                          controller.charImageData.length,
                              (index) {
                            return CommonInkwell(
                              onTap: () {
                                for (var element in controller.charImageData) {
                                  element.selectedCharacter = false;
                                }
                                controller.charImageData[index].selectedCharacter =
                                !controller.charImageData[index].selectedCharacter;
                                controller.update();
                                setState(() {});
                              },
                              child: ConstrainedBox(
                                constraints: const BoxConstraints(
                                  minWidth: 80,
                                  maxWidth: 100,
                                ),
                                child: Container(
                                  padding:  EdgeInsets.all(controller.charImageData[index].selectedCharacter?3:0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: controller.charImageData[index].selectedCharacter
                                          ? ColorConstants.black11
                                          : Colors.transparent,
                                      width: 2,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(
                                        controller.charImageData[index].photo,
                                        width: 50,
                                        height: 50,
                                      ),
                                      const SizedBox(height: 5),
                                      HeadlineBodyOneBaseWidget(
                                        title: controller.charImageData[index].name,
                                        fontSize: 10,
                                        maxLine: 2,
                                         fontWeight: FontWeight.w500,
                                         textOverflow: TextOverflow.ellipsis,
                                        titleTextAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                    ,
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
                      controller.selectedCharacter = controller.charImageData.where((element) => element.selectedCharacter).first;
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
