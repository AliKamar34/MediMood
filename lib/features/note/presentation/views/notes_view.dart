import 'package:flutter/material.dart';
import 'package:new_app/features/note/presentation/views/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: NotesViewBody(),
      ),
    );
  }
}
