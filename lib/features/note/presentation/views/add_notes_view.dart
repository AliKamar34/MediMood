import 'package:flutter/material.dart';
import 'package:new_app/features/note/presentation/views/widgets/add_notes_view_body.dart';

class AddNotesView extends StatelessWidget {
  const AddNotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: AddNotesViewBody(),
      ),
    );
  }
}
