import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stroll/core/constants/app_assets.dart';
import 'package:stroll/core/constants/app_colors.dart';
import 'package:stroll/core/extensions/icon_api.dart';
import 'package:stroll/core/extensions/text_api.dart';
import 'package:stroll/features/bonfire/view_models/bonfire_view_model.dart';
import 'package:stroll/features/bonfire/widgets/bonfire_dialogue.dart';
import 'package:stroll/shared/widgets/framed_circle_image.dart';
import 'package:stroll/shared/widgets/image_background_drop.dart';
import 'package:stroll/shared/widgets/title_framed_circle_image.dart';

class BonfirePage extends ConsumerWidget {
  const BonfirePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bonfireState = ref.watch(bonfireStateProvider);
    final bonfireNotifier = ref.read(bonfireStateProvider.notifier);
    return Scaffold(
        body: ImageBackgroundDrop(
            image: Image(
              height: MediaQuery.of(context).size.height * 0.6,
              width: double.infinity,
              fit: BoxFit.cover,
              image: AssetImage(AppAssets.jpg.sunsetBackground),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: kTextTabBarHeight + 40),
                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          'Stroll Bonfire',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                color: AppColors.lightPurple,
                                fontWeight: FontWeight.w700,
                              ),
                        ).applyShadow(),
                        const SizedBox(width: 5),
                        const Icon(
                          Icons.keyboard_arrow_down_outlined,
                          size: 20,
                          color: AppColors.lightPurple,
                        ).applyShadow(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          AppAssets.svg.timer,
                          height: 15,
                        ),
                        const SizedBox(width: 5),
                        Text('22h 00m',
                                style: Theme.of(context).textTheme.bodyMedium)
                            .applyShadow(),
                        const SizedBox(width: 10),
                        SvgPicture.asset(AppAssets.svg.user, height: 15),
                        const SizedBox(width: 5),
                        Text('103',
                                style: Theme.of(context).textTheme.bodyMedium)
                            .applyShadow(),
                      ],
                    ),
                  ),
                  const Spacer(),
                  BonfireDialogue(),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            )));
  }
}
