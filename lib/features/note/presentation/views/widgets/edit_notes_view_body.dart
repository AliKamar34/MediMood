import 'package:flutter/material.dart';

import 'package:new_app/features/note/presentation/views/widgets/edit_note_form.dart';

class EditNotesViewBody extends StatelessWidget {
  const EditNotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: EditNoteForm(),
      ),
    );
  }
}
