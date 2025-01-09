import 'package:bcrypt/bcrypt.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:history_ai/infrastructure/constant/common_toast.dart';
import 'package:history_ai/infrastructure/firestore/firebase_methods.dart';
import 'package:history_ai/infrastructure/model/character_model.dart';
import 'package:history_ai/infrastructure/model/user_model.dart';
import 'package:history_ai/infrastructure/routes/route_constants.dart';
import 'package:history_ai/main.dart';
import 'package:history_ai/ui/main_screen/main_controller.dart';
import 'package:uuid/uuid.dart';

class LoginRegisterController extends GetxController {
  RxBool voiceEmpty = false.obs;
  RxBool fromEdit = false.obs;
  RxString voiceName = "".obs;
  // List<String> voiceNameList = ["Alloy", "Echo", "Fable", "Onyx", "Nova", "Shimmer"];
  CharImageModel? selectedCharacter;
  List<CharImageModel> charImageData = charData;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  RxBool isShowPassword = false.obs;
  RxBool isRegisterLoading = false.obs;
  RxBool isLoginLoading = false.obs;
  RxBool isShowCPassword = false.obs;

  registerUserToFirestore({required BuildContext context}) async {
    isRegisterLoading.value = true;
    update();
    final hashedPassword = BCrypt.hashpw(passwordController.text.trim(), BCrypt.gensalt());
    Uuid uuid = const Uuid();

    bool isLogin = await FirebaseMethods.registerUser(
        userData: UserModel(
            userId: "${uuid.v4()}${DateTime.now().microsecondsSinceEpoch}",
            createdAt: Timestamp.now(),
            updatedAt: Timestamp.now(),
            firstName: firstNameController.text.trim(),
            lastName: lastNameController.text.trim(),
            profilePic: selectedCharacter!.id,
            email: emailController.text.trim(),
            password: hashedPassword),
        context: context);
    if (isLogin) {
      UserModel? userModel =
          await FirebaseMethods.getLoginUserDetail(email: emailController.text.trim(), context: context, password: passwordController.text.trim());

      if (userModel != null) {
        await preferences?.setBool("isLogin", true);
        String userJson = userModel.toRawJson();
        await preferences?.setString("userDetail", userJson);
        Get.offAllNamed(RouteConstants.mainScreen);
        showTopToast(msg: "User registered successfully!", context: context);
      }

      update();
    }
    clearControllers();
    isRegisterLoading.value = false;
    update();
  }

  editUserToFirestore({required BuildContext context}) async {
    MainController mainController = Get.put(MainController());
    isRegisterLoading.value = true;
    update();

    await FirebaseMethods.updateUserData(dataToUpdate: {
      "first_name": firstNameController.text.trim(),
      "last_name": lastNameController.text.trim(),
      "profile_pic": selectedCharacter!.id,
      "updated_at": Timestamp.now()
    }, documentId: mainController.userModel!.userId);

    UserModel? userModel = await FirebaseMethods.getUserData(email: emailController.text.trim(), context: context);
    if (userModel != null) {
      await preferences?.remove("userDetail");
      String userJson = userModel.toRawJson();
      await preferences?.setString("userDetail", userJson);

      mainController.userModel = userModel;

      mainController.update();
      showTopToast(msg: "User updated successfully!", context: context);
    }

    isRegisterLoading.value = false;
    update();
  }

  loginUser({required BuildContext context}) async {
    isLoginLoading.value = true;
    update();
    UserModel? userModel =
        await FirebaseMethods.getLoginUserDetail(email: emailController.text.trim(), context: context, password: passwordController.text.trim());
    if (userModel != null) {
      await preferences?.setBool("isLogin", true);
      String userJson = userModel.toRawJson();
      await preferences?.setString("userDetail", userJson);
      Get.offAllNamed(RouteConstants.mainScreen);
    }
    clearControllers();
    isLoginLoading.value = false;
    update();
  }

  void clearControllers() {
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    passwordController.clear();
    selectedCharacter = null;
    confirmPasswordController.clear();
    update();
  }
}
