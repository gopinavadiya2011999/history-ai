import 'package:history_ai/infrastructure/constant/color_constant.dart';
import 'package:history_ai/infrastructure/constant/image_constant.dart';
import 'package:history_ai/infrastructure/routes/route_constants.dart';
import 'package:history_ai/ui/common_widgets/chat_appbar.dart';
import 'package:history_ai/ui/common_widgets/common_button.dart';
import 'package:history_ai/ui/common_widgets/common_inkwell.dart';
import 'package:history_ai/ui/common_widgets/common_text_field.dart';
import 'package:history_ai/ui/common_widgets/headline_body_text.dart';
import 'package:history_ai/ui/popups/character_popup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'create_character_controller.dart';

class CreateCharacterScreen extends GetView<CreateCharacterController> {
  const CreateCharacterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateCharacterController>(
      init: CreateCharacterController(),
      builder: (controller) {
        return Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImageConstant.mainBg),
                    fit: BoxFit.fill)),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const ChatAppbar(),
                  Center(
                    child: CommonInkwell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return const CharacterPopup();
                          },
                        );
                      },
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          CircleAvatar(
                            // backgroundImage: AssetImage(controller.selectedCharacter),
                            radius: 50,
                          ),
                          const SizedBox(height: 10),
                          HeadlineBodyOneBaseWidget(
                            title: "You can change your character's face\nby tapping on the user image.",
                            titleTextAlign: TextAlign.center,
                            style: GoogleFonts.inter(color: ColorConstants.black11, fontSize: 12, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeadlineBodyOneBaseWidget(
                          title: "Select AI voice",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          titleColor:ColorConstants.black11,
                        ),
                        const SizedBox(height: 8),
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                              isDense: true,
                              filled: true,
                              fillColor:ColorConstants.black11,
                              enabledBorder: commonBorder(context),
                              disabledBorder: commonBorder(context),
                              focusedBorder: commonBorder(context),
                              border: commonBorder(context)),
                          value: controller.voiceNames.contains(controller.selectedVoiceName.value) ? controller.selectedVoiceName.value : 'Alloy',
                          items: [
                            const DropdownMenuItem<String>(
                              value: '',
                              child: Text('Select voice'),
                            ),
                            ...controller.voiceNames.map((String voiceName) {
                              return DropdownMenuItem<String>(
                                value: voiceName,
                                child: HeadlineBodyOneBaseWidget(title: voiceName),
                              );
                            }),
                          ],
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              controller.selectedVoiceName.value = newValue;
                            } else {
                              controller.selectedVoiceName.value = '';
                            }
                            controller.update();
                          },
                        ),
                        const SizedBox(height: 5),
                        HeadlineBodyOneBaseWidget(
                          title: "AI generates speech in your selected voice.",
                          titleTextAlign: TextAlign.center,
                          style: GoogleFonts.inter(color: ColorConstants.black11, fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(height: 30),
                        CommonButton(
                          textColor: ColorConstants.black11,
                          buttonText: "Generate character",
                          fillColor:ColorConstants.black11,
                          onTap: () async {
                            final prefs = await SharedPreferences.getInstance();
                            // final userJson = UserModel(
                            //         name: controller.selectedVoiceName.value.isNotEmpty ? controller.selectedVoiceName.value : "Alloy",
                            //         image: controller.selectedCharacter.characterImage)
                            //     .toRawJson();
                            // await prefs.setString('user', userJson);
                            prefs.setBool("isLogin", true);
                            Get.offAllNamed(RouteConstants.mainScreen);
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
