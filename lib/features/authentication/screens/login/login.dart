import 'package:e_commerce/commons/login_and_sign/form_divider.dart';
import 'package:e_commerce/commons/login_and_sign/social_button.dart';
import 'package:e_commerce/commons/style/spacing_style.dart';
import 'package:e_commerce/features/authentication/screens/login/widgets/login_form.dart';
import 'package:e_commerce/features/authentication/screens/login/widgets/login_header.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              // Logo title and subtitle
              const LoginHeader(),
              // Form
              LoginForm(),
              // Divider
              TFormDivider(dividerText: TText.orSignInWith.capitalize!),
              SizedBox(height: TSizes.spaceBetweenItems),
              // Header
              const TSocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}
