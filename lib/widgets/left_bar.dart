import 'package:flutter/material.dart';
import 'package:body_mass_calculator/constants/app_constants.dart';

class LeftBar extends StatelessWidget {

 final double barWidth; 
const LeftBar({super.key, required this.barWidth});

  @override
  Widget build(BuildContext context) {


    return Row(
      mainAxisAlignment: MainAxisAlignment.end, // align everything in the right side of the row
      children: [
        Container(
          height: 25,
          width: barWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20)
            ),
            color: accentHexColor
            
            ),
        )
      ],

    );
  }
}
