import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_ai/infrastructure/constant/color_constant.dart';
import 'package:history_ai/infrastructure/constant/image_constant.dart';
import 'package:history_ai/infrastructure/languages/app_constant.dart';
import 'package:history_ai/infrastructure/routes/route_constants.dart';
import 'package:history_ai/ui/common_widgets/headline_body_text.dart';
import 'package:history_ai/ui/main_screen/sub_widgets/ask_anything_app_bar.dart';
import 'package:history_ai/ui/person/search_by_person_controller.dart';
import 'package:history_ai/ui/person/sub_widgets/common_btn_container.dart';

class ChoosePlaceOptionView extends StatelessWidget {
  const ChoosePlaceOptionView({super.key});

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
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                    decoration: BoxDecoration(
                      color: ColorConstants.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        HeadlineBodyOneBaseWidget(
                          title: AppConstants.chooseOne.tr,
                          fontSize: 18,
                          titleTextAlign: TextAlign.center,
                          fontWeight: FontWeight.w600,
                          titleColor: ColorConstants.white,
                        ),
                        const SizedBox(height: 30),
                        CommonBtnContainer(
                          onTap: () {
                            controller.isPlaceSelected.value = true;
                            controller.update();
                            Get.toNamed(RouteConstants.searchByPlaceView);
                          },
                          title: AppConstants.placeChat.tr,
                          isSelected: controller.isPlaceSelected.value,
                        ),
                        const SizedBox(height: 20),
                        CommonBtnContainer(
                          onTap: () {
                            controller.isPlaceSelected.value = false;
                            controller.update();
                            Get.toNamed(RouteConstants.chooseOwnPersonView);
                          },
                          title: AppConstants.ownConversion.tr,
                          isSelected: !controller.isPlaceSelected.value,
                        ),
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
