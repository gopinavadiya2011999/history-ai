import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_ai/infrastructure/constant/color_constant.dart';
import 'package:history_ai/infrastructure/firestore/firebase_methods.dart';
import 'package:history_ai/ui/common_widgets/common_button.dart';
import 'package:history_ai/ui/common_widgets/common_inkwell.dart';
import 'package:history_ai/ui/common_widgets/common_text_field.dart';
import 'package:history_ai/ui/main_screen/sub_widgets/ask_anything_app_bar.dart';
import 'package:history_ai/ui/person/search_by_person_controller.dart';

class ChooseOwnPersonView extends StatelessWidget {
  const ChooseOwnPersonView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchByPersonController>(
      init: SearchByPersonController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              width: double.infinity,
              height: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const AskAnythingAppBar(),
                  const SizedBox(height: 50),
                  Expanded(
                      child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CommonInkwell(
                          onTap: () async {
                            await controller.pickImage();
                          },
                          child: SizedBox(
                              height: 100,
                              width: 108,
                              child: Stack(
                                children: [
                                  Positioned(
                                      width: 100,
                                      height: 100,
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(100),
                                          child: controller.file != null
                                              ? Image.file(File(controller.file!.path), fit: BoxFit.cover)
                                              : Image.network('https://picsum.photos/200/300', fit: BoxFit.cover))),
                                  Positioned(
                                      right: 0,
                                      top: 0,
                                      child: Container(
                                        decoration: const BoxDecoration(color: ColorConstants.black11, shape: BoxShape.circle),
                                        padding: const EdgeInsets.all(8),
                                        child: const Icon(Icons.add, color: Colors.white, size: 18),
                                      ))
                                ],
                              )),
                        ),
                        const SizedBox(height: 20),
                        const CommonTextField(
                            prefixIcon: SizedBox(width: 15),
                            hintText: "Enter your choice of name"),
                        const SizedBox(height: 10),
                        const CommonTextField(
                            prefixIcon: SizedBox(width: 15),
                            hintText: "Enter descriptive detail"),
                        const SizedBox(height: 10),
                        const CommonTextField(
                            prefixIcon: SizedBox(width: 15),
                            hintText: "Enter your category of user"),
                        const SizedBox(height: 30),
                        CommonButton(
                          buttonText: "Done",

                          textColor: ColorConstants.black11,
                          fillColor: ColorConstants.green6BB,
                          onTap: () {
                          },
                        )
                      ],
                    ),
                  ))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
