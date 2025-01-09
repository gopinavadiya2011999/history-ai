import 'package:audioplayers/audioplayers.dart';
import 'package:history_ai/infrastructure/apis/get_audio_from_ai.dart';
import 'package:history_ai/infrastructure/model/character_model.dart';
import 'package:history_ai/infrastructure/model/hostory_model.dart';
import 'package:history_ai/infrastructure/model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:history_ai/infrastructure/routes/route_constants.dart';
import 'package:history_ai/main.dart';
import 'package:history_ai/ui/onboarding/login_register/login_register_controller.dart';

class MainController extends GetxController {
  TextEditingController messageController = TextEditingController();
  String markdownText = '';
  final AudioPlayer audioPlayer = AudioPlayer();
  UserModel? userModel;
  List<CatListTextField> catTextList = [
    CatListTextField(subCategory: [
      SubCategoryTextField(
          subCategory: TextEditingController(), userTextField: [UsersTextField(userName: TextEditingController(), desc: TextEditingController())])
    ], category: TextEditingController())
  ];
  RxBool isUpdating = false.obs;

  Future<UserModel?> getUserModel() async {

   String  ?userJson= preferences!.getString("userDetail");

    if (userJson == null) return null;

    return UserModel.fromRawJson(userJson);
  }

  @override
  Future<void> onInit() async {
    userModel = await getUserModel();
    update();
    super.onInit();
  }

  Future<void> speak(String text) async {
    final audioFilePath = await ApiMethods.getAudioFromAI(text);
    final player = AudioPlayer();
    if (audioFilePath.isNotEmpty) {
      player.play(DeviceFileSource(audioFilePath));
      await animateText(text);
    }
  }

  Future<void> animateText(String text) async {
    final words = text.split(' ');

    for (var i = 0; i < words.length; i++) {
      markdownText = words.sublist(0, i + 1).join(' ');
      update();
      await Future.delayed(const Duration(milliseconds: 500)); // Adjust delay as needed
    }
  }

  void editData() {
    LoginRegisterController loginRegisterController = Get.put(LoginRegisterController());
    loginRegisterController.firstNameController.text = userModel!.firstName;
    loginRegisterController.lastNameController.text = userModel!.lastName;
    loginRegisterController.emailController.text = userModel!.email;
    loginRegisterController.selectedCharacter = CharImageModel(
        selectedCharacter: true,
        name: charData.where((element) => element.id == userModel!.profilePic).first.name,
        photo: charData.where((element) => element.id == userModel!.profilePic).first.photo,
        id: charData.where((element) => element.id == userModel!.profilePic).first.id);
    for (var element in loginRegisterController.charImageData) {
      if (element.id == userModel!.profilePic) {
        element.selectedCharacter = true;
      }
    }
    loginRegisterController.fromEdit.value = true;
    loginRegisterController.update();
    update();
    Get.toNamed(RouteConstants.registerScreen);
  }
}
