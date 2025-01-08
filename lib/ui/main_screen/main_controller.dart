import 'package:audioplayers/audioplayers.dart';
import 'package:history_ai/infrastructure/apis/get_audio_from_ai.dart';
import 'package:history_ai/infrastructure/model/hostory_model.dart';
import 'package:history_ai/infrastructure/model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    final prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString("userDetail");

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
}
