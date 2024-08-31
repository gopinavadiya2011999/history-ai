import 'package:audioplayers/audioplayers.dart';
import 'package:character_ai/inftrastructure/commons/theme_changer.dart';
import 'package:character_ai/inftrastructure/model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../inftrastructure/apis/get_audio_from_ai.dart';

class MainController extends GetxController {
  ThemeController themeController = Get.put(ThemeController());
  TextEditingController messageController = TextEditingController();
  UserModel? userModel ;
  String markdownText = '';
  final AudioPlayer audioPlayer = AudioPlayer();
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
    userModel=await  getUser();
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
      await Future.delayed(const Duration(milliseconds: 300)); // Adjust delay as needed
    }
  }
}
