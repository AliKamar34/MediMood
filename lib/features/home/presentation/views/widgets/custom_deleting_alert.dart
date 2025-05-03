import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/features/home/data/models/pill_model.dart';
import 'package:new_app/features/home/presentation/manager/get_pills_cubit/get_pills_cubit.dart';

class DeletinPillgAlert extends StatelessWidget {
  const DeletinPillgAlert({
    super.key,
    required this.pillModel,
  });
  final PillModel pillModel;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: const Text('Delete Note'),
      actions: [
        TextButton(
          child: const Text('Cancle'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Delete'),
          onPressed: () {
            pillModel.delete();
            BlocProvider.of<GetPillsCubit>(context)
                .homeRepo
                .deletePill(pillModel);
            BlocProvider.of<GetPillsCubit>(context).getPills();
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
