import 'package:flutter/material.dart';

class LandingFilterButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const LandingFilterButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    const borderColor = Color(0xFFE0E0E0);

    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: onPressed,
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: borderColor),
        ),
        child: const Icon(Icons.search),
      ),
    );
  }
}
