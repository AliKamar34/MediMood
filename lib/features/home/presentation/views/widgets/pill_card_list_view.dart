import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/features/home/presentation/manager/get_pills_cubit/get_pills_cubit.dart';
import 'package:new_app/features/home/presentation/views/widgets/pill_card.dart';

class PillCardListView extends StatelessWidget {
  const PillCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPillsCubit, GetPillsState>(
      builder: (context, state) {
        if (state is GetPillsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetPillsSuccess) {
          return ListView.builder(
            itemCount: state.pills.length,
            itemBuilder: (context, index) {
              return PillCard(
                pillModel: state.pills[index],
              );
            },
          );
        } else if (state is GetPillsFailuer) {
          return Center(
            child: Text(state.message),
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
