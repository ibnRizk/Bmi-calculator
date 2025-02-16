import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  const RoundedIconButton(
      {super.key,
      required this.icon,
      required this.onPressed,
      required this.heroag});
  final IconData icon;
  final VoidCallback onPressed;
  final String heroag;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: heroag,
      onPressed: onPressed,
      shape: CircleBorder(),
      backgroundColor: Color(0xFF4C4F5E),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
