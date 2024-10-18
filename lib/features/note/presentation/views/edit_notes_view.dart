import 'package:flutter/material.dart';
import 'package:new_app/features/note/presentation/views/widgets/edit_notes_view_body.dart';

class EditNotesView extends StatelessWidget {
  const EditNotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: EditNotesViewBody(),
      ),
    );
  }
}
