import 'package:e_commerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TButtonLoadingWidget extends StatelessWidget {
  const TButtonLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(color: TColor.white),
        ),
        SizedBox(width: 10),
        Text('Loading...'),
      ],
    );
  }
}
