import 'package:history_ai/infrastructure/constant/color_constant.dart';
import 'package:history_ai/infrastructure/constant/image_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_ai/infrastructure/languages/app_constant.dart';
import 'package:history_ai/ui/common_widgets/headline_body_text.dart';
import 'package:history_ai/ui/main_screen/sub_widgets/ask_anything_app_bar.dart';
import 'package:history_ai/ui/person/search_by_person_controller.dart';
import 'package:history_ai/ui/person/sub_widgets/category_list_with_place.dart';

class SearchByPlaceView extends GetView<SearchByPersonController> {
  const SearchByPlaceView({super.key});

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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Container(padding: const EdgeInsets.symmetric(horizontal: 24), child: const AskAnythingAppBar()),
                  const SizedBox(height: 25),
                  Expanded(
                      child: controller.isLoading.value && controller.placeList.isEmpty
                          ? const Center(
                        child: CircularProgressIndicator(
                          color: ColorConstants.black11,
                        ),
                      )
                          : controller.placeList.isEmpty
                          ? Center(
                        child: HeadlineBodyOneBaseWidget(
                          title: AppConstants.noDataFound.tr,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                          : const CategoryListWithPlace())
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
