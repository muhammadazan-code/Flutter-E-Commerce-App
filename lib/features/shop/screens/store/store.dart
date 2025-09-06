import 'package:e_commerce/commons/widgets/appbar/appbar.dart';
import 'package:e_commerce/commons/widgets/appbar/tabbar.dart';
import 'package:e_commerce/commons/widgets/brands/brand_card.dart';
import 'package:e_commerce/commons/widgets/custom_shape/containers/search_container.dart';
import 'package:e_commerce/commons/widgets/layout/grid_layout.dart';
import 'package:e_commerce/commons/widgets/products/cart/cart_menu.dart';
import 'package:e_commerce/commons/widgets/text/section_heading.dart';
import 'package:e_commerce/features/shop/screens/store/widget/category_tab.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TStoreScreen extends StatelessWidget {
  const TStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: TAppBar(
          bgColor: dark ? TColor.black : TColor.white,
          padding: 0.0,
          title: Text(
            "Store",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            TCartCounterWidget(
              onPressed: () {},
              iconColor: dark ? TColor.white : TColor.darkGrey,
            ),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScroller) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: dark ? TColor.black : TColor.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      SizedBox(height: TSizes.spaceBetweenItems),
                      // Search Bar
                      TSearchContainer(
                        text: "Search in Store",
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      SizedBox(height: TSizes.spaceBetweenSections),
                      // Featured Brands
                      TSectionHeading(
                        title: "Feature Brands",
                        showActionButton: true,
                        buttonTitle: "View All",
                      ),
                      SizedBox(height: TSizes.spaceBetweenItems / 1.5),
                      // Brands Grid
                      TGridLayout(
                        mainAxisExtent: 80,
                        itemCount: TImagePath.listOfLogosPath.length,
                        itemBuilder: (context, index) {
                          return TBrandCard(
                            showBorder: true,
                            imagePath: TImagePath.listOfLogosPath[index],
                            title: TText.namesOfLogosBrands[index],
                          );
                        },
                      ),
                    ],
                  ),
                ),
                bottom: TTabBar(
                  tabs: [
                    Tab(child: Text("Sports")),
                    Tab(child: Text("Furniture")),
                    Tab(child: Text("Electronics")),
                    Tab(child: Text("Clothes")),
                    Tab(child: Text("Cosmetics")),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
            ],
          ),
        ),
      ),
    );
  }
}
