import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/features/note/data/repos/note_repo_impl.dart';
import 'package:new_app/features/note/presentation/manager/get_notes_cubit/get_notes_cubit.dart';
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
