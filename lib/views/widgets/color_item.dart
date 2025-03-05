import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem(
      {super.key, this.isActive = true, this.onTap, required this.color});

  final bool isActive;
  final Color color;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: isActive
          ? CircleAvatar(
              radius: 38,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 36,
                backgroundColor: color,
              ),
            )
          : CircleAvatar(
              radius: 38,
              backgroundColor: color,
            ),
    );
  }
}
