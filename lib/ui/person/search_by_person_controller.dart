import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:history_ai/infrastructure/firestore/firebase_methods.dart';
import 'package:history_ai/infrastructure/model/hostory_model.dart';
import 'package:image_picker/image_picker.dart';

class SearchByPersonController extends GetxController {
  List<Category> categoryList = [];
  Category? selectedCategory;
  RxBool isLoading = false.obs;
  RxBool isHistorySelected = true.obs;
  XFile? file;
  TextEditingController nameController = TextEditingController();


  pickImage() async {
    final ImagePicker picker = ImagePicker();
    file = await picker.pickImage(source: ImageSource.gallery);
    update();
  }

  @override
  void onInit() {
    isLoading = true.obs;
    update();
    FirebaseMethods.fetchAllCategories().then(
      (value) {
        if (value != null) {
          categoryList = value;
          selectedCategory = categoryList.first;
        }

        isLoading = false.obs;
        update();
      },
    );
    super.onInit();
  }
}
