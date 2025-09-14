import 'package:e_commerce/commons/widgets/custom_shape/containers/circular_containers.dart';
import 'package:e_commerce/commons/widgets/text/section_heading.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TBillingPaymentSection extends StatelessWidget {
  const TBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        TSectionHeading(
          title: 'Payment Method',
          buttonTitle: 'Change',
          onPressed: () {},
        ),
        SizedBox(height: TSizes.spaceBetweenItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TCircularContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ? TColor.light : TColor.white,
              child: Image(
                image: AssetImage(TImagePath.payPal),
                fit: BoxFit.contain,
              ),
            ),
            Text('Paypal', style: Theme.of(context).textTheme.headlineMedium),
          ],
        ),
      ],
    );
  }
}
