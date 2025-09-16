import 'package:e_commerce/data/repositories/authentication_repository/authentication_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'firebase_options.dart';
import 'package:e_commerce/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  // Widget Binding
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // Getx local storage
  await GetStorage.init();
  // Await splash until other items load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // Intialize Firebase and Authentication Repository
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}
