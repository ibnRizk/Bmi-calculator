import 'package:flutter/material.dart';

import '../constant.dart';

class IconContent extends StatelessWidget {
  const IconContent({required this.icon, required this.label, super.key});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: sixedHeight,
        ),
        Text(
          label,
          style: KLabelTextStyle,
        )
      ],
    );
  }
}
