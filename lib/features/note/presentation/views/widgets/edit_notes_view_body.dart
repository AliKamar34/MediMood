import 'package:flutter/material.dart';

import 'package:new_app/features/note/presentation/views/widgets/custom_transparent_text_field.dart';
import 'package:new_app/features/note/presentation/views/widgets/edit_note_view_app_bar.dart';
import 'package:new_app/features/note/presentation/views/widgets/full_page_text_field.dart';

class EditNotesViewBody extends StatelessWidget {
  const EditNotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            EditNoteViewAppBar(),
            CustomTransparentTextField(),
            CustomFullTextField(),
          ],
        ),
      ),
    );
  }
}
