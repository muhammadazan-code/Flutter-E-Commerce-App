import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TFormDivider extends StatelessWidget {
  final String dividerText;
  const TFormDivider({super.key, required this.dividerText});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: dark ? TColor.darkGrey : TColor.grey,
            thickness: 1.5,
            indent: 5,
            endIndent: 5,
          ),
        ),
        Text(dividerText, style: Theme.of(context).textTheme.labelMedium),
        Flexible(
          child: Divider(
            color: dark ? TColor.darkGrey : TColor.grey,
            thickness: 1.5,
            indent: 5,
            endIndent: 5,
          ),
        ),
      ],
    );
  }
}
