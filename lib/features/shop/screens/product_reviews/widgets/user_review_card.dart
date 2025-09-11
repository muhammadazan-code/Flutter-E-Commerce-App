import 'package:e_commerce/commons/widgets/custom_shape/containers/circular_containers.dart';
import 'package:e_commerce/commons/widgets/products/ratings/rating.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(backgroundImage: AssetImage(TImagePath.userImage)),
                SizedBox(width: TSizes.spaceBetweenItems),
                Text('John Doe', style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
          ],
        ),
        SizedBox(width: TSizes.spaceBetweenItems),
        // Reviews
        Row(
          children: [
            TRatingBar(),
            SizedBox(width: TSizes.spaceBetweenItems),
            Text('01 Nov, 2023', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        SizedBox(height: TSizes.spaceBetweenItems),
        ReadMoreText(
          'The user interface of the app is quite intuittive. I was able to navigate and make purchase seamlessly.Great Job!',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: 'Show less',
          trimCollapsedText: 'Show less',
          moreStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: TColor.primaryColor,
          ),
          lessStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: TColor.primaryColor,
          ),
        ),
        SizedBox(height: TSizes.spaceBetweenItems),
        // Company Review
        TCircularContainer(
          radius: 10,
          height: 170,
          width: THelperFunctions.screenWidth(context),
          backgroundColor: darkMode ? TColor.darkerGrey : TColor.grey,
          child: Padding(
            padding: EdgeInsets.all(TSizes.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Azan", style: Theme.of(context).textTheme.titleSmall),
                    Text(
                      "12 Nov, 2023",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                SizedBox(height: TSizes.spaceBetweenItems),
                ReadMoreText(
                  'The user interface of the app is quite intuittive. I was able to navigate and make purchase seamlessly.Great Job!',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: 'Show less',
                  trimCollapsedText: 'Show less',
                  moreStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: TColor.primaryColor,
                  ),
                  lessStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: TColor.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        // SizedBox(height: TSizes.spaceBetweenSections),
      ],
    );
  }
}
