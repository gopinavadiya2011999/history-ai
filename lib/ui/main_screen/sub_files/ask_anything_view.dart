import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_ai/infrastructure/constant/color_constant.dart';
import 'package:history_ai/infrastructure/constant/image_constant.dart';
import 'package:history_ai/infrastructure/languages/app_constant.dart';
import 'package:history_ai/ui/common_widgets/headline_body_text.dart';
import 'package:history_ai/ui/main_screen/main_controller.dart';
import 'package:history_ai/ui/main_screen/sub_widgets/ask_anything_app_bar.dart';
import 'package:history_ai/ui/main_screen/sub_widgets/colorful_box_col_view.dart';

class AskAnythingView extends StatelessWidget {
  const AskAnythingView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage(ImageConstant.homeBg), fit: BoxFit.fill)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const AskAnythingAppBar(),
                  const SizedBox(height: 36),
                  HeadlineBodyOneBaseWidget(
                    title: AppConstants.askAnything.tr,
                    titleTextAlign: TextAlign.center,
                    titleColor: ColorConstants.black11,
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(height: 16),
                  HeadlineBodyOneBaseWidget(
                    title: AppConstants.askAnythingDesc.tr,
                    titleTextAlign: TextAlign.center,
                    titleColor: ColorConstants.gray92,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  const SizedBox(height: 32),
                  const Expanded(child: ColorfulBoxColView())
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
