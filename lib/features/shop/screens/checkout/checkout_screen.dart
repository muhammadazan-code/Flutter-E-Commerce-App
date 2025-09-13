import 'package:flutter/material.dart';
import 'package:e_commerce/commons/widgets/appbar/appbar.dart';
import 'package:e_commerce/commons/widgets/custom_shape/containers/circular_containers.dart';
import 'package:e_commerce/commons/widgets/products/cart/coupon_widget.dart';
import 'package:e_commerce/commons/widgets/success_screen/succes_screen.dart';
import 'package:e_commerce/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:e_commerce/features/shop/screens/checkout/widgets/billing_address_sections.dart';
import 'package:e_commerce/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:e_commerce/features/shop/screens/checkout/widgets/billing_payments_section.dart';
import 'package:e_commerce/navigation_menu.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class TCheckOutScreen extends StatelessWidget {
  const TCheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              CartItem(showAddRemove: false, length: 3),
              SizedBox(height: TSizes.spaceBetweenSections),
              // Coupon TextField
              CouponScreen(),
              SizedBox(height: TSizes.spaceBetweenSections),
              // Billing Sections
              TCircularContainer(
                height: 490,
                radius: 20,
                padding: EdgeInsets.all(TSizes.defaultSpace),
                showBorder: true,
                backgroundColor: dark ? TColor.black : TColor.white,
                child: Column(
                  children: [
                    // Pricing
                    TBillingAmountSection(),
                    SizedBox(height: TSizes.spaceBetweenItems),
                    //Divider
                    Divider(),
                    SizedBox(height: TSizes.spaceBetweenItems),
                    // Payment Method
                    TBillingPaymentSection(),
                    SizedBox(height: TSizes.spaceBetweenItems),
                    // Address
                    TBillingAddressSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(
            () => SuccesScreen(
              image: TImagePath.successfulpayment,
              title: 'Payment Success',
              subTitle: 'Your item will be shipped soon!',
              onPressed: () => Get.to(() => NavigationMenu()),
            ),
          ),
          child: Text('Checkout \$256.0'),
        ),
      ),
    );
  }
}
