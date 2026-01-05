import 'package:e_commerce/bindings/general_binding.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      initialBinding: GeneralBinding(),
      // Show circular progress indicator meanwhile Authentication Repository is deciding to show relevant screen.
      home: Scaffold(
        backgroundColor: TColor.primaryColor,
        body: Center(child: CircularProgressIndicator(color: TColor.white)),
      ),
    );
  }
}
