import 'package:e_commerce/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:iconsax/iconsax.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Heading
            Text(
              TText.forgotPassword,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: TSizes.spaceBetweenItems),
            Text(
              TText.forgotPasswordSubtitle,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: dark ? TColor.white : TColor.dark,
                fontSize: 15,
              ),
            ),
            SizedBox(height: TSizes.spaceBetweenSections),
            // Text Form
            TextFormField(
              decoration: InputDecoration(
                labelText: TText.email,
                prefixIcon: Icon(Iconsax.direct_right),
              ),
            ),
            SizedBox(height: TSizes.spaceBetweenSections),
            // Social button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.off(() => const ResetPasswordScreen()),
                child: Text(TText.submit),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
