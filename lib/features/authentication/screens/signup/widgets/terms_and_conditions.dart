import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TTermsandConditions extends StatelessWidget {
  const TTermsandConditions({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        Checkbox(value: true, onChanged: (value) {}),
        SizedBox(width: TSizes.spaceBetweenItems),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: TText.iAgree,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextSpan(
                text: TText.privacyPolicy,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? TColor.white : TColor.textPrimary,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? TColor.white : TColor.textPrimary,
                ),
              ),
              TextSpan(
                text: TText.and,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextSpan(
                text: TText.termsofuse,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? TColor.white : TColor.textPrimary,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? TColor.white : TColor.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
