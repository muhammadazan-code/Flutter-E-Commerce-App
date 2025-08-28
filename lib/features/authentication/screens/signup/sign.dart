import 'package:e_commerce/commons/login_and_sign/form_divider.dart';
import 'package:e_commerce/commons/login_and_sign/social_button.dart';
import 'package:e_commerce/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text(
                TText.signInTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: TSizes.spaceBetweenItems),

              /// Form
              const TSignUpForm(),
              const SizedBox(height: TSizes.spaceBetweenItems),
              // Divider
              TFormDivider(dividerText: TText.orSignInWith.capitalize!),
              const SizedBox(height: TSizes.spaceBetweenItems),
              // Social Button
              const TSocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}
