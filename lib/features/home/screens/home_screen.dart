import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stroll/core/constants/app_assets.dart';
import 'package:stroll/core/extensions/string_api.dart';
import 'package:stroll/features/bonfire/screens/bonfire_page.dart';
import 'package:stroll/features/home/view_models/home_view_model.dart';

enum HomeTab {
  home,
  bonfire,
  messages,
  profile;

  String get iconAsset {
    switch (this) {
      case HomeTab.home:
        return AppAssets.svg.pokerCards;
      case HomeTab.bonfire:
        return AppAssets.svg.bonfire;
      case HomeTab.messages:
        return AppAssets.svg.chatBubble;
      case HomeTab.profile:
        return AppAssets.svg.user;
    }
  }
}

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeStateProvider);
    final homeNotifier = ref.read(homeStateProvider.notifier);

    return Scaffold(
        body: const BonfirePage(),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          currentIndex: homeState.pageIndex,
          onTap: (index) {
            homeNotifier.changePage(index);
          },
          items: [
            for (final tab in HomeTab.values)
              BottomNavigationBarItem(
                label: tab.name.capitalizeFirst(),
                activeIcon: buildIcon(context, true, tab.iconAsset,
                    count: tab.index == 1
                        ? 0
                        : tab.index == 2
                            ? 10
                            : null),
                icon:
                    buildIcon(context, false, tab.iconAsset,  count: tab.index == 1
                    ? 0
                        : tab.index == 2
                        ? 10
                        : null),
              )
          ],
        ));
  }

  Widget buildIcon(BuildContext context, bool selected, String iconAsset,
      {int? count}) {
    return SizedBox(
      width: 40,
      child: Stack(
        children: [
          Center(
            child: SvgPicture.asset(
              alignment: Alignment.topRight,
              iconAsset,
              height: 28,
              color: selected
                  ? Theme.of(context)
                      .bottomNavigationBarTheme
                      .selectedIconTheme
                      ?.color
                  : Theme.of(context)
                      .bottomNavigationBarTheme
                      .unselectedIconTheme
                      ?.color,
            ),
          ),
          if (count != null)
            Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 14,
                width: 20,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 2,
                        strokeAlign: BorderSide.strokeAlignOutside,
                        color: Theme.of(context)
                                .bottomNavigationBarTheme
                                .backgroundColor ??
                            Colors.transparent),
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).primaryColor),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    count > 0 ? count.toString() : ' ',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: Colors.black,
                        fontSize: 7,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
