import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TSpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight =
      EdgeInsetsGeometry.only(
        top: TSizes.appBarHeight,
        bottom: TSizes.defaultSpace,
        right: TSizes.defaultSpace,
        left: TSizes.defaultSpace,
      );
}
