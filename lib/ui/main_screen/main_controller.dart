import 'package:audioplayers/audioplayers.dart';
import 'package:get/get_rx/get_rx.dart';
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
  List<Category> categoryList = [];
  List<CatListTextField> catTextList = [
    CatListTextField(subCategory: [
      SubCategoryTextField(
          subCategory: TextEditingController(), userTextField: [UsersTextField(userName: TextEditingController(), desc: TextEditingController())])
    ], category: TextEditingController())
  ];
RxBool isUpdating= false.obs;


  static Future<UserModel?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString('user');
    if (userJson != null) {
      return UserModel.fromRawJson(userJson);
    }
    return null;
  }

  @override
  Future<void> onInit() async {
    // userModel=await  getUser();
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
