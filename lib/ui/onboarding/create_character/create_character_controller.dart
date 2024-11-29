import 'package:history_ai/infrastructure/model/character_model.dart';
import 'package:get/get.dart';

class CreateCharacterController extends GetxController {
  RxString selectedVoiceName =''.obs;
  List<CharacterModel> characterModelData = [];
  CharacterModel ?selectedCharacter ;

  List<String> voiceNames = ["Alloy", "Echo", "Fable", "Onyx", "Nova", "Shimmer"];
}
