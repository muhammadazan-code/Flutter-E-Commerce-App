import 'package:flutter/material.dart';

class TProductPrice extends StatelessWidget {
  const TProductPrice({
    super.key,
    required this.price,
    this.currencySign = "\$",
    this.maxlines = 1,
    this.isLarge = false,
    this.lineThrough = false,
  });
  final String price, currencySign;
  final int maxlines;
  final bool isLarge;
  final bool lineThrough;

  @override
  Widget build(BuildContext context) {
    return Text(
      currencySign + price,
      maxLines: maxlines,
      overflow: TextOverflow.ellipsis,
      style: isLarge
          ? Theme.of(context).textTheme.headlineMedium!.apply(
              decoration: lineThrough ? TextDecoration.lineThrough : null,
            )
          : Theme.of(context).textTheme.titleLarge!.apply(
              decoration: lineThrough ? TextDecoration.lineThrough : null,
            ),
    );
  }
}
