import 'package:e_commerce/commons/widgets/images/t_circular_image.dart';
import 'package:e_commerce/commons/widgets/shimmer_effect/shimmer_effect_widget.dart';
import 'package:e_commerce/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TUserProfileTitle extends StatelessWidget {
  const TUserProfileTitle({super.key, required this.onPressed});
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return ListTile(
      leading: TCircularImage(
        image: TImagePath.userImage,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Obx(() {
        if (controller.profileLoading.value) {
          return const TShimmerEffect(width: 80, height: 15);
        } else {
          return Text(
            controller.user.value.fullName,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall!.apply(color: TColor.textWhite),
          );
        }
      }),
      subtitle: Obx(() {
        if (controller.profileLoading.value) {
          return const TShimmerEffect(width: 80, height: 15);
        } else {
          return Text(
            controller.user.value.email,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.apply(color: TColor.textWhite),
          );
        }
      }),
      trailing: IconButton(
        onPressed: onPressed,
        icon: Icon(Iconsax.edit, color: TColor.white),
      ),
    );
  }
}
