import 'package:e_commerce/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce/features/authentication/screens/password_configuration/reset_password_screen.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/helpers/network_manager.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:e_commerce/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  static ForgotPasswordController get instance => Get.find();
  //Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();
  // Send Reset Password Email
  Future<void> sendPasswordResetEmail() async {
    try {
      TFullScreenLoader.openLoadingDialog(
        'Processing your request...',
        TImagePath.docerAnimation,
      );
      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      // Form Validations
      if (!forgotPasswordFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      // Send email to reset password
      await AuthenticationRepository.instance.sendPasswordResetEmail(
        email.text.trim(),
      );

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Success Screen
      TLoaders.succesSnackbar(
        title: 'Email Sent',
        message: 'Email link sent to Reset your Password'.tr,
      );

      // Redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      // Remove Loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  Future<void> resendPasswordResetEmail(String email) async {
    try {
      TFullScreenLoader.openLoadingDialog(
        'Processing your request...',
        TImagePath.docerAnimation,
      );
      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      // Send email to reset password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Success Screen
      TLoaders.succesSnackbar(
        title: 'Email Sent',
        message: 'Email link sent to Reset your Password'.tr,
      );
    } catch (e) {
      // Remove Loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
