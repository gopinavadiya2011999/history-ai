import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_ai/infrastructure/constant/image_constant.dart';
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
          body: SafeArea(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage(ImageConstant.homeBg), fit: BoxFit.fill)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Container(padding: const EdgeInsets.symmetric(horizontal: 24), child: const AskAnythingAppBar()),
                  const SizedBox(height: 100),

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
