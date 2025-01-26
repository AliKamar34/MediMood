// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/core/utils/app_text_style.dart';
import 'package:new_app/features/home/presentation/manager/get_period_pills_cubit/get_period_pills_cubit.dart';
import 'package:new_app/features/home/presentation/views/widgets/pill_card.dart';

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
          return ListView.builder(
            itemCount: state.breakfastPills.length,
            itemBuilder: (context, index) {
              return state.breakfastPills.isEmpty
                  ? Center(
                      child: Text(
                        'No pills for breakfast',
                        style: AppTextStyle.styleMedium18(context),
                      ),
                    )
                  : PillCard(
                      pillModel: state.breakfastPills[index],
                    );
            },
          );
        } else if (state is GetPeriodPillsDinner) {
          return ListView.builder(
            itemCount: state.dinnerPills.length,
            itemBuilder: (context, index) {
              return state.dinnerPills.isEmpty
                  ? Center(
                      child: Text(
                        'No pills for dinner',
                        style: AppTextStyle.styleMedium18(context),
                      ),
                    )
                  : PillCard(
                      pillModel: state.dinnerPills[index],
                    );
            },
          );
        } else if (state is GetPeriodPillsLunch) {
          return ListView.builder(
            itemCount: state.lunchPills.length,
            itemBuilder: (context, index) {
              return state.lunchPills.isEmpty
                  ? Center(
                      child: Text(
                        'No pills for lunch',
                        style: AppTextStyle.styleMedium18(context),
                      ),
                    )
                  : PillCard(
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
