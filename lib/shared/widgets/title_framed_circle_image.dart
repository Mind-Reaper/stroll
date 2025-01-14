import 'package:flutter/material.dart';
import 'package:stroll/shared/widgets/framed_circle_image.dart';

class TitleFramedCircleImage extends StatelessWidget {
  const TitleFramedCircleImage(
      {super.key, required this.assetPath, required this.title});

  final String assetPath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 20,
                width: 108,
                padding: const EdgeInsets.only(
                    left: 30, right: 10, top: 2, bottom: 2),
                decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                    borderRadius: BorderRadius.circular(10)),
                child: FittedBox(
                  child: Text(title,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          )),
                ),
              ),
            ),
          ),
          FramedCircleImage(assetPath: assetPath),
        ],
      ),
    );
  }
}
