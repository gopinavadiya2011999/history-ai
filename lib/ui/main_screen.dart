import 'package:character_ai/inftrastructure/apis/get_audio_from_ai.dart';
import 'package:character_ai/inftrastructure/constant/color_constant.dart';
import 'package:character_ai/inftrastructure/constant/common_toast.dart';
import 'package:character_ai/inftrastructure/constant/image_constant.dart';
import 'package:character_ai/inftrastructure/routes/route_constants.dart';
import 'package:character_ai/ui/common_widgets/common_inkwell.dart';
import 'package:character_ai/ui/common_widgets/common_text_field.dart';
import 'package:character_ai/ui/common_widgets/headline_body_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main_controller.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      builder: (controller) {
        return Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(MediaQuery.of(context).platformBrightness == Brightness.dark ? ImageConstant.bgDark : ImageConstant.bgLight),
                    fit: BoxFit.fill)),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  if (controller.userModel != null)
                    CommonInkwell(
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
                              backgroundImage: AssetImage(controller.userModel!.image),
                              radius: 20,
                            ),
                            const SizedBox(width: 10),
                            HeadlineBodyOneBaseWidget(
                              title:controller.userModel!.name,
                              style: GoogleFonts.inter(color: ThemeColors.primary(context), fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            const Spacer(),
                            CommonInkwell(
                                onTap: () {
                                  controller.themeController.toggleTheme();
                                },
                                child: const Icon(Icons.dark_mode))
                          ],
                        ),
                      ),
                    ),

                  Expanded(child: Column(
                    children: [
                      Expanded(
                        child: Markdown(

                          data:controller. markdownText,
                          styleSheet: MarkdownStyleSheet(
                            h1: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                            p: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),

                    ],
                  )),

                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child:  CommonTextField(
                      onSendTap:  () {
                        if(controller.messageController.text.trim().isNotEmpty){
                          ApiMethods.getTextFromAI(controller.messageController.text.trim());
                        controller.speak(controller.messageController.text.trim());
                        }else{
                          showTopToast(msg: "Please write something..", context: context);
                        }
                      },
                      controller: controller.messageController,
                      maxLines: 5,

                      hintText: "Search something",

                    ),
                  ),
                  const SizedBox(height: 10)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
