import 'package:flutter/material.dart';

class ReuseContainer extends StatelessWidget {
  const ReuseContainer(
      {required this.colour, this.onpress, this.cardchild, super.key});
  final Color colour;
  final Widget? cardchild;
  final dynamic onpress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10),
        ),
        child: cardchild,
      ),
    );
  }
}
