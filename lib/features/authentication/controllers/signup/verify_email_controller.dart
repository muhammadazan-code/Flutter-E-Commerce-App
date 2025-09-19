import 'dart:async';
import 'package:e_commerce/commons/widgets/success_screen/succes_screen.dart';
import 'package:e_commerce/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:e_commerce/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    checkEmailVerificationStatus();
    super.onInit();
  }

  //Send Email Verification Link
  void sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.succesSnackbar(
        title: 'Email Sent',
        message: "Please Check your inbox and Verify your email.",
      );
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  // Timer to automatically
  void setTimerAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(
          () => SuccesScreen(
            image: TImagePath.successfullyRegisterAnimation,
            title: TText.yourAccountCreated,
            subTitle: TText.youraccountCreatedSubTitle,
            onPressed: () => AuthenticationRepository.instance.screenDirect(),
          ),
        );
      }
    });
  }

  // Manually Check if Email Verified
  void checkEmailVerificationStatus() async {
    final currenctUser = FirebaseAuth.instance.currentUser;
    if (currenctUser != null && currenctUser.emailVerified) {
      Get.off(
        () => SuccesScreen(
          title: TText.yourAccountCreated,
          subTitle: TText.youraccountCreatedSubTitle,
          onPressed: () => AuthenticationRepository.instance.screenDirect(),
        ),
      );
    }
  }
}
