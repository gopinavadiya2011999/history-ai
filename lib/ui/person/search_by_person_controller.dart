import 'package:get/get.dart';
import 'package:history_ai/infrastructure/firestore/firebase_methods.dart';
import 'package:history_ai/infrastructure/model/hostory_model.dart';

class SearchByPersonController extends GetxController {
  List<Category> categoryList = [];
  Category? selectedCategory;
  RxBool isLoading = false.obs;
  RxBool isHistorySelected = true.obs;


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
