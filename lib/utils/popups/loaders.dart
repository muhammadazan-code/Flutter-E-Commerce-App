import 'package:e_commerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';

class TLoaders {
  static void succesSnackbar({
    required String title,
    message = '',
    int duration = 3,
  }) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: TColor.white,
      backgroundColor: TColor.primaryColor,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: EdgeInsets.all(10),
      icon: Icon(Iconsax.check, color: TColor.white),
    );
  }

  static void warningSnackBar({required String title, message = ''}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: TColor.white,
      backgroundColor: Colors.orange,
      duration: Duration(seconds: 3),
      margin: EdgeInsets.all(10),

      icon: Icon(Iconsax.warning_2, color: TColor.white),
    );
  }
  static void errorSnackBar({required String title, message = ''}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: TColor.white,
      backgroundColor: Colors.red.shade600,
      duration: Duration(seconds: 3),
      margin: EdgeInsets.all(10),

      icon: Icon(Iconsax.warning_2, color: TColor.white),
    );
  }


}
