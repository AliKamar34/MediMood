import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/core/utils/app_text_style.dart';
import 'package:new_app/features/home/data/repos/home_repo_impl.dart';
import 'package:new_app/features/home/presentation/manager/get_period_pills_cubit/get_period_pills_cubit.dart';
import 'package:new_app/features/home/presentation/views/widgets/meal_period_Pills_list_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    String getMealPeriod() {
      final now = TimeOfDay.now();
      final int currentHour = now.hour;

      if (currentHour >= 7 && currentHour < 13) {
        return 'Breakfast';
      } else if (currentHour >= 13 && currentHour < 19) {
        return 'Lunch';
      } else {
        return 'Dinner';
      }
    }

    String getMealPeriodAppBar() {
      final now = TimeOfDay.now();
      final int currentHour = now.hour;

      if (currentHour >= 7 && currentHour < 13) {
        return AppLocalizations.of(context)!.breakfast;
      } else if (currentHour >= 13 && currentHour < 19) {
        return AppLocalizations.of(context)!.lunch;
      } else {
        return AppLocalizations.of(context)!.dinner;
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              getMealPeriodAppBar(),
              style: AppTextStyle.styleMedium18(context),
            ),
          ),
          Expanded(
            child: BlocProvider(
              create: (context) => GetPeriodPillsCubit(HomeRepoImpl())
                ..getPeriodPills(getMealPeriod()),
              child: const MealPeriodPillsListView(),
            ),
          ),
        ],
      ),
    );
  }
}
