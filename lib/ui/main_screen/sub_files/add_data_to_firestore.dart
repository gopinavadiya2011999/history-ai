import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_ai/infrastructure/constant/color_constant.dart';
import 'package:history_ai/ui/common_widgets/common_button.dart';
import 'package:history_ai/ui/common_widgets/common_inkwell.dart';
import 'package:history_ai/ui/common_widgets/headline_body_text.dart';
import 'package:history_ai/ui/main_screen/main_controller.dart';
import 'package:history_ai/ui/main_screen/sub_widgets/add_category_list.dart';

class AddDataToFirestore extends StatelessWidget {
  const AddDataToFirestore({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
        init: MainController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: ColorConstants.white,
            body: SafeArea(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        CommonInkwell(
                            onTap: () {
                              Get.back();
                            },
                            child: const Icon(Icons.arrow_back_ios_new_outlined)),
                        const SizedBox(width: 10),
                        const HeadlineBodyOneBaseWidget(
                          title: "Add categories",
                          titleColor: ColorConstants.black11,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        )
                      ],
                    ),
                    const SizedBox(height: 30),
                    const Expanded(
                      child: AddCategoryList(),
                    ),
                    CommonButton(
                      buttonText: "Done",
                      textColor: ColorConstants.black11,
                      fillColor: ColorConstants.green6BB,
                      onTap: () {
                        // var uuid = Uuid();
                        //
                        // for (int i=0; i<controller.catTextList.length;i++) {
                        //
                        //   for(int j =0;j<controller.catTextList[i].subCategory.length;j++){
                        //
                        //     for (int k=0;k<controller.catTextList[i].subCategory[j].userTextField.length;k++){
                        //       controller.categoryList.add(
                        //           Category(id: "${uuid.v1()}$i", name: controller.catTextList[i].category.text.trim(),
                        //               subCategory: )
                        //       );
                        //     }
                        //   }
                          
                        //}
                        
                       
                      },
                    ),
                    const SizedBox(height: 20)
                  ],
                ),
              ),
            ),
          );
        });
  }
}
