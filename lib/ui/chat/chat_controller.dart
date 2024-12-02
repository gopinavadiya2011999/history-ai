import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:history_ai/infrastructure/model/hostory_model.dart';

class ChatController extends GetxController {
  User? selectedUser;
  Category?selectedCategory ;
  String ?response;

  TextEditingController messageController = TextEditingController();
  RxBool isMessageSending =false.obs;
}
