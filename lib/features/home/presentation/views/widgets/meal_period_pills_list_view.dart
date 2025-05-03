// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/core/utils/app_text_style.dart';
import 'package:new_app/features/home/presentation/manager/get_period_pills_cubit/get_period_pills_cubit.dart';
import 'package:new_app/features/home/presentation/views/widgets/pill_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MealPeriodPillsListView extends StatelessWidget {
  const MealPeriodPillsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPeriodPillsCubit, GetPeriodPillsState>(
      builder: (context, state) {
        if (state is GetPeriodPillsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetPeriodPillsBreakFast) {
          return state.breakfastPills.isEmpty
              ? Center(
                  child: Text(
                    AppLocalizations.of(context)!.noPillsForBreakfast,
                    style: AppTextStyle.styleMedium18(context),
                  ),
                )
              : ListView.builder(
                  itemCount: state.breakfastPills.length,
                  itemBuilder: (context, index) {
                    return PillCard(
                      pillModel: state.breakfastPills[index],
                    );
                  },
                );
        } else if (state is GetPeriodPillsDinner) {
          return state.dinnerPills.isEmpty
              ? Center(
                  child: Text(
                    AppLocalizations.of(context)!.noPillsForDinner,
                    style: AppTextStyle.styleMedium18(context),
                  ),
                )
              : ListView.builder(
                  itemCount: state.dinnerPills.length,
                  itemBuilder: (context, index) {
                    return PillCard(
                      pillModel: state.dinnerPills[index],
                    );
                  },
                );
        } else if (state is GetPeriodPillsLunch) {
          return state.lunchPills.isEmpty
              ? Center(
                  child: Text(
                    AppLocalizations.of(context)!.noPillsForLunch,
                    style: AppTextStyle.styleMedium18(context),
                  ),
                )
              : ListView.builder(
                  itemCount: state.lunchPills.length,
                  itemBuilder: (context, index) {
                    return PillCard(
                      pillModel: state.lunchPills[index],
                    );
                  },
                );
        } else if (state is GetPeriodPillsFailuer) {
          return Center(
            child: Text(state.errMessage),
          );
        } else {
          return Center(
            child: Text(state.toString()),
          );
        }
      },
    );
  }
}
