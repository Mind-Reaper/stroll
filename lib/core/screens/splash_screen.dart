import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stroll/core/constants/app_assets.dart';
import 'package:stroll/core/constants/app_colors.dart';
import 'package:stroll/features/home/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    const duration = Duration(seconds: 2);
    return Scaffold(
      backgroundColor: AppColors.purple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BounceInDown(
              duration: duration,
              child: SvgPicture.asset(
                AppAssets.svg.bonfire,
                height: 150,
                color: Colors.white,
              ),
              onFinish: (_) async {
                await Future.delayed(const Duration(seconds: 1));
                if (!context.mounted) return;
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                    (route) => route.isFirst);
              },
            ),
            JelloIn(
              duration: duration,
              child: Text('stroll',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        const Shadow(
                            offset: Offset(-1, 4), color: Colors.white30),
                        const Shadow(
                            offset: Offset(1, -4),
                            color: Colors.white30,
                            blurRadius: 20)
                      ])),
            ),
          ],
        ),
      ),
    );
  }
}
