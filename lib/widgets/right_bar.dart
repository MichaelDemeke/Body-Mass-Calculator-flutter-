import 'package:flutter/material.dart';
import 'package:body_mass_calculator/constants/app_constants.dart';

class RightBar extends StatelessWidget {
  final double barwidth;
  const RightBar({super.key, required this.barwidth});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 25,
          width: barwidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20), 
            ),
            color: accentHexColor, 
          ),
        )
      ],
    );
  }
}
