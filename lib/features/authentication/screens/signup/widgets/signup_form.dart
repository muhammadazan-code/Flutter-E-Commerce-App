import 'package:e_commerce/features/authentication/controllers/signup/signup_controller.dart';
import 'package:e_commerce/features/authentication/screens/signup/widgets/terms_and_conditions.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:e_commerce/utils/validators/validations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TSignUpForm extends StatelessWidget {
  const TSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          // First and last name
          Row(
            children: [
              // First name
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      TValidator.validateEmptyText('Field name', value),
                  expands: false,
                  decoration: InputDecoration(
                    labelText: TText.firstname,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              SizedBox(width: TSizes.spaceBtwInputFields),
              // Last name
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) =>
                      TValidator.validateEmptyText('Last name', value),
                  expands: false,
                  decoration: InputDecoration(
                    labelText: TText.lastname,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: TSizes.spaceBtwInputFields),
          // Username
          TextFormField(
            controller: controller.username,
            expands: false,
            validator: (value) =>
                TValidator.validateEmptyText('Username', value),
            decoration: InputDecoration(
              labelText: TText.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),
          SizedBox(height: TSizes.spaceBtwInputFields),
          // Email
          TextFormField(
            controller: controller.email,
            validator: (value) => TValidator.validateEmail(value),
            decoration: InputDecoration(
              labelText: TText.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          SizedBox(height: TSizes.spaceBtwInputFields),
          // Phone Number
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => TValidator.validatePhoneNumber(value),
            decoration: InputDecoration(
              labelText: TText.phoneNumber,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          SizedBox(height: TSizes.spaceBtwInputFields),
          // Password
          Obx(
            () => TextFormField(
              controller: controller.password,
              obscureText: controller.hidePassword.value,
              validator: (value) => TValidator.validatePassword(value),
              decoration: InputDecoration(
                labelText: TText.password,
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  onPressed: () => controller.hidePassword.value =
                      !controller.hidePassword.value,
                  icon: Icon(
                    controller.hidePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: TSizes.spaceBtwInputFields),
          // Terms and Conditions
          TTermsandConditions(),
          const SizedBox(height: TSizes.spaceBetweenSections),
          // Create an account
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signup(),
              child: Center(child: Text(TText.createAccount)),
            ),
          ),
        ],
      ),
    );
  }
}
