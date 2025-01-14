import 'package:flutter/material.dart';

extension IconApi on Icon {
  Icon applyShadow([Shadow? shadow]) {
    return Icon(
      icon,
      color: color,
      size: size,
      semanticLabel: semanticLabel,
      textDirection: textDirection,
      shadows: [
        shadow ??
            const Shadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 20,
            )
      ],
      key: key,
    );
  }
}
