import 'package:flutter/material.dart';
import 'package:new_app/features/note/presentation/views/widgets/notes_card_list_view.dart';
import 'package:new_app/features/note/presentation/views/widgets/notes_view_app_bar.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          NotesViewAppBar(),
          Expanded(child: NotesCardListView()),
        ],
      ),
    );
  }
}
