import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/features/note/data/models/note_model.dart';
import 'package:new_app/features/note/presentation/manager/get_notes_cubit/get_notes_cubit.dart';

class DeletingAlert extends StatelessWidget {
  const DeletingAlert({
    super.key,
    required this.noteModel,
  });
  final NoteModel noteModel;
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
            noteModel.delete();
            BlocProvider.of<GetNotesCubit>(context).getNotes();
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
