import 'package:e_commerce/commons/widgets/custom_shape/containers/circular_containers.dart';
import 'package:e_commerce/commons/widgets/custom_shape/curved_edges/curved_edges_widget.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return TCurvedEdgeWidget(
      child: Container(
        padding: EdgeInsets.only(bottom: 0),
        decoration: BoxDecoration(color: TColor.primaryColor),
        child: SizedBox(
          height: 400,
          child: Stack(
            children: [
              Positioned(
                top: -150,
                right: -250,
                child: TCircularContainer(
                  backgroundColor: TColor.white.withOpacity(0.1),
                ),
              ),
              Positioned(
                top: 100,
                right: -300,
                child: TCircularContainer(
                  backgroundColor: TColor.white.withOpacity(0.1),
                ),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
