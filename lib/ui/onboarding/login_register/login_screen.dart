import 'package:flutter/gestures.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:history_ai/infrastructure/constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:history_ai/infrastructure/constant/image_constant.dart';
import 'package:history_ai/infrastructure/languages/app_constant.dart';
import 'package:history_ai/infrastructure/routes/route_constants.dart';
import 'package:history_ai/ui/common_widgets/common_button.dart';
import 'package:history_ai/ui/common_widgets/common_inkwell.dart';
import 'package:history_ai/ui/common_widgets/common_text_field.dart';
import 'package:history_ai/ui/common_widgets/headline_body_text.dart';
import 'package:history_ai/ui/onboarding/login_register/login_register_controller.dart';
import 'package:history_ai/ui/onboarding/login_register/register_screen.dart';
import 'package:history_ai/ui/onboarding/widgets/common_logo_text_view.dart';

class LoginScreen extends GetView<LoginRegisterController> {
  const LoginScreen({super.key});
  static final _formKey = GlobalKey<FormState>();

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
                    const SizedBox(height: 40),
                    const CommonLogoTextView(),
                    Expanded(
                        child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 40),
                            HeadlineBodyOneBaseWidget(
                              title: AppConstants.helloLoginNow.tr,
                              titleColor: ColorConstants.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 32,
                            ),
                            const SizedBox(height: 4),
                            HeadlineBodyOneBaseWidget(
                              title: AppConstants.loginDesc.tr,
                              titleColor: ColorConstants.black87,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                            const SizedBox(height: 24),
                            CommonTextField(
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
                            CommonTextField(
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
                          ],
                        ),
                      ),
                    )),
                    const SizedBox(height: 15),
                    CommonButton(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display proceed.
                          Get.toNamed(RouteConstants.mainScreen);

                        }
                      },
                      buttonText: AppConstants.login.tr,
                    ),
                    const SizedBox(height: 8),
                    Center(
                      child: RichText(
                          text:
                              TextSpan(style: GoogleFonts.inter(fontSize: 16, color: ColorConstants.black87, fontWeight: FontWeight.w400), children: [
                        TextSpan(text: AppConstants.noAccount.tr),
                        TextSpan(
                            text: AppConstants.registerNow.tr,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.to(const RegisterScreen());
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
