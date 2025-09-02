import 'package:e_commerce/features/authentication/screens/signup/verify_email.dart';
import 'package:e_commerce/features/authentication/screens/signup/widgets/terms_and_conditions.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';

class TSignUpForm extends StatelessWidget {
  const TSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          // First and last name
          Row(
            children: [
              // First name
              Expanded(
                child: TextFormField(
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
            expands: false,
            decoration: InputDecoration(
              labelText: TText.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),
          SizedBox(height: TSizes.spaceBtwInputFields),
          // Email
          TextFormField(
            decoration: InputDecoration(
              labelText: TText.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          SizedBox(height: TSizes.spaceBtwInputFields),
          // Phone Number
          TextFormField(
            decoration: InputDecoration(
              labelText: TText.phoneNumber,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          SizedBox(height: TSizes.spaceBtwInputFields),
          // Password
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: TText.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
          ),
          SizedBox(height: TSizes.spaceBtwInputFields),

          /// Terms and Conditions
          TTermsandConditions(),
          const SizedBox(height: TSizes.spaceBetweenSections),
          // Create an account
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Get.to(() => const VerifyEmailScreen()),
              child: Center(child: Text(TText.createAccount)),
            ),
          ),
        ],
      ),
    );
  }
}
