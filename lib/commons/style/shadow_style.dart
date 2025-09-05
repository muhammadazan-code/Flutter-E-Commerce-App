import 'package:e_commerce/utils/constants/colors.dart';
import 'package:flutter/rendering.dart';

class TShadowStyle {
  static final verticalProductShadow = BoxShadow(
    color: TColor.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: Offset(0, 2),
  );
  static final horizontalProductShadow = BoxShadow(
    color: TColor.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: Offset(0, 2),
  );
}
