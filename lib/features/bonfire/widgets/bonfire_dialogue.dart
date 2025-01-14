import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stroll/core/constants/app_assets.dart';
import 'package:stroll/core/constants/app_colors.dart';
import 'package:stroll/features/bonfire/view_models/bonfire_view_model.dart';
import 'package:stroll/shared/widgets/circle_icon_button.dart';
import 'package:stroll/shared/widgets/option_box.dart';
import 'package:stroll/shared/widgets/title_framed_circle_image.dart';

class BonfireDialogue extends ConsumerWidget {
  BonfireDialogue({super.key});

  final options = [
    'The peace in the early mornings',
    'The magical golden hours',
    'Wind-down time after dinners',
    'The serenity past midnight'
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bonfireState = ref.watch(bonfireStateProvider);
    final bonfireNotifier = ref.read(bonfireStateProvider.notifier);
    return Stack(
      children: [
        TitleFramedCircleImage(
            assetPath: AppAssets.jpg.angelina, title: 'Angelina, 28'),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 80, top: 40),
              child: Text(
                'What is your favorite time of the day?',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '"Mine is definitely the peace in the morning."',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.italic,
                    color: AppColors.lightPurple,
                  ),
            ),
            const SizedBox(
              height: 20,
            ),
            GridView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 3,
                    crossAxisCount: 2),
                itemCount: options.length,
                itemBuilder: (context, index) {
                  return OptionBox(
                      text: options[index],
                      index: index,
                      selected: bonfireState.selectedOptionIndex == index,
                      onPressed: () {
                        bonfireNotifier.selectOption(index);
                      });
                }),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                    child: Text(
                  'Pick your option.\nSee who has a similar mind',
                  style: Theme.of(context).textTheme.bodySmall,
                )),
                const SizedBox(width: 10),
                CircleIconButton(
                  iconData: CupertinoIcons.mic_solid,
                  outlined: true,
                  onPressed: () {},
                ),
                CircleIconButton(
                  iconData: Icons.arrow_forward,
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
