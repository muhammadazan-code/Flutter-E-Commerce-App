import 'dart:async';
import 'package:e_commerce/data/personalization/models/user_models.dart';
import 'package:e_commerce/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce/data/repositories/user/user_repository.dart';
import 'package:e_commerce/features/authentication/screens/signup/verify_email.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/helpers/network_manager.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:e_commerce/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();
  // Variables
  final privacyAndPolicy = true.obs;
  final hidePassword = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  final lastName = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  final username = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  // --- Sign Up
  Future<void> signup() async {
    try {
      // Start loading
      TFullScreenLoader.openLoadingDialog(
        'We are processing your information...',
        TImagePath.docerAnimation,
      );
      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
      }
      // Form Validation
      if (!signupFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
      }
      // Privacy Policy
      if (!privacyAndPolicy.value) {
        TLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message:
              'In order to create an account, You must have to read and accept the Privacy Policy and Terms of Use.',
        );
        return;
      }
      // Register User in the Firebase Authentication and Save the user data in the Firebase.
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
            email.text.trim(),
            password.text.trim(),
          );
      // Save Authentication user data in the Firebase Firestore.
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: "",
      );

      final userRepository = Get.put(UserRepository());
      userRepository.saveUserRecord(newUser);
      // Show Success Message
      TLoaders.succesSnackbar(
        title: 'Congratulations',
        message: 'Your account has been created! Verify email to continue.',
      );
      // Move to Verify Email Screen
      Get.to(() => VerifyEmailScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      // Show some Generic Error to the user
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
