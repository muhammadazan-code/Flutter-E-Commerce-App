import 'package:e_commerce/features/authentication/controllers/signup/signup_controller.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class TTermsandConditions extends StatelessWidget {
  const TTermsandConditions({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(
            () => Checkbox(
              value: controller.privacyAndPolicy.value,
              onChanged: (value) => controller.privacyAndPolicy.value =
                  !controller.privacyAndPolicy.value,
            ),
          ),
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: TText.iAgree,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall!.copyWith(fontSize: 11),
              ),
              TextSpan(
                text: " ${TText.privacyPolicy} ",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: dark ? TColor.white : TColor.textPrimary,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                  decorationColor: dark ? TColor.white : TColor.textPrimary,
                ),
              ),
              TextSpan(
                text: TText.and,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall!.copyWith(fontSize: 11),
              ),
              TextSpan(
                text: " ${TText.termsofuse}",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: dark ? TColor.white : TColor.textPrimary,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
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
