import 'package:flutter/material.dart';

import '../constant.dart';

class bottomButton extends StatelessWidget {
  const bottomButton({super.key, required this.state, required this.ontap});
  final String state;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        color: KBottomContainerColor,
        height: KContainerHeight,
        margin: EdgeInsets.only(top: 8),
        child: Center(
          child: Text(
            state,
            style: Klargecotaier,
          ),
        ),
      ),
    );
  }
}
