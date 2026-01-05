import 'package:e_commerce/commons/widgets/appbar/appbar.dart';
import 'package:e_commerce/features/personalization/controllers/update_name_controller.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:e_commerce/utils/validators/validations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      // Custom Appbar
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          "Change Name",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading
            Text(
              'Use real name for easy verification. This name will appear on several pages.',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(height: TSizes.spaceBetweenSections),
            // Text Field and Button
            Form(
              key: controller.updateUserNameFormKey,

              child: Column(
                children: [
                  // First Name
                  TextFormField(
                    controller: controller.firstName,
                    validator: (value) =>
                        TValidator.validateEmptyText('First name', value),
                    expands: false,
                    decoration: InputDecoration(
                      labelText: TText.firstname,
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),
                  SizedBox(height: TSizes.spaceBtwInputFields),
                  // Last Name
                  TextFormField(
                    controller: controller.lastName,
                    expands: false,
                    decoration: InputDecoration(
                      labelText: TText.lastname,
                      prefixIcon: Icon(Iconsax.user),
                    ),
                    validator: (value) =>
                        TValidator.validateEmptyText('Last name', value),
                  ),
                ],
              ),
            ),
            SizedBox(height: TSizes.spaceBetweenItems),
            // Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.updateUserName(),
                child: Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
