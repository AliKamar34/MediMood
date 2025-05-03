import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/features/note/data/models/note_model.dart';
import 'package:new_app/features/note/presentation/manager/edit_note_cubit/edit_note_cubit.dart';
import 'package:new_app/features/note/presentation/views/widgets/edit_note_form.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key, required this.noteModel});
  final NoteModel noteModel;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: BlocBuilder<EditNoteCubit, EditNoteState>(
          builder: (context, state) {
            if (state is EditNoteLoading) {
              return const CircularProgressIndicator();
            } else if (state is EditNoteFailuer) {
              return const Text('error');
            } else {
              return EditNoteForm(
                noteModel: noteModel,
              );
            }
          },
        ),
      ),
    );
  }
}
