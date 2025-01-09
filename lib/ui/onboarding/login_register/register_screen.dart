import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:history_ai/infrastructure/constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_ai/infrastructure/constant/common_toast.dart';
import 'package:history_ai/infrastructure/constant/image_constant.dart';
import 'package:history_ai/infrastructure/languages/app_constant.dart';
import 'package:history_ai/ui/common_widgets/common_button.dart';
import 'package:history_ai/ui/common_widgets/common_image_view.dart';
import 'package:history_ai/ui/common_widgets/common_inkwell.dart';
import 'package:history_ai/ui/common_widgets/common_text_field.dart';
import 'package:history_ai/ui/common_widgets/headline_body_text.dart';
import 'package:history_ai/ui/onboarding/login_register/login_register_controller.dart';
import 'package:history_ai/ui/onboarding/widgets/common_logo_text_view.dart';

class RegisterScreen extends GetView<LoginRegisterController> {
  const RegisterScreen({super.key});
  static final _formKeyRegister = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginRegisterController>(
      init: LoginRegisterController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorConstants.whiteFd,
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: SafeArea(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    if (!controller.fromEdit.value) const CommonLogoTextView(),
                    if (!controller.fromEdit.value) const SizedBox(height: 10),
                    Expanded(
                        child: SingleChildScrollView(
                      child: Form(
                        key: _formKeyRegister,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (!controller.fromEdit.value) const SizedBox(height: 20),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                if (controller.fromEdit.isTrue)
                                  CommonInkwell(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Container(margin: const EdgeInsets.only(top: 5), child: const Icon(Icons.arrow_back_ios_new))),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      HeadlineBodyOneBaseWidget(
                                        title: controller.fromEdit.value ? "Edit your profile info" : AppConstants.createAccount.tr,
                                        titleColor: ColorConstants.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: controller.fromEdit.value ? 22 : 32,
                                      ),
                                      const SizedBox(height: 4),
                                      HeadlineBodyOneBaseWidget(
                                        title: controller.fromEdit.value ? "Change the form detail to edit" : AppConstants.registerDesc.tr,
                                        titleColor: ColorConstants.black87,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 24),
                            const CommonImageView(),
                            const SizedBox(height: 16),
                            CommonTextField(
                              textCapitalization: TextCapitalization.words,
                              controller: controller.firstNameController,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "Please enter first name";
                                }

                                return null;
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.deny(RegExp(r'\s')), // Deny spaces
                              ],
                              prefixIcon: Container(
                                  margin: const EdgeInsets.only(left: 10, right: 8),
                                  child: SvgPicture.asset(ImageConstant.firstNameIcon, fit: BoxFit.fill)),
                              labelText: AppConstants.firstName.tr,
                              hintText: AppConstants.firstNameHint.tr,
                            ),
                            const SizedBox(height: 16),
                            CommonTextField(
                              inputFormatters: [
                                FilteringTextInputFormatter.deny(RegExp(r'\s')), // Deny spaces
                              ],
                              textCapitalization: TextCapitalization.words,
                              controller: controller.lastNameController,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "Please enter last name";
                                }
                                return null;
                              },
                              prefixIcon: Container(
                                  margin: const EdgeInsets.only(left: 10, right: 8),
                                  child: SvgPicture.asset(ImageConstant.firstNameIcon, fit: BoxFit.fill)),
                              labelText: "Last Name",
                              hintText: "Enter Last Name",
                            ),
                            const SizedBox(height: 16),
                            CommonTextField(
                              readOnly: controller.fromEdit.value,
                              controller: controller.emailController,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "Please enter email";
                                }
                                if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                              prefixIcon: Container(
                                  margin: const EdgeInsets.only(left: 10, right: 8),
                                  child: SvgPicture.asset(ImageConstant.emailIcon, fit: BoxFit.fill)),
                              labelText: AppConstants.email.tr,
                              hintText: AppConstants.emailHint.tr,
                            ),
                            if (!controller.fromEdit.value) const SizedBox(height: 16),
                            if (!controller.fromEdit.value)
                              CommonTextField(
                                controller: controller.passwordController,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return "Please enter password";
                                  }
                                  if (value.length < 6) {
                                    return 'Password must be at least 6 characters';
                                  }
                                  return null;
                                },
                                obscureText: !controller.isShowPassword.value,
                                suffixIcon: Container(
                                    margin: const EdgeInsets.only(right: 10, left: 8),
                                    child: CommonInkwell(
                                      onTap: () {
                                        controller.isShowPassword.value = !controller.isShowPassword.value;
                                        controller.update();
                                      },
                                      child: SvgPicture.asset(
                                          controller.isShowPassword.value ? ImageConstant.hidePassword : ImageConstant.showPassword,
                                          fit: BoxFit.fill),
                                    )),
                                prefixIcon: Container(
                                    margin: const EdgeInsets.only(left: 10, right: 8),
                                    child: SvgPicture.asset(ImageConstant.passwordIcon, fit: BoxFit.fill)),
                                labelText: AppConstants.password.tr,
                                hintText: AppConstants.passwordHint.tr,
                              ),
                            if (!controller.fromEdit.value) const SizedBox(height: 16),
                            if (!controller.fromEdit.value)
                              CommonTextField(
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return "Please enter password";
                                  }
                                  if (value.length < 6) {
                                    return 'Password must be at least 6 characters';
                                  }
                                  if (value.trim().toString() != controller.passwordController.text.trim()) {
                                    return 'Password must be at least 6 characters';
                                  }
                                  return null;
                                },
                                controller: controller.confirmPasswordController,
                                obscureText: !controller.isShowCPassword.value,
                                suffixIcon: Container(
                                    margin: const EdgeInsets.only(right: 10, left: 8),
                                    child: CommonInkwell(
                                      onTap: () {
                                        controller.isShowCPassword.value = !controller.isShowCPassword.value;
                                        controller.update();
                                      },
                                      child: SvgPicture.asset(
                                          controller.isShowCPassword.value ? ImageConstant.hidePassword : ImageConstant.showPassword,
                                          fit: BoxFit.fill),
                                    )),
                                prefixIcon: Container(
                                    margin: const EdgeInsets.only(left: 10, right: 8),
                                    child: SvgPicture.asset(ImageConstant.passwordIcon, fit: BoxFit.fill)),
                                labelText: AppConstants.cPassword.tr,
                                hintText: AppConstants.cPasswordHint.tr,
                              ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    )),
                    const SizedBox(height: 10),
                    CommonButton(
                      progressColor: Colors.white,
                      isLoading: controller.isRegisterLoading.value,
                      onTap: () async {
                        FocusScope.of(context).unfocus();
                        if (controller.voiceName.isEmpty) {
                          controller.voiceEmpty.value = true;
                          controller.update();
                        }
                        if (_formKeyRegister.currentState!.validate() && controller.selectedCharacter != null) {
                          if(controller.fromEdit.isTrue){
                            await controller.editUserToFirestore(context: context);
                          }else{
                          await controller.registerUserToFirestore(context: context);

                          }
                        } else {
                          showTopToast(msg: "Please choose one photo", context: context);
                        }
                      },
                      buttonText: controller.fromEdit.value ? "Save" : AppConstants.continueButton.tr,
                    ),
                    if (!controller.fromEdit.value) const SizedBox(height: 8),
                    if (!controller.fromEdit.value)
                      Center(
                        child: RichText(
                            text: TextSpan(
                                style: GoogleFonts.inter(fontSize: 16, color: ColorConstants.black87, fontWeight: FontWeight.w400),
                                children: [
                              TextSpan(text: AppConstants.noAccount.tr),
                              TextSpan(
                                  text: AppConstants.login.tr,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      controller.clearControllers();
                                      Get.back();
                                    },
                                  style: GoogleFonts.inter(
                                    color: ColorConstants.blueFf,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ])),
                      ),
                    const SizedBox(height: 20)
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
