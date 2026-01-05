import 'package:e_commerce/commons/widgets/buttons/button_loading_widgets.dart';
import 'package:flutter/material.dart';

class TPrimaryButton extends StatelessWidget {
  const TPrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = true,
    this.isFullWidth = true,
    this.width = 100,
  });
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final bool isFullWidth;
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isFullWidth ? double.infinity : width,
      child: ElevatedButton(
        onPressed: onPressed,
        child: isLoading ? TButtonLoadingWidget() : Text(text),
      ),
    );
  }
}
