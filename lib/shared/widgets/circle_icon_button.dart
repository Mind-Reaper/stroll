import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  const CircleIconButton(
      {super.key,
      required this.iconData,
      this.onPressed,
      this.outlined = false,
      this.color,
      this.filledIconColor,
      this.radius = 22});

  final IconData iconData;
  final VoidCallback? onPressed;
  final bool outlined;
  final Color? color;
  final Color? filledIconColor;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: Size.fromRadius(radius),
          visualDensity: VisualDensity.compact,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: const EdgeInsets.all(5),
          backgroundColor: outlined
              ? Colors.transparent
              : color ?? Theme.of(context).primaryColor,
          shape: CircleBorder(
              side: outlined
                  ? BorderSide(
                      width: 1, color: color ?? Theme.of(context).primaryColor)
                  : BorderSide.none),
        ),
        onPressed: onPressed,
        child: FittedBox(
          child: Icon(
            iconData,
            color: outlined
                ? color ?? Theme.of(context).primaryColor
                : filledIconColor ?? Colors.black,
          ),
        ));
  }
}
