import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:new_app/core/utils/app_routes.dart';
import 'package:new_app/core/utils/assets_data.dart';
import 'package:new_app/features/splash/presentation/views/widgets/sliding_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    // navigationView();
    initAnimation();
    checkFirstRun();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 25),
          child: SizedBox(
            height: 100,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Image.asset(AssetsData.logo),
            ),
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        SlideingText(slidingAnimation: slidingAnimation),
      ],
    );
  }

  void initAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    slidingAnimation =
        Tween<Offset>(begin: Offset.zero, end: const Offset(0, 7))
            .animate(animationController);

    animationController.forward();
  }

  // void navigationView() {
  //   Future.delayed(
  //     const Duration(seconds: 2),
  //     () {
  //       GoRouter.of(context).pushReplacement(AppRoutes.kNavBarView);
  //     },
  //   );
  // }
  Future<void> checkFirstRun() async {
    final prefs = await SharedPreferences.getInstance();
    final bool isFirstRun = prefs.getBool('isFirstRun') ?? true;

    if (isFirstRun) {
      await prefs.setBool('isFirstRun', false);
      Future.delayed(
        const Duration(seconds: 2),
        () {
          GoRouter.of(context).pushReplacement(AppRoutes.kOnBoardingView);
        },
      );
    } else {
      Future.delayed(
        const Duration(seconds: 2),
        () {
          GoRouter.of(context).pushReplacement(AppRoutes.kNavBarView);
        },
      );
    }
  }
}
