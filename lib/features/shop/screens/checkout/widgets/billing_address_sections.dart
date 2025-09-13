import 'package:e_commerce/commons/widgets/text/section_heading.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TSectionHeading(
          title: 'Shipping Address',
          buttonTitle: 'Change',
          onPressed: () {},
        ),
        Text('xyz', style: Theme.of(context).textTheme.bodyLarge),
        SizedBox(height: TSizes.spaceBetweenItems / 2),
        Row(
          children: [
            Icon(Icons.phone, color: TColor.grey, size: 16),
            SizedBox(width: TSizes.spaceBetweenItems),
            Text('+93200200202', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        SizedBox(height: TSizes.spaceBetweenItems / 2),
        Row(
          children: [
            Icon(Icons.location_history, color: TColor.grey, size: 16),
            SizedBox(width: TSizes.spaceBetweenItems),
            Expanded(
              child: Text(
                'Karachi, Pakistan',
                style: Theme.of(context).textTheme.bodyMedium,
                softWrap: true,
              ),
            ),
          ],
        ),
        SizedBox(height: TSizes.spaceBetweenItems / 2),
      ],
    );
  }
}
