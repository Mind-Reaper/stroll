import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:stroll/core/extensions/int_api.dart';

class OptionBox extends StatelessWidget {
  const OptionBox(
      {super.key,
      this.onPressed,
      required this.text,
      required this.index,
      required this.selected});

  final VoidCallback? onPressed;
  final String text;
  final int index;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black,
                  offset: Offset(5, 5),
                  blurRadius: 3,
                  blurStyle: BlurStyle.inner,
                  spreadRadius: -12),
            ],
            border: selected
                ? Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                    strokeAlign: BorderSide.strokeAlignOutside)
                : null),
        child: Row(
          children: [
            Container(
                height: 20,
                width: 20,
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                    color: selected
                        ? Theme.of(context).primaryColor
                        : Colors.transparent,
                    shape: BoxShape.circle,
                    border: selected
                        ? null
                        : Border.all(
                            color:
                                Theme.of(context).textTheme.bodySmall?.color ??
                                    Colors.white30,
                            width: 1)),
                child: FittedBox(
                  child: Text(
                    index.toAlphabet(isUppercase: true),
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: selected ? Colors.white : null),
                  ),
                )),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: Text(text,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 14,
                        )))
          ],
        ),
      ),
    );
  }
}
