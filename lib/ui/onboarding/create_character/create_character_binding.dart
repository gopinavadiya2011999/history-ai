import 'package:get/get.dart';

import 'create_character_controller.dart';

class CreateCharacterBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CreateCharacterController());
  }
}