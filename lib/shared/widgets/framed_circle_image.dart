import 'package:flutter/material.dart';

class FramedCircleImage extends StatelessWidget {
  const FramedCircleImage({super.key, required this.assetPath, this.radius});

  final String assetPath;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (radius ?? 30) * 2,
      height: (radius ?? 30) * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Theme.of(context).canvasColor,
          width: 5,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 2),
            blurRadius: 20,
          ),
        ],
      ),
      child: ClipOval(
        child: Image.asset(
          assetPath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
