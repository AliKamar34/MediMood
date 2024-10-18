import 'package:flutter/material.dart';
import 'package:new_app/features/note/presentation/views/widgets/notes_card.dart';

class NotesCardListView extends StatelessWidget {
  const NotesCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return const NoteCard();
      },
    );
  }
}
