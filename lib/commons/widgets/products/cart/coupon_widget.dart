import 'package:e_commerce/commons/widgets/custom_shape/containers/circular_containers.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CouponScreen extends StatelessWidget {
  const CouponScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TCircularContainer(
      radius: 20,
      height: 80,
      showBorder: true,
      backgroundColor: dark ? TColor.dark : TColor.white,
      padding: EdgeInsets.only(
        top: TSizes.sm,
        bottom: TSizes.sm,
        right: TSizes.sm,
        left: TSizes.md,
      ),
      child: Row(
        children: [
          // TextField
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Have a Promo Code? Enter here.',
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
              ),
            ),
          ),
          SizedBox(width: TSizes.xs),
          // Button
          SizedBox(
            width: 80,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                side: BorderSide(color: Colors.grey.withOpacity(.1)),
                foregroundColor: dark
                    ? TColor.white.withOpacity(.5)
                    : TColor.blackColor.withOpacity(.5),
                backgroundColor: Colors.grey.withOpacity(.2),
              ),

              child: Text("Apply"),
            ),
          ),
        ],
      ),
    );
  }
}
