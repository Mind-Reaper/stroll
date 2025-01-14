import 'package:flutter/material.dart';

extension TextApi on Text {
  Text applyShadow([Shadow? shadow]) {
    return Text(
      data ?? '',
      style: style?.copyWith(shadows: [
        shadow ??
            const Shadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 20,
            )
      ]),
    );
  }
}
