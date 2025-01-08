import 'package:flutter/material.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:history_ai/infrastructure/constant/color_constant.dart';
import 'package:history_ai/infrastructure/firestore/firebase_methods.dart';
import 'package:history_ai/infrastructure/firestore/upload_photos.dart';
import 'package:history_ai/infrastructure/languages/app_constant.dart';
import 'package:history_ai/infrastructure/model/hostory_model.dart';
import 'package:history_ai/infrastructure/model/place_model.dart';
import 'package:history_ai/ui/common_widgets/common_button.dart';
import 'package:history_ai/ui/common_widgets/common_inkwell.dart';
import 'package:history_ai/ui/common_widgets/headline_body_text.dart';
import 'package:history_ai/ui/main_screen/main_controller.dart';
import 'package:history_ai/ui/main_screen/sub_widgets/add_category_list.dart';
import 'package:uuid/uuid.dart';

class AddPlaceDataToFirestore extends StatelessWidget {
  const AddPlaceDataToFirestore({super.key});

  static final _formKey = GlobalKey<FormState>();

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
                child: Form(
                  key: _formKey,
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
                          HeadlineBodyOneBaseWidget(
                            title: AppConstants.addCategory.tr,
                            titleColor: ColorConstants.black11,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          )
                        ],
                      ),
                      const SizedBox(height: 30),
                       const Expanded(
                        child: AddCategoryList(fromPlace:true),
                      ),
                      CommonButton(
                        buttonText: AppConstants.done.tr,
                        isLoading: controller.isUpdating.value,
                        textColor: ColorConstants.black11,
                        fillColor: ColorConstants.green6BB,
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            controller.isUpdating = true.obs;
                            controller.update();
                            var uuid = const Uuid();
                            List<Places> places = [];
                            for (int i = 0; i < controller.catTextList.length; i++) {
                              List<PlaceSubCategory> placeCategory = [];

                              for (int j = 0; j < controller.catTextList[i].subCategory.length; j++) {
                                List<City> city = [];

                                for (int k = 0; k < controller.catTextList[i].subCategory[j].userTextField.length; k++) {
                                  var userTextField = controller.catTextList[i].subCategory[j].userTextField[k];

                                  if (userTextField.userName.text.trim().isNotEmpty) {
                                    String? photoUrl;
                                    if (userTextField.userPhoto != null) {
                                      photoUrl = await UploadFilesFirestore.uploadFile(
                                        File(userTextField.userPhoto!.path),
                                        userTextField.userPhoto!.path,
                                      );
                                    }

                                    city.add(City(
                                      name: userTextField.userName.text.trim(),
                                      photo: photoUrl ?? '',
                                      desc: userTextField.desc.text.trim(),
                                    ));
                                  }
                                }

                                if (controller.catTextList[i].subCategory[j].subCategory.text.trim().isNotEmpty) {
                                  placeCategory.add(PlaceSubCategory(
                                    id: "${uuid.v4()}$i$j",
                                    name: controller.catTextList[i].subCategory[j].subCategory.text.trim(),
                                    city: city,
                                  ));
                                }
                              }

                              if (controller.catTextList[i].category.text.trim().isNotEmpty) {
                                places.add(Places(
                                  id: "${uuid.v4()}$i",
                                  category: controller.catTextList[i].category.text.trim(),
                                  subCategory: placeCategory,
                                ));
                              }
                            }
                            await FirebaseMethods.writePLacesData(places, context);
                            controller.catTextList = [
                              CatListTextField(subCategory: [
                                SubCategoryTextField(
                                    subCategory: TextEditingController(),
                                    userTextField: [UsersTextField(userName: TextEditingController(), desc: TextEditingController())])
                              ], category: TextEditingController())
                            ];
                            controller.update();
                            controller.isUpdating = false.obs;
                            controller.update();
                          }
                        },
                      ),
                      const SizedBox(height: 20)
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
