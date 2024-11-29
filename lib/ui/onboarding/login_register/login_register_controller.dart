
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class LoginRegisterController extends GetxController {
    RxBool voiceEmpty = false.obs;
       RxString voiceName = "".obs;
    List<String> voiceNameList = ["Alloy", "Echo", "Fable", "Onyx", "Nova", "Shimmer"];

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  RxBool isShowPassword = false.obs;
    File? image;
    RxBool isShowCPassword = false.obs;

    final ImagePicker picker = ImagePicker();

    Future pickImage() async {
      final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
        if (pickedFile != null) {
           image = File(pickedFile.path);
        } else {
          print('No image selected.');
        }
     update();
    }
}
