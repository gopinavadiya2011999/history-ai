import 'package:character_ai/inftrastructure/commons/theme_changer.dart';
import 'package:character_ai/inftrastructure/model/character_model.dart';
import 'package:get/get.dart';

class CreateCharacterController extends GetxController {
  ThemeController themeController = Get.put(ThemeController());
  RxString selectedVoiceName =''.obs;
  List<CharacterModel> characterModelData = characterModel;
  CharacterModel selectedCharacter = characterModel.first;

  List<String> voiceNames = ["Alloy", "Echo", "Fable", "Onyx", "Nova", "Shimmer"];
}
