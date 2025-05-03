import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/features/note/data/models/note_model.dart';
import 'package:new_app/features/note/presentation/manager/get_notes_cubit/get_notes_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DeletingAlert extends StatelessWidget {
  const DeletingAlert({
    super.key,
    required this.noteModel,
  });
  final NoteModel noteModel;
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
            noteModel.delete();
            BlocProvider.of<GetNotesCubit>(context).getNotes();
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
