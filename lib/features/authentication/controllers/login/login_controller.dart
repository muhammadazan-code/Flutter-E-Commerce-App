import 'package:e_commerce/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/helpers/network_manager.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:e_commerce/utils/popups/loaders.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  /// Variables
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final UserController userController = Get.put(UserController());

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? "";
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? "";
    super.onInit();
  }

  /// --- Email and Password Sign In
  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
        'Logging you in....',
        TImagePath.docerAnimation,
      );
      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      // Save data if Remember Me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }
      // Login user using Email and Password Authentications
      final userCredential = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(
            email.text.trim().toString(),
            password.text.trim().toString(),
          );
      // Remove Loader
      TFullScreenLoader.stopLoading();
      // Redirect
      AuthenticationRepository.instance.screenDirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  /// -- Google SignIn Authentication
  Future<void> googleSignIn() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
        'Logging you in..',
        TImagePath.docerAnimation,
      );
      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      // Google Authentication
      final userCredential = await AuthenticationRepository.instance
          .signInWithGoogle();
      // Save user Record
      await userController.saveUserRecord(userCredential);
      // Remove loader
      TFullScreenLoader.stopLoading();
      AuthenticationRepository.instance.screenDirect();
    } catch (e) {
      // Remove loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
