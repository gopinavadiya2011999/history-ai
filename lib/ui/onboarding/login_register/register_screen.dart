import 'package:flutter/gestures.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:history_ai/infrastructure/constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_ai/infrastructure/constant/dropdown_constant.dart';
import 'package:history_ai/infrastructure/constant/image_constant.dart';
import 'package:history_ai/infrastructure/languages/app_constant.dart';
import 'package:history_ai/ui/chat/common_dropdown.dart';
import 'package:history_ai/ui/common_widgets/common_button.dart';
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
                    const CommonLogoTextView(),
                    const SizedBox(height: 10),
                    Expanded(
                        child: SingleChildScrollView(
                      child: Form(
                        key: _formKeyRegister,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 30),
                            HeadlineBodyOneBaseWidget(
                              title: AppConstants.createAccount.tr,
                              titleColor: ColorConstants.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 32,
                            ),
                            const SizedBox(height: 4),
                            HeadlineBodyOneBaseWidget(
                              title: AppConstants.registerDesc.tr,
                              titleColor: ColorConstants.black87,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                            const SizedBox(height: 24),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (controller.image != null)
                                  CommonInkwell(
                                    onTap: ()  {
                                      controller.pickImage();
                                    },
                                    child: SizedBox(
                                      height: 90,
                                      width: 90,
                                      child: ClipRRect(
                                           borderRadius: BorderRadius.circular(100),
                                          child: Image.file(controller.image!, fit: BoxFit.cover)),
                                    ),
                                  )
                                else
                                  CommonInkwell(
                                    onTap: ()  {
                                       controller.pickImage();
                                    },
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 90,
                                          width: 90,
                                          decoration: BoxDecoration(color: ColorConstants.black.withOpacity(0.2), shape: BoxShape.circle),
                                          child: const Icon(Icons.person, size: 40),
                                        ),
                                        Positioned(
                                            top: 0,
                                            right: 0,
                                            child: Container(
                                                padding: const EdgeInsets.all(2),
                                                decoration: const BoxDecoration(color: ColorConstants.black, shape: BoxShape.circle),
                                                child: const Icon(
                                                  Icons.add,
                                                  color: ColorConstants.white,
                                                )))
                                      ],
                                    ),
                                  ),
                                const SizedBox(height: 10),
                                HeadlineBodyOneBaseWidget(
                                  title: AppConstants.choosePhoto.tr,
                                  titleColor: ColorConstants.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            CommonTextField(
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "Please enter your name";
                                }

                                return null;
                              },
                              prefixIcon: Container(
                                  margin: const EdgeInsets.only(left: 10, right: 8),
                                  child: SvgPicture.asset(ImageConstant.firstNameIcon, fit: BoxFit.fill)),
                              labelText: AppConstants.firstName.tr,
                              hintText: AppConstants.firstNameHint.tr,
                            ),
                            const SizedBox(height: 16),
                            CommonTextField(
                              controller: controller.nameController,
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
                            const SizedBox(height: 16),
                            Container(
                              margin: const EdgeInsets.only(left: 5),
                              child: const HeadlineBodyOneBaseWidget(
                                title: "Select AI voice name",
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                titleColor: ColorConstants.black10,
                              ),
                            ),
                            const SizedBox(height: 8),
                            CustomDropdown(
                              errorBorder: controller.voiceEmpty.value,
                              emptyValue: controller.voiceEmpty.value,
                              onChange: (int value, int index) {
                                controller.voiceName.value = controller.voiceNameList[index];
                                if (controller.voiceName.value.isNotEmpty) {
                                  controller.voiceEmpty.value = false;
                                }
                                controller.update();
                              },
                              showBorder: true,
                              dropdownButtonStyle: dropDownButtonStyle(),
                              dropdownStyle: dropDownStyle(),
                              items: controller.voiceNameList
                                  .asMap()
                                  .entries
                                  .map(
                                    (item) => DropdownItem<int>(
                                      value: item.key + 1,
                                      child: Text(item.value,
                                          style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                            color: ColorConstants.black,
                                          )),
                                    ),
                                  )
                                  .toList(),
                              child: Text(
                                controller.voiceName.value == "" ? "Select Voice Name" : controller.voiceName.value,
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: controller.voiceName.value == "" ? ColorConstants.black87 : ColorConstants.black,
                                ),
                              ),
                            ),
                            if(controller.voiceEmpty.value)
                              Container(
                                margin: const EdgeInsets.only(left: 4,top: 5),
                                child: const HeadlineBodyOneBaseWidget(
                                  title: "Please select voice name",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  titleColor: ColorConstants.red19,
                                ),
                              ),
                            const SizedBox(height: 16),
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
                                    child: SvgPicture.asset(controller.isShowPassword.value ? ImageConstant.hidePassword : ImageConstant.showPassword,
                                        fit: BoxFit.fill),
                                  )),
                              prefixIcon: Container(
                                  margin: const EdgeInsets.only(left: 10, right: 8),
                                  child: SvgPicture.asset(ImageConstant.passwordIcon, fit: BoxFit.fill)),
                              labelText: AppConstants.password.tr,
                              hintText: AppConstants.passwordHint.tr,
                            ),
                            const SizedBox(height: 16),
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
                      onTap: () {
                        if(controller.voiceName.isEmpty){

                        controller.voiceEmpty.value=true;
                        controller.update();
                        }
                        if (_formKeyRegister.currentState!.validate()) {
                          // If the form is valid, display proceed.
                        }
                      },
                      buttonText: AppConstants.continueButton.tr,
                    ),
                    const SizedBox(height: 8),
                    Center(
                      child: RichText(
                          text:
                              TextSpan(style: GoogleFonts.inter(fontSize: 16, color: ColorConstants.black87, fontWeight: FontWeight.w400), children: [
                        TextSpan(text: AppConstants.noAccount.tr),
                        TextSpan(
                            text: AppConstants.login.tr,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
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
