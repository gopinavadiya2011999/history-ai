import 'package:get/get.dart';

import 'intro_controller.dart';

class IntroBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(IntroController());
  }
}