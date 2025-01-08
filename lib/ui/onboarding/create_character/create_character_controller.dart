import 'package:history_ai/infrastructure/model/character_model.dart';
import 'package:get/get.dart';

class CreateCharacterController extends GetxController {
  RxString selectedVoiceName =''.obs;
  // List<CharacterModel> characterModelData = [];
  CharImageModel ?selectedCharacter ;
List<CharImageModel> charImageData= charData;
  List<String> voiceNames = ["Alloy", "Echo", "Fable", "Onyx", "Nova", "Shimmer"];
}
