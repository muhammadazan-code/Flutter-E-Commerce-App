import 'package:e_commerce/commons/widgets/image_text_widgets/vertical_image_text_widget.dart';
import 'package:e_commerce/commons/widgets/shimmer_effect/category_shimmer.dart';
import 'package:e_commerce/features/shop/controllers/category_controller.dart';
import 'package:e_commerce/features/shop/screens/sub_category/sub_category_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    return Obx(() {
      if (categoryController.isLoading.value) {
        return TCategoryShimmer();
      }
      if (categoryController.featuredCategory.isEmpty) {
        return Center(
          child: Text(
            'No data found',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.apply(color: Colors.white),
          ),
        );
      }
      return SizedBox(
        height: 100,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: categoryController.featuredCategory.length,
          itemBuilder: (context, index) {
            final controller = categoryController.featuredCategory[index];
            return TVerticalImageText(
              isNetworkImage: true,
              image: controller.image,
              title: controller.name,
              onTap: () => Get.to(() => SubCategoryScreen()),
            );
          },
        ),
      );
    });
  }
}
