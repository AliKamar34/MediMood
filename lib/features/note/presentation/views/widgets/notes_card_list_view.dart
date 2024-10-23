import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/features/note/presentation/manager/get_notes_cubit/get_notes_cubit.dart';
import 'package:new_app/features/note/presentation/views/widgets/notes_card.dart';

class NotesCardListView extends StatelessWidget {
  const NotesCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetNotesCubit, GetNotesState>(
      builder: (context, state) {
        if (state is GetNotesSuccess) {
          return ListView.builder(
            itemCount: state.notes.length,
            itemBuilder: (context, index) {
              return NoteCard(
                noteModel: state.notes[index],
              );
            },
          );
        } else if (state is GetNotesLoading) {
          return const CircularProgressIndicator();
        } else if (state is GetNotesFailuer) {
          return Center(
            child: Text(state.errMessage),
          );
        } else {
          return Center(
            child: Text(state.toString()),
          );
        }
      },
    );
  }
}
