import 'package:e_commerce/features/authentication/screens/login/login.dart';
import 'package:e_commerce/features/authentication/screens/onBoarding/on_boarding_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  // Variable
  final deviceStorage = GetStorage();

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenDirect();
  }

  // Function to show relevant screen
  void screenDirect() async {
    // Local Storage
    if (kDebugMode) {
      print('======== GET STORAGE ========');
      print(deviceStorage.read('IsFirstTime'));
    }
    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(const OnBoardingScreen());
  }
}
