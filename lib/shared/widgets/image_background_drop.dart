import 'dart:ui';

import 'package:flutter/material.dart';

class ImageBackgroundDrop extends StatelessWidget {
  const ImageBackgroundDrop(
      {required this.image, required this.child, super.key});

  final Widget image;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ShaderMask(
          shaderCallback: (bounds) {
            return const LinearGradient(
              colors: [
                Colors.black45,
                Colors.transparent,
                Colors.black,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ).createShader(bounds);
          },
          blendMode: BlendMode.dstOut,
          child: Stack(
            children: [
              image,
              ClipRect(
                child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: const SizedBox()),
              ),
            ],
          ),
        ),
        child,
      ],
    );
  }
}
