import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: TSizes.spaceBetweenSections,
        ),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: TText.email,
              ),
            ),
            SizedBox(height: TSizes.spaceBtwInputFields),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: Icon(Iconsax.eye_slash),
                labelText: TText.password,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields / 2),

            // Remember Me and Forgot Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // Remember Me
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text(TText.rememberMe),
                  ],
                ),
                // Forgot Password
                TextButton(onPressed: () {}, child: Text(TText.forgotPassword)),
              ],
            ),
            SizedBox(height: TSizes.spaceBetweenSections),
            // Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(TText.signIn),
              ),
            ),
            SizedBox(height: TSizes.spaceBetweenItems),
            // Create an account button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {},
                child: Text(TText.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
