import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/commons/widgets/custom_shape/containers/circular_containers.dart';
import 'package:e_commerce/commons/widgets/images/t_rounded_image.dart';
import 'package:e_commerce/features/shop/controllers/home_controller.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({super.key, required this.banner});
  final List<String> banner;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        CarouselSlider(
          items: banner
              .map(
                (url) => TRoundedImage(
                  imageUrl: url,
                  borderRadius: TSizes.md,
                  width: THelperFunctions.screenWidth(context) * 1.1,
                ),
              )
              .toList(),
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
          ),
        ),
        SizedBox(height: TSizes.spaceBetweenItems),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < banner.length; i++)
                  TCircularContainer(
                    width: 20,
                    height: 4,
                    backgroundColor: controller.carousalCurrentIndex.value == i
                        ? (dark ? TColor.primaryBackground : TColor.textPrimary)
                        : (dark ? TColor.dark : TColor.primaryBackground),
                    margin: EdgeInsets.only(right: 10),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
