import 'package:e_commerce/data/personalization/models/user_models.dart';
import 'package:e_commerce/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce/data/repositories/user/user_repository.dart';
import 'package:e_commerce/features/authentication/screens/login/login_screen.dart';
import 'package:e_commerce/features/personalization/screens/profile/widgets/re_authentication_user_login_form.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/network_manager.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:e_commerce/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  Rx<UserModel> user = UserModel.empty().obs;
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  final UserRepository userRepository = Get.put(UserRepository());
  final hidePassword = true.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();
  final imageUploading = false.obs;
  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  // Fetch User Record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  // Save user Record from any Registration Provider
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      /// Frist update Rx User and then check if user data is already stored. If not store new data
      await fetchUserRecord();

      /// If no record is already stored
      if (user.value.id.isEmpty) {
        if (userCredential != null) {
          // Convert Name to First and last name
          final nameParts = UserModel.nameParts(
            userCredential.user!.displayName ?? '',
          );
          final username = UserModel.generateUsername(
            userCredential.user!.displayName ?? '',
          );
          final user = UserModel(
            id: userCredential.user!.uid,
            username: username,
            email: userCredential.user!.email ?? '',
            firstName: nameParts[0],
            lastName: nameParts.length > 1
                ? nameParts.sublist(1).join(' ')
                : '',
            phoneNumber: userCredential.user!.phoneNumber ?? '',
            profilePicture: userCredential.user!.photoURL ?? '',
          );
          // Save user data
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      TLoaders.warningSnackBar(
        title: "Data not saved",
        message:
            'Something went wrong while saving your informations. You can re-save your data in your Profile.',
      );
    }
  }

  // Delete Account Warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: EdgeInsets.all(TSizes.md),
      title: 'Delete Account',
      middleText:
          'Are you sure you want to delete your account permanently? This action is not reversible and all of your data wwil be removed permanently.',
      confirm: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: TColor.redColor,
          side: BorderSide(color: TColor.redColor),
        ),
        onPressed: () => deleteUseAccount(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: TSizes.lg),
          child: Text('Delete'),
        ),
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: Text('Cancel'),
      ),
    );
  }

  // Delete User Account
  Future<void> deleteUseAccount() async {
    try {
      TFullScreenLoader.stopLoading();

      /// First re-authentication users.
      final auth = AuthenticationRepository.instance;
      final authProvider = auth.authUser!.providerData
          .map((e) => e.providerId)
          .first;

      if (authProvider.isNotEmpty) {
        /// Re Verify Auth Email
        if (authProvider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          TFullScreenLoader.stopLoading();
          Get.offAll(() => LoginScreen());
        } else if (authProvider == 'password') {
          TFullScreenLoader.stopLoading();
          Get.offAll(() => ReAuthLoginForm());
        }
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      TFullScreenLoader.stopLoading();
      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      if (!reAuthFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance.reAuthenticateEmailAndPassword(
        email: verifyEmail.text.trim(),
        password: verifyPassword.text.trim(),
      );
      await AuthenticationRepository.instance.deleteAccount();
      TFullScreenLoader.stopLoading();
      Get.offAll(() => LoginScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// Upload Profile Image
  Future<void> uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
        maxHeight: 512,
        maxWidth: 512,
      );
      if (image != null) {
        imageUploading.value = true;
        // Upload Image
        final imageUrl = userRepository.uploadImage(
          path: 'Users/Images/Profiles/',
          image: image,
        );
        // Update User Image Record
        Map<String, dynamic> json = {'ProfilePicture': imageUrl};
        await userRepository.updateSingleField(json);
        user.value.profilePicture = await imageUrl;
        user.refresh();

        TLoaders.succesSnackbar(
          title: 'Congratulations',
          message: 'Your profile image has been updated.',
        );
      }
    } catch (e) {
      TLoaders.errorSnackBar(
        title: 'Oh Snap',
        message: 'Something went wrong: ${e.toString()}',
      );
    } finally {
      imageUploading.value = false;
    }
  }
}
