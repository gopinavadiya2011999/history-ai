import 'package:get/get.dart';

import 'search_by_person_controller.dart';



class SearchByPersonBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SearchByPersonController());
  }
}