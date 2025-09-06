import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TSectionHeading extends StatelessWidget {
  const TSectionHeading({
    super.key,
    this.textColor,
    this.showActionButton = true,
    required this.title,
    this.buttonTitle = "Button Title",
    this.onPressed,
    this.darkButtonTextColor = TColor.primaryColor,
    this.textDecoration = TextDecoration.underline,
    this.lightButtonTextColor = Colors.black,
  });
  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final Color darkButtonTextColor;
  final void Function()? onPressed;
  final TextDecoration textDecoration;
  final Color lightButtonTextColor;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.headlineSmall!.copyWith(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showActionButton)
          TextButton(
            onPressed: onPressed,
            child: Text(
              buttonTitle,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                decoration: textDecoration,
                color: dark ? darkButtonTextColor : lightButtonTextColor,
              ),
            ),
          ),
      ],
    );
  }
}
