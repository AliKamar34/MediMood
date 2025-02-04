import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/core/services/notifications_service.dart';
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
          final notificationService = NotificationService();
          for (var pill in state.pills) {
            List<String> parts = pill.time.split(" ");
            List<String> timeParts = parts[0].split(":");
            int pillHour = int.parse(timeParts[0]);
            int pillMinute = int.parse(timeParts[1]);
            String period = parts[1];
            if (period == "PM" && pillHour != 12) {
              pillHour += 12;
            } else if (period == "AM" && pillHour == 12) {
              pillHour = 0;
            }
            notificationService.scheduleNotification(
              id: (DateTime.now().millisecondsSinceEpoch % 2147483647) +
                  Random().nextInt(1000),
              title: 'time to take ${pill.pillName}',
              body: 'dont forget to take ${pill.pillName}',
              hour: pillHour,
              minute: pillMinute,
            );
          }

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
