import 'package:e_commerce/data/personalization/models/user_models.dart';
import 'package:e_commerce/utils/exceptions/firebase_exception.dart';
import 'package:e_commerce/utils/exceptions/format_exceptions.dart';
import 'package:e_commerce/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Function to save user data to Firestore
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection('Users').doc(user.id).set(user.toJson());
    } on FirebaseException catch (_) {
      throw TFirebaseExceptions();
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (_) {
      throw TPlatformException();
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }
}
