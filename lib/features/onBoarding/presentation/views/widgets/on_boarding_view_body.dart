import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:new_app/core/utils/app_routes.dart';
import 'package:new_app/core/utils/assets_data.dart';
import 'package:new_app/features/onBoarding/presentation/views/widgets/on_boarding_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  static final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final List<OnBoardingCard> onBoardingCards = [
      OnBoardingCard(
        image: AssetsData.onBoarding1,
        title: 'Track Your Pills Effortlessly',
        description:
            'Organize your medication into periods for better management and never miss a dose.',
        textButton: 'Next',
        onPressed: () {
          pageController.animateToPage(
            1,
            duration: Durations.long1,
            curve: Curves.linear,
          );
        },
      ),
      OnBoardingCard(
        image: AssetsData.onBoarding2,
        title: 'Add Personal Notes',
        description:
            'Keep track of important notes related to your medication or health status.',
        textButton: 'Next',
        onPressed: () {
          pageController.animateToPage(
            2,
            duration: Durations.long1,
            curve: Curves.linear,
          );
        },
      ),
      OnBoardingCard(
        image: AssetsData.onBoarding3,
        title: 'Stay Organized & Healthy',
        description:
            'Review your schedule and notes to maintain a consistent medication routine.',
        textButton: 'Get Strated',
        onPressed: () {
          GoRouter.of(context).pushReplacement(AppRoutes.kNavBarView);
        },
      ),
    ];
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: PageView(
            controller: pageController,
            children: onBoardingCards,
          ),
        ),
        SmoothPageIndicator(
          controller: pageController,
          count: onBoardingCards.length,
          effect: const WormEffect(
            dotWidth: 10,
            dotHeight: 10,
            activeDotColor: Colors.blue,
          ),
          onDotClicked: (index) {
            pageController.animateToPage(
              index,
              duration: Durations.long1,
              curve: Curves.linear,
            );
          },
        ),
        const SizedBox(
          height: 50,
        )
      ],
    );
  }
}
