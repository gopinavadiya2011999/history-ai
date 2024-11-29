import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_ai/infrastructure/constant/color_constant.dart';
import 'package:history_ai/infrastructure/languages/app_constant.dart';
import 'package:history_ai/infrastructure/model/hostory_model.dart';
import 'package:history_ai/ui/common_widgets/common_inkwell.dart';
import 'package:history_ai/ui/common_widgets/common_profile_view.dart';
import 'package:history_ai/ui/common_widgets/headline_body_text.dart';
import 'package:history_ai/ui/person/search_by_person_controller.dart';

class CategoryListWithPerson extends StatelessWidget {
  const CategoryListWithPerson({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchByPersonController>(
        init: SearchByPersonController(),
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: HeadlineBodyOneBaseWidget(
                  title: AppConstants.categories.tr,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Row(
                    children: List.generate(
                      controller.categoryList.length,
                      (index) {
                        Category selectedCat = controller.categoryList[index];
                        return CommonInkwell(
                          onTap: () {
                            controller.selectedCategory = selectedCat;
                            controller.update();
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                                color: controller.selectedCategory == selectedCat ? ColorConstants.black11 : Colors.white,
                                border: Border.all(
                                    color: controller.selectedCategory == selectedCat ? ColorConstants.transparent : ColorConstants.grayD8),
                                borderRadius: BorderRadius.circular(50)),
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            child: HeadlineBodyOneBaseWidget(
                              title: selectedCat.name,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              titleColor: controller.selectedCategory == selectedCat ? ColorConstants.white : ColorConstants.black11,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                  child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemCount: controller.selectedCategory!.subCategory.length,
                itemBuilder: (context, index) {
                  SubCategory subCategory = controller.selectedCategory!.subCategory[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(color: ColorConstants.greenEF, borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonInkwell(
                          onTap: () {
                            subCategory.isSelected = !subCategory.isSelected;
                            controller.update();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              HeadlineBodyOneBaseWidget(
                                title: subCategory.name,
                                titleColor: ColorConstants.black11,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                              AnimatedRotation(
                                duration: const Duration(milliseconds: 200),
                                turns: subCategory.isSelected ? 0.5 : 0.0,
                                child: const Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 28,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (subCategory.isSelected)
                          Wrap(
                            children: List.generate(
                              subCategory.users.length,
                              (index) {
                                return Container(
                                  margin: const EdgeInsets.only(right: 8),
                                  constraints: const BoxConstraints(maxWidth: 100),
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 10),
                                      const CommonProfileView(imageUrl: 'https://picsum.photos/200/300'),
                                      const SizedBox(height: 10),
                                      HeadlineBodyOneBaseWidget(
                                        title: subCategory.users[index].name,
                                        titleColor: ColorConstants.black11,
                                        fontWeight: FontWeight.w600,
                                        titleTextAlign: TextAlign.center,
                                        fontSize: 12,
                                      ),
                                      const SizedBox(height: 10),
                                    ],
                                  ),
                                );
                              },
                            ),
                          )
                      ],
                    ),
                  );
                },
              ))
            ],
          );
        });
  }
}
