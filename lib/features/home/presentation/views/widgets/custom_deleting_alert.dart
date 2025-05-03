import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/features/home/data/models/pill_model.dart';
import 'package:new_app/features/home/presentation/manager/get_pills_cubit/get_pills_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DeletinPillgAlert extends StatelessWidget {
  const DeletinPillgAlert({
    super.key,
    required this.pillModel,
  });
  final PillModel pillModel;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(AppLocalizations.of(context)!.deleteNote),
      actions: [
        TextButton(
          child: Text(AppLocalizations.of(context)!.cancle),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text(AppLocalizations.of(context)!.delete),
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
