import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/features/note/presentation/manager/add_note_cubit/add_notes_cubit.dart';

import 'package:new_app/features/note/presentation/views/widgets/add_note_form.dart';

class AddNotesViewBody extends StatelessWidget {
  const AddNotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: BlocBuilder<AddNotesCubit, AddNotesState>(
          builder: (context, state) {
            if (state is AddNotesLoading) {
              return const CircularProgressIndicator();
            } else if (state is AddNotesFailuer) {
              return const Text('error');
            } else {
              return const AddNoteForm();
            }
          },
        ),
      ),
    );
  }
}
